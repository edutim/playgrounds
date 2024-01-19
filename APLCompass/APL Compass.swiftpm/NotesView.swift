import SwiftUI

struct NotesView: View {
    
    @EnvironmentObject var vm: ViewModel
    
    var body: some View {
        ZStack {
            Color(uiColor: UIColor.systemGray6)
            VStack {
                HStack {
                Text("Notes")
                    .font(.largeTitle)
                    .padding()
                    Spacer()
                    
                }
                TextEditor(text: $vm.currentSchool.notes)
                    .padding()
            }
            .padding()
            .frame(width: 800)
        }
    }
}

struct NotesView_Previews: PreviewProvider {
    static var previews: some View {
        NotesView()
            .environmentObject(ViewModel())
    }
}
