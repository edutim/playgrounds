import SwiftUI

struct SplashView: View {
    
    //@var vm: ViewModel
    
    var body: some View {
        ZStack {
            HStack(spacing: 50) {
                VStack(alignment: .leading, spacing: 40) {
                    Image(systemName: "applelogo")
                    //.imageScale(.large)
                        .font(.system(size: 64))
                        .foregroundColor(ViewModel.shared.appAccentColor)
                        .onTapGesture {
                            ViewModel.shared.nextAccentColor()
                        }
                    VStack(alignment:.leading) {
                        Text("Professional")
                        Text("Learning")
                        Text("Compass")
                    }
                    .font(.largeTitle)
                    Text("This interactive tool can help leaders, educators, and IT administrators evaluate where they currently are and where to go next on their professional learning journey.")
                        .frame(maxWidth: 300)
                        .multilineTextAlignment(.leading)
                    
                    Button("Get Started") {
                        ViewModel.shared.showGettingStarted = false
                        ViewModel.shared.showSchoolChooser.toggle()
                    }
                    .buttonStyle(.borderedProminent)
                    
                }
                Image("hero1")
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: 400)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
            }
            .padding(40)
            .interactiveDismissDisabled()
            .background(RoundedRectangle(cornerRadius: 20).foregroundColor(.white))
        }
        .accentColor(ViewModel.shared.appAccentColor)
    }
}
