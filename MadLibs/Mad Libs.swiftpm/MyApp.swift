import SwiftUI
import AVFoundation

@main
struct MyApp: App {
    
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

class StoryTeller {
    static let synth = AVSpeechSynthesizer()
    
    static func say(story: String) {
        var u = AVSpeechUtterance(string: story)
        synth.speak(u)
    }
}



