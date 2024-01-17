// Import SwiftUI to use it's componenets
import SwiftUI

// AVFoundation contains cofe for voice synthesis
import AVFoundation

struct ContentView: View {
    
    // Going Further Idea 1: Add a speech synthesizer to the portrait
    //     Then add a button and have it speak a fact our you.
    @State var synth = AVSpeechSynthesizer()
    
    var body: some View {
        // Stack view on top of each other with a ZStack
        ZStack {
            // The background
            LinearGradient(gradient: Gradient(colors: [.white, .blue]), startPoint: .top, endPoint: .bottom)
            
            // Neck
            Rectangle()
                .frame(width: 80, height: 200)
                .offset(y: 200)
                .foregroundStyle(Color(.sRGB, red: 1, green: 0.8, blue: 0.7))
            
            // Head
            Capsule()
                .frame(width: 250.0, height: 300.0)
                .foregroundStyle(Color(.sRGB, red: 1, green: 0.8, blue: 0.7))
                .shadow(radius: 10)
            
            // Body
            RoundedRectangle(cornerRadius: 70.0)
                .frame(width: 350, height: 400)
                .offset(y: 400)
                .foregroundStyle(Color.red)
            
            // Right Arm Shading
            Rectangle()
                .frame(width: 10, height: 200)
                .offset(x: -100, y: 400)
                .foregroundStyle(.black)
            
            // Left Arm Shading
            Rectangle()
                .frame(width: 10, height: 200)
                .offset(x: 100, y: 400)
                .foregroundStyle(.black)
            
            // Mouth
            Circle()
                .trim(from: 0.5, to: 1.0)
                .frame(width: 100)
                .rotationEffect(.degrees(180), anchor:.center)
                .foregroundStyle(Color.black)
                .offset(x: 0, y: 60)
            
            // Group of hair views. Collected in a group in case you want to expand later.  
            Group {
                Circle()
                    .trim(from: 0.5, to: 1.0)
                    .frame(width: 250)
                    .foregroundStyle(Color.orange)
                    .offset(y: -50)
                Circle()
                    .trim(from: 0.5, to: 1.0)
                    .frame(width: 150)
                    .rotationEffect(.degrees(15), anchor: .center)
                    .foregroundStyle(Color.orange)
                    .offset(x: -40, y: -120)
            }
            
            // Eyes
            Group {
                // Right Eye Background
                Circle()
                    .frame(width: 30)
                    .offset(x: -40, y: -10)
                // Right Eye Pupil
                Circle()
                    .frame(width: 15)
                    .offset(x: -40, y: -10)
                    .foregroundColor(.brown)
                // Left Eye Background
                Circle()
                    .frame(width: 30)
                    .offset(x: 40, y: -10)
                // Left Eye Pupil
                Circle()
                    .frame(width: 15)
                    .offset(x: 40, y: -10)
                    .foregroundColor(.brown)
            }
            
            // Glasses 
            Group {
                // Right Eye Glass
                Rectangle()
                    .stroke(lineWidth: 10.0)
                    .frame(width: 100, height: 50)
                    .foregroundColor(.black)
                    .offset(x: -60, y: -10)
                // Left Eye Glass
                Rectangle()
                    .stroke(lineWidth: 10.0)
                    .frame(width: 100, height: 50)
                    .foregroundColor(.black)
                    .offset(x: 60, y: -10)
            }
            
            // Logo using an SF Symbol
            Image(systemName: "swift")
                .resizable()
                .frame(width: 50, height: 50)
                .offset(x: 0, y: 300)
                .tint(.white)
                // Going Further 
                .onTapGesture {
                    // Create an instance of AVSpeechUtterance of the sentence you want to voice synthesize.
                    let u = AVSpeechUtterance(string: "I love Swift")
                    // Tell the synthesizer to speak
                    synth.speak(u)
                }
        }
    }
}
