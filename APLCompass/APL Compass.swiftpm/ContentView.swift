import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var vm: ViewModel
    
    var body: some View {
        ZStack {
            TabView {
                DashboardView()
                    .tabItem {
                        Label("Dashboard", systemImage: "person")
                    }
                LeadershipView()
                    .tabItem {
                        Label("Leadership", systemImage: "graduationcap.fill")
                    }
                EducatorView()
                    .tabItem {
                        Label("Educators", systemImage: "person.2.fill")
                    }
                ITView()
                    .tabItem {
                        Label("IT", systemImage: "desktopcomputer")
                    }
                NotesView()
                    .tabItem {
                        Label("Notes", systemImage: "note.text")
                    }
            }
            
            VStack(alignment: .trailing) {
                HStack {
                    Spacer()
                    Text(vm.currentSchool.name)
                        .font(.caption)
                        .opacity(0.5)
                    Button {
                        vm.showSchoolChooser.toggle()
                    } label: {
                        Image(systemName: "house.circle")
                            .imageScale(.large)
                    }
                }
                .padding()
                Spacer()
            }
            
        }
        .sheet(isPresented: $vm.showGettingStarted) {
            SplashView()
        }
        .accentColor(vm.appAccentColor)
    }
}
