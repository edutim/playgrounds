import SwiftUI

struct EducatorView: View {
    @EnvironmentObject var vm: ViewModel
    
    var body: some View {
        ZStack {
            Color(uiColor: UIColor.systemGray6)
            ScrollView {
                VStack {
                    HStack {
                        Image(systemName: "person.crop.circle.badge.fill")
                            .font(.largeTitle)
                        Text("Educators")
                            .font(.largeTitle)
                            .foregroundColor(.primary)
                        Spacer()
                    }
                    HStack(spacing: 20) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 20)
                                .foregroundColor(.white)
                            VStack(alignment: .leading) {
                                Text("Ongoing professional learning")
                                    .font(.title)
                                    .padding(.bottom)
                                Text("Innovative learning culture integrates technology that helps faculty members grow both as educators and as learners.\n\nOrganizations that prioritize ongoing professional learning provide a range of opportunities for educators to learn both independently and collaboratively.")
                                    .foregroundColor(.primary)
                            }
                            .padding()
                        }
                        ZStack {
                            RoundedRectangle(cornerRadius: 20)
                                .foregroundColor(.white)
                            VStack(alignment: .leading, spacing: 25) {
                                HStack() {
                                    Text("Curiosity")
                                        .frame(width: 150, alignment: .trailing)
                                        .font(.caption)
                                    ProgressView("", value: vm.educatorsCuriosityProgress)
                                        .frame(width: 300, height: 20)
                                        .progressViewStyle(CustomProgressStyle(strokeColor: .orange))
                                }
                                HStack {
                                    Text("Personalization")
                                        .frame(width: 150, alignment: .trailing)
                                        .font(.caption)
                                    ProgressView("", value: vm.educatorsPersonalizationProgress)
                                        .frame(width: 300, height: 20)
                                        .progressViewStyle(CustomProgressStyle(strokeColor: .orange))
                                }
                                HStack {
                                    Text("Communication")
                                        .frame(width: 150, alignment: .trailing)
                                        .font(.caption)
                                    ProgressView("", value: vm.educatorsCommunicationProgress)
                                        .frame(width: 300, height: 20)
                                        .progressViewStyle(CustomProgressStyle(strokeColor: .orange))
                                }
                                HStack {
                                    Text("Teamwork")
                                        .frame(width: 150, alignment: .trailing)
                                        .font(.caption)
                                    ProgressView("", value: vm.educatorsTeamworkProgress)
                                        .frame(width: 300, height: 20)
                                        .progressViewStyle(CustomProgressStyle(strokeColor: .orange))
                                }
                                HStack {
                                    Text("Critical Thinking")
                                        .frame(width: 150, alignment: .trailing)
                                        .font(.caption)
                                    ProgressView("", value: vm.educatorsCTProgress)
                                        .frame(width: 300, height: 20)
                                        .progressViewStyle(CustomProgressStyle(strokeColor: .orange))
                                }
                                HStack {
                                    Text("Real-World")
                                        .frame(width: 150, alignment: .trailing)
                                        .font(.caption)
                                    ProgressView("", value: vm.educatorsRWProgress)
                                        .frame(width: 300, height: 20)
                                        .progressViewStyle(CustomProgressStyle(strokeColor: .orange))
                                }
                                HStack {
                                    Text("Research")
                                        .frame(width: 150, alignment: .trailing)
                                        .font(.caption)
                                    ProgressView("", value: vm.educatorsResearchProgress)
                                        .frame(width: 300, height: 20)
                                        .progressViewStyle(CustomProgressStyle(strokeColor: .orange))
                                }
                            }
                            .padding()
                            .onChange(of: vm.currentSchool.educatorSections, perform: {i in
                                withAnimation {
                                    vm.calculateEducatorSections()
                                    vm.updateStoredSchoolFromCurrent()
                                }
                            })
                        }
                    }
                    VStack {
                        ForEach($vm.currentSchool.educatorSections) { $section in 
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
            .foregroundColor(.orange)
        }
    }
}

struct EducatorView_Previews: PreviewProvider {
    static var previews: some View {
        EducatorView()
            .environmentObject(ViewModel())
    }
}
