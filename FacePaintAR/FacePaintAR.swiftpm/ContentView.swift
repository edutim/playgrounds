/*
 See LICENSE folder for this sample’s licensing information.
 */

import SwiftUI
import RealityKit
import ARKit
import Combine
import PencilKit

struct ContentView: View {
    @State private var showPicker = true
    let picker = PKToolPicker()
    var canvasView = PKCanvasView()
    
    
    var body: some View {
        HStack {
            ARViewContainer(isActive: $showPicker, picker: picker, canvasView: canvasView)
                .edgesIgnoringSafeArea(.all)
                .onTapGesture {
                    self.showPicker.toggle()
                }
            DrawingViewContainer(canvasView: canvasView, picker: picker)
        }
    }
}
