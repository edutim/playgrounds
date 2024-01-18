import SwiftUI

struct ContentView: View {
    
    @AppStorage("animal") var animal: String = ""
    @AppStorage("adverb") var adverb: String = ""
    @AppStorage("adjective") var adjective: String = ""
    @AppStorage("color") var color: String = ""
    @AppStorage("city") var city: String = ""
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.yellow
                VStack {
                    HStack {
                        Image(systemName: "smiley")
                            .imageScale(.large)
                            .font(.system(size: 50, weight: .bold))
                        Text("Mad Libs")
                            .font(.system(size: 50, weight: .bold))
                    }
                    Divider()
                    
                    TextField("List an animal", text: $animal)
                        .padding()
                        .background()
                        .cornerRadius(13)
                        .padding()
                    
                    TextField("Share an adverb", text: $adverb)
                        .padding()
                        .background()
                        .cornerRadius(13)
                        .padding()
                    
                    TextField("Share an adjective", text: $adjective)
                        .padding()
                        .background()
                        .cornerRadius(13)
                        .padding()
                    
                    TextField("What's your favorite color", text: $color)
                        .padding()
                        .background()
                        .cornerRadius(13)
                        .padding()
                    
                    TextField("List an amazing city", text: $city)
                        .padding()
                        .background()
                        .cornerRadius(13)
                        .padding()
                    
                    NavigationLink("Create Story"){
                        StoryView(story: createStory())
                    }
                    .buttonStyle(.borderedProminent)
                    
                    Button("Clear Story") {
                        animal = ""
                        adverb = ""
                        adjective = ""
                        color = ""
                        city = ""
                    }
                    .tint(.red)
                    .padding()
                }
            }
        }.navigationViewStyle(.stack)
    }
    
    func createStory() -> String {
        let story = "One day while walking through \(city), I walked upon a \(color) \(animal). I was stunned. This magnificent \(animal) looked \(adjective) as he \(adverb) went behind the building. As soon as he appeared, he was gone again."
        
        return story
    }
}
