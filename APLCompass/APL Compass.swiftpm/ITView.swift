import SwiftUI

struct ITView: View {
    
    @EnvironmentObject var vm: ViewModel
    
    var body: some View {
        ZStack {
            Color(uiColor: UIColor.systemGray6)
            ScrollView {
                VStack {
                    HStack {
                        Image(systemName: "desktopcomputer")
                            .font(.largeTitle)
                        Text("IT")
                            .font(.largeTitle)
                            .foregroundColor(.primary)
                        Spacer()
                    }
                    HStack(spacing: 20) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 20)
                                .foregroundColor(.white)
                            VStack(alignment: .leading) {
                                Text("An integrated team is core to success")
                                    .font(.title)
                                    .padding(.bottom)
                                Text("Today's technology managers can establish a deployment leadership team with indtructional and nontechnical staff tomanage devices, content, and workflows in the classroom.")
                                    .foregroundColor(.primary)
                            }
                            .padding()
                        }
                        
                        ZStack {
                            RoundedRectangle(cornerRadius: 20)
                                .foregroundColor(.white)
                            VStack(alignment: .leading, spacing: 25) {
                                HStack() {
                                    Text("Vision")
                                        .frame(width: 150, alignment: .trailing)
                                        .font(.caption)
                                    ProgressView("", value: vm.itVisionProgress)
                                        .frame(width: 300, height: 20)
                                        .progressViewStyle(CustomProgressStyle(strokeColor: .blue))
                                }
                                HStack {
                                    Text("Infrastructure")
                                        .frame(width: 150, alignment: .trailing)
                                        .font(.caption)
                                    ProgressView("", value: vm.itInfrastructureProgress)
                                        .frame(width: 300, height: 20)
                                        .progressViewStyle(CustomProgressStyle(strokeColor: .blue))
                                }
                                HStack {
                                    Text("Device")
                                        .frame(width: 150, alignment: .trailing)
                                        .font(.caption)
                                    ProgressView("", value: vm.itDeviceProgress)
                                        .frame(width: 300, height: 20)
                                        .progressViewStyle(CustomProgressStyle(strokeColor: .blue))
                                }
                                HStack {
                                    Text("Teacher")
                                        .frame(width: 150, alignment: .trailing)
                                        .font(.caption)
                                    ProgressView("", value: vm.itTeacherProgress)
                                        .frame(width: 300, height: 20)
                                        .progressViewStyle(CustomProgressStyle(strokeColor: .blue))
                                }
                                HStack {
                                    Text("Student")
                                        .frame(width: 150, alignment: .trailing)
                                        .font(.caption)
                                    ProgressView("", value: vm.itStudentProgress)
                                        .frame(width: 300, height: 20)
                                        .progressViewStyle(CustomProgressStyle(strokeColor: .blue))
                                }
                            }
                            .padding()
                            .onChange(of: vm.currentSchool.itSections, perform: {i in
                                withAnimation {
                                    vm.calculateITSections()
                                    vm.updateStoredSchoolFromCurrent()
                                }
                            })
                        }
                    }
                    VStack {
                        ForEach($vm.currentSchool.itSections) { $section in 
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
            .foregroundColor(.blue)
        }
    }
}

struct ITView_Previews: PreviewProvider {
    static var previews: some View {
        ITView()
            .environmentObject(ViewModel())
    }
}
