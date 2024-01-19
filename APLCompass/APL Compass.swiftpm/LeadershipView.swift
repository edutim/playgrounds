import SwiftUI

struct LeadershipView: View {
    
    @EnvironmentObject var vm: ViewModel
    
    var body: some View {
        ZStack {
            Color(uiColor: UIColor.systemGray6)
            ScrollView {
                VStack {
                    HStack {
                        Image(systemName: "person.crop.circle.badge.fill")
                            .font(.largeTitle)
                        Text("Leaders")
                            .font(.largeTitle)
                            .foregroundColor(.primary)
                        Spacer()
                    }
                    HStack(spacing: 20) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 20)
                                .foregroundColor(.white)
                            VStack(alignment: .leading) {
                                Text("Building the foundation for innovation")
                                    .font(.title)
                                    .padding(.bottom)
                                Text("Strong leaders are deeply committed to exploring all possibilities, set meaningful goals to identify progress, celebrate success, make adjustments, and continuously innovate.")
                                    .foregroundColor(.primary)
                            }.padding()
                        }
                        ZStack {
                            RoundedRectangle(cornerRadius: 20)
                                .foregroundColor(.white)
                            VStack(alignment: .leading, spacing: 25) {
                                HStack() {
                                    Text("Team")
                                        .frame(width: 150, alignment: .trailing)
                                        .font(.caption)
                                    ProgressView("", value: vm.leadershipTeamProgress)
                                        .frame(width: 300, height: 20)
                                        .progressViewStyle(CustomProgressStyle(strokeColor: .purple))
                                }
                                HStack {
                                    Text("Vision")
                                        .frame(width: 150, alignment: .trailing)
                                        .font(.caption)
                                    ProgressView("", value: vm.leadershipVisionProgress)
                                        .frame(width: 300, height: 20)
                                        .progressViewStyle(CustomProgressStyle(strokeColor: .purple))
                                }
                                HStack {
                                    Text("Culture")
                                        .frame(width: 150, alignment: .trailing)
                                        .font(.caption)
                                    ProgressView("", value: vm.leadershipCultureProgress)
                                        .frame(width: 300, height: 20)
                                        .progressViewStyle(CustomProgressStyle(strokeColor: .purple))
                                }
                                HStack {
                                    Text("Learning Goals")
                                        .frame(width: 150, alignment: .trailing)
                                        .font(.caption)
                                    ProgressView("", value: vm.leadershipLGProgress)
                                        .frame(width: 300, height: 20)
                                        .progressViewStyle(CustomProgressStyle(strokeColor: .purple))
                                }
                                HStack {
                                    Text("Capacity")
                                        .frame(width: 150, alignment: .trailing)
                                        .font(.caption)
                                    ProgressView("", value: vm.leadershipCapacityProgress)
                                        .frame(width: 300, height: 20)
                                        .progressViewStyle(CustomProgressStyle(strokeColor: .purple))
                                }
                                HStack {
                                    Text("Professional Learning")
                                        .frame(width: 150, alignment: .trailing)
                                        .font(.caption)
                                    ProgressView("", value: vm.leadershipPLProgress)
                                        .frame(width: 300, height: 20)
                                        .progressViewStyle(CustomProgressStyle(strokeColor: .purple))
                                }
                            }
                            .padding()
                            .onChange(of: vm.currentSchool.leaderShipSections, perform: { i in
                                withAnimation {
                                    vm.calculateLeadershipProgress()
                                    vm.updateStoredSchoolFromCurrent()
                                }
                            })
                        }
                    }
                    VStack {
                        ForEach($vm.currentSchool.leaderShipSections) { $section in 
                            SectionView(section: $section)
                                .padding()
                            Divider()
                                .foregroundColor(.accentColor)
                        }
                    }
                    .background(RoundedRectangle(cornerRadius: 20).foregroundColor(.white))
                }
                .padding(40)
            }
            .foregroundColor(.purple)
        }
    }
}

struct LeadershipView_Previews: PreviewProvider {
    static var previews: some View {
        LeadershipView()
            .environmentObject(ViewModel())
    }
}
