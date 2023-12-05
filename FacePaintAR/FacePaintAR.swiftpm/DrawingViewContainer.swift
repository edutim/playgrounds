import SwiftUI
import PencilKit

struct DrawingViewContainer: UIViewRepresentable {
    var canvasView: PKCanvasView
    let picker: PKToolPicker
    
    func makeUIView(context: Context) -> PKCanvasView {
        self.canvasView.tool = PKInkingTool(.pen, color: .black, width: 15)
        self.canvasView.becomeFirstResponder()
        
        return canvasView
    }
    
    func updateUIView(_ uiView: PKCanvasView, context: Context) {
        picker.addObserver(canvasView)
    }
}
