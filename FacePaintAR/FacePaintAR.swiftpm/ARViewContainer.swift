import SwiftUI
import PencilKit

struct ARViewContainer: UIViewRepresentable {
    @Binding var isActive: Bool
    
    let picker: PKToolPicker
    let canvasView: PKCanvasView
    
    func makeUIView(context: Context) -> FacePaintingView {
        let arView = FacePaintingView(frame: .zero)
        arView.setup(canvasView: canvasView)
        return arView
        
    }
    
    func updateUIView(_ uiView: FacePaintingView, context: Context) {
        picker.setVisible(isActive, forFirstResponder: uiView)
        DispatchQueue.main.async {
            uiView.becomeFirstResponder()
        }
    }
    
}
