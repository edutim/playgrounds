import SwiftUI
import RealityKit
import PencilKit
import Combine
import ARKit

class FacePaintingView: ARView {
    
    var lastTouchPoint: UITouch?
    var startNewLine = false
    var subscription: Cancellable?
    var faceEntity: HasModel? = nil
    var canvasView: PKCanvasView!
    var sparklyNormalMap: TextureResource!
    
    static let sceneUnderstandingQuery = EntityQuery(where: .has(SceneUnderstandingComponent.self) && .has(ModelComponent.self))
    
    required init(frame: CGRect) {
        super.init(frame: frame)
        isMultipleTouchEnabled = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        isMultipleTouchEnabled = true
    }
    
    override var canBecomeFirstResponder: Bool { true }
    
    func setup(canvasView: PKCanvasView) {
        self.canvasView = canvasView
        self.canvasView.delegate = self
        
        do {
            sparklyNormalMap = try TextureResource.load(named: "sparkly")
        } catch {
            assertionFailure("Error loading sparkle map: \(error).")
        }
        
        let configuration = ARFaceTrackingConfiguration()
        session.run(configuration)
        
        subscription = scene.subscribe(to: SceneEvents.Update.self, onUpdate)
        
        let anchorEntity = AnchorEntity(.world(transform: .init(diagonal: [1, 1, 1, 1])))
        
        scene.anchors.append(anchorEntity)
    }
    
    func updateFaceTextureWithLatestDrawing() {
        let frameSize = canvasView.frame.size
        
        let newImage = canvasView.drawing
            .transformed(using: .init(scaleX: 1.0, y: -1.0).translatedBy(x: 0, y: -CGFloat(frameSize.height)))
            .image(from: .init(x: 0, y: 0, width: frameSize.width, height: frameSize.height), scale: 1.0)
        if let cgImage = newImage.cgImage {
            updateFaceEntityTextureUsing(cgImage: cgImage)
        } else {
            assertionFailure("Couldn't get a CGImage from the drawing.")
        }
    }
    
    func updateFaceEntityTextureUsing(cgImage: CGImage) {
        guard let faceEntity = self.faceEntity,
              let faceTexture = try? TextureResource.generate(from: cgImage,
                                                              options: .init(semantic: .color))
        else { return }
        
        var faceMaterial = PhysicallyBasedMaterial()
        faceMaterial.baseColor.texture = PhysicallyBasedMaterial.Texture(faceTexture)
        faceMaterial.roughness = 0.1
        faceMaterial.metallic = 1.0
        faceMaterial.blending = .transparent(opacity: .init(scale: 1.0))
        faceMaterial.opacityThreshold = 0.5
        
        faceMaterial.normal.texture = PhysicallyBasedMaterial.Texture(sparklyNormalMap)
        
        faceEntity.model!.materials = [faceMaterial]
    }
    
    /// This method sets a new drawing and registers an undo action to go back to the previous drawing.
    func setDrawingUndoable(_ drawing: PKDrawing) {
        let oldDrawing = canvasView.drawing
        undoManager?.registerUndo(withTarget: self) {
            $0.setDrawingUndoable(oldDrawing)
        }
        canvasView.drawing = drawing
        updateFaceTextureWithLatestDrawing()
    }
    
    /// This method finds the face model in a scene and returns it.
    func findFaceEntity(scene: RealityKit.Scene) -> HasModel? {
        
        let faceEntity = scene.performQuery(Self.sceneUnderstandingQuery).first {
            $0.components[SceneUnderstandingComponent.self]?.entityType == .face
        }
        
        return faceEntity as? HasModel
    }
    
    func onUpdate(_ event: Event) {
        guard let faceEntity = self.faceEntity else {
            self.faceEntity = findFaceEntity(scene: scene)
            return
        }
        guard let lastTouchPoint = lastTouchPoint else {
            return
        }
        
        let lastTouchLocation = lastTouchPoint.location(in: self)
        
        guard let ray = self.ray(through: lastTouchLocation),
              let raycastResult = RaycastResult(ray: Ray(origin: ray.origin, direction: ray.direction), entity: faceEntity) else {
                  return
              }
        
        let uv = raycastResult.uv
        
        guard let inkTool = canvasView.tool as? PKInkingTool else {
            print("Unsupported Tool")
            return
        }
        
        let frameSize = canvasView.frame.size
        
        let newLocation = CGPoint(x: CGFloat(uv.x) * frameSize.width, y: CGFloat(uv.y) * frameSize.height)
        let newPoint = PKStrokePoint(location: newLocation,
                                     timeOffset: 0,
                                     size: CGSize(width: max(3, inkTool.width), height: max(3, inkTool.width)),
                                     opacity: inkTool.color.cgColor.alpha,
                                     force: lastTouchPoint.force,
                                     azimuth: lastTouchPoint.azimuthAngle(in: self),
                                     altitude: lastTouchPoint.altitudeAngle
        )
        
        if startNewLine {
            startNewLine = false
            let drawingToUndoTo = canvasView.drawing
            undoManager?.registerUndo(withTarget: self) {
                $0.setDrawingUndoable(drawingToUndoTo)
            }
            
            let newStrokePath = PKStrokePath(controlPoints: [newPoint], creationDate: NSDate.now)
            let newStroke = PKStroke(ink: inkTool.ink, path: newStrokePath)
            canvasView.drawing.strokes.append(newStroke)
        } else {
            let lastStroke = canvasView.drawing.strokes.last!
            var points = lastStroke.path.map { $0 }
            points.append(newPoint)
            let newStrokePath = PKStrokePath(controlPoints: points, creationDate: NSDate.now)
            canvasView.drawing.strokes[canvasView.drawing.strokes.endIndex - 1].path = newStrokePath
        }
        
        updateFaceTextureWithLatestDrawing()
    }
}

extension FacePaintingView {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        lastTouchPoint = touches.first
        startNewLine = true
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        lastTouchPoint = touches.first
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        lastTouchPoint = nil
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        lastTouchPoint = nil
    }
}

extension FacePaintingView: PKCanvasViewDelegate {
    func canvasViewDrawingDidChange(_ canvasView: PKCanvasView) {
        updateFaceTextureWithLatestDrawing()
    }
}
