import SwiftUI

struct ContentView: View {
    @State var affirmation = ""
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Button("Grateful") {
                    affirmation = "My family"
                }
                .frame(width: 100)
                .buttonStyle(.plain)
                .foregroundStyle(.white)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.blue) 
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.gray, lineWidth: 5) 
                )
                
                Button("Happy") {
                    affirmation = "I know Swift."
                }
                .frame(width: 100)
                .buttonStyle(.plain)
                .foregroundStyle(.white)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.blue) 
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.gray, lineWidth: 5) 
                )
                
                Button("Excited") {
                    affirmation = "For Vision Pro ."
                }
                .frame(width: 100)
                .buttonStyle(.plain)
                .foregroundStyle(.white)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.blue) 
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.gray, lineWidth: 5) 
                )
            }
            Spacer()
            Text(affirmation)
                .font(.custom("Helvetica Neue", size: 50))
                .padding()
                .lineLimit(nil)
                .foregroundStyle(.white)
                .background() {
                    RoundedRectangle(cornerRadius: 25)
                        .foregroundStyle(.cyan)
                        .frame(width: 400, height: 200)
                }
            Spacer()
        }
    }
}
