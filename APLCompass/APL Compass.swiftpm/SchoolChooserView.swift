import SwiftUI

struct SchoolChooserView: View {
    @EnvironmentObject var vm: ViewModel
    
    @Environment(\.editMode) private var editMode2
    @State private var editMode = false
    
    var body: some View {
            VStack {
                HStack(spacing: 50) {
                    VStack(alignment: .leading, spacing: 40) {
                        HStack {
                            Image(systemName: "applelogo")
                                .font(.system(size: 32))
                                .foregroundColor(ViewModel.shared.appAccentColor)
                                .onTapGesture {
                                    ViewModel.shared.nextAccentColor()
                                }
                            VStack(alignment:.leading) {
                                Text("Professional")
                                Text("Learning")
                                Text("Compass")
                            }
                            .font(.body)
                        }
                        
                    }
                    Image("hero1")
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: 150)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                }
                .padding(40)
                .background(RoundedRectangle(cornerRadius: 20).foregroundColor(.white))
                VStack {
                    HStack {
                        Text("Schools")
                            .padding()
                            .font(.title)
                        Spacer()
                        HStack {
                            Button {
                                self.editMode.toggle()
                            } label: {
                                Image(systemName: "pencil")
                            }
                            .tint(ViewModel.shared.appAccentColor)
                            .padding()
                            Button(action: {
                                editMode.toggle()
                                
                                withAnimation() {
                                    ViewModel.shared.createNewSchool()
                                }
                                
                            }, label: {
                                Image(systemName: "plus")
                            })
                            .tint(ViewModel.shared.appAccentColor)
                            .padding()
                        }
                    }
                    List() { 
                        ForEach($vm.schools) { $school in
                            
                            if editMode {
                                HStack {
                                    TextField("School Name", text: $school.name)
                                    .textFieldStyle(.roundedBorder)
                                    Spacer()
                                    Button {
                                        editMode = false
                                    } label: {
                                        Image(systemName: "checkmark.circle")
                                    }
                                }
                            } else {
                                Button {
                                    ViewModel.shared.currentSchool = school
                                    ViewModel.shared.showSchoolChooser = false
                                } label: {
                                    Text(school.name)
                                }
                                
                            }
                            
                            
                        }
                        .onDelete(perform: delete)
                        .onMove(perform: move)
                        
                        
                    }
                    .listStyle(.plain)
                    .frame(width: 500)
                }
                .background(RoundedRectangle(cornerRadius: 20).foregroundColor(.white))
                .frame(width: 500)
                .interactiveDismissDisabled()
            
        }
    }
    
    func delete( at offsets: IndexSet) {
        vm.schools.remove(atOffsets: offsets)
    }
    
    func move(from source: IndexSet, to destination: Int) {
        vm.schools.move(fromOffsets: source, toOffset: destination)
    }
}
struct SchoolChooserView_Previews: PreviewProvider {
    static var previews: some View {
        SchoolChooserView()
            .environmentObject(ViewModel())
    }
}
