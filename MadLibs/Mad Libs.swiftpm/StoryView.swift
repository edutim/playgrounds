import SwiftUI

struct StoryView: View {
     
    var story: String
    
    var body: some View {
        ZStack {
            Color.yellow
                .edgesIgnoringSafeArea(.all)
            VStack(spacing: 40) {
                Text("My Story")
                    .font(.largeTitle)
                    .foregroundStyle(Color.blue)
                
                Text(story) 
                    .font(.title)
                    .padding()
                
                Button("Tell me") {
                    StoryTeller.say(story: story)
                }
                .buttonStyle(.borderedProminent)
                
            }
        }
    }
        
    
    
}
