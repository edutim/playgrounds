import SwiftUI

struct CustomProgressStyle: ProgressViewStyle {
    var strokeColor: Color
    var strokeWidth = 25.0
    
    func makeBody(configuration: Configuration) -> some View {
        let fractionCompleted = configuration.fractionCompleted ?? 0
        
        return ZStack {
            GeometryReader { geometry in
                ZStack(alignment: .leading) {
                    Rectangle().frame(width: geometry.size.width , height: geometry.size.height)
                        .opacity(0.3)
                        .foregroundColor(Color.gray)
                    
                    Rectangle().frame(width: min(CGFloat(fractionCompleted)*geometry.size.width, geometry.size.width), height: geometry.size.height)
                        .foregroundColor(strokeColor)
                        
                }
                .cornerRadius(45.0)
                
            }
                
            
        }
    }
}
