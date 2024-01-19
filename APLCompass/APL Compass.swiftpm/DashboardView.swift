import SwiftUI

struct DashboardView: View {
    
    @EnvironmentObject var vm: ViewModel
    
    var body: some View {
        ZStack {
            Color(uiColor: UIColor.systemGray6)
            VStack(alignment: .leading) {
                HStack {
                    Text(vm.currentSchool.name)
                        .font(.system(size: 64))
                }
                VStack(spacing: 50){
                    HStack {
                        Image(systemName: "person.crop.circle.badge.fill")
                            .font(.largeTitle)
                            .frame(width: 50)
                            .foregroundColor(.purple)
                        VStack {
                            Text("Leaders")
                                .font(.title)
                                .foregroundColor(.purple)
                        }
                        .frame(width: 175)
                        VStack {
                        ProgressView("", value: vm.leadershipProgress)
                            .frame(width: 500, height: 20)
                            .progressViewStyle(CustomProgressStyle(strokeColor: .purple))
                            Text(vm.leadershipProgressBlurb)
                                .font(.caption)
                        }
                    }
                    HStack {
                        Image(systemName: "person.2.fill")
                            .font(.largeTitle)
                            .frame(width: 50)
                            .foregroundColor(.orange)
                        VStack {
                            Text("Educators")
                                .font(.title)
                                .foregroundColor(.orange)
                            
                        }
                        .frame(width: 175)
                        VStack {
                        ProgressView("", value: vm.educatorsProgress)
                            .frame(width: 500, height: 20)
                            .progressViewStyle(CustomProgressStyle(strokeColor: .orange))
                            Text(vm.educatorsProgressBlurb)
                                .font(.caption)
                        }
                    }
                    HStack {
                        Image(systemName: "desktopcomputer")
                            .font(.largeTitle)
                            .frame(width: 50)
                            .foregroundColor(.blue)
                        VStack {
                            Text("IT")
                                .font(.title)
                                .foregroundColor(.blue)
                        }
                        .frame(width: 175)
                        VStack {
                        ProgressView("", value: vm.itProgress)
                            .frame(width: 500, height: 20)
                            .progressViewStyle(CustomProgressStyle(strokeColor: .blue))
                            Text(vm.itProgressBlurb)
                                .font(.caption)
                                .padding(0)
                    }
                    }
                }
                .frame(width: 800)
                .padding(50)
                .background() {
                    RoundedRectangle(cornerRadius: 20)
                        .foregroundColor(.white)
                }
                VStack {
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Learn More")
                                .font(.title)
                            Text("Apple Professional Learning Specialists help leaders, educators, and IT administrators engage students in deeper learning experiences.")
                            Button {
                                //email
                            } label: {
                                Text("Email Us")
                            }
                            .buttonStyle(.borderedProminent)
                        }
                        Image("hero2")
                            .resizable()
                            .scaledToFit()
                            .frame(maxWidth: 400)
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                    }
                }
                .frame(width: 800)
                .padding(50)
                .background() {
                    RoundedRectangle(cornerRadius: 20)
                        .foregroundColor(.white)
                }
                
            }
        }
        .onAppear() {
            vm.calculateLeadershipProgress()
            vm.calculateEducatorSections()
            vm.calculateITSections()
        }
        .sheet(isPresented: $vm.showSchoolChooser) {
            SchoolChooserView()
                .environmentObject(ViewModel.shared)
        }
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
            .environmentObject(ViewModel())
    }
}
