import SwiftUI

struct SectionView: View {
    
    @Binding var section: Section
    
    var body: some View {
        
        HStack {
            VStack(alignment: .leading) {
                Image(systemName: section.imageName)
                    .imageScale(.large)
                Text(section.title)
                    .font(.largeTitle)
                    .foregroundColor(.primary)
                    .tint(.purple)
                    .multilineTextAlignment(.leading)
                    .lineLimit(nil)
                    .fixedSize(horizontal: false, vertical: true)
                Text(section.blurb)
                    .foregroundColor(.primary)
                    .multilineTextAlignment(.leading)
                    .lineLimit(nil)
                    .fixedSize(horizontal: false, vertical: true)
            }
            .frame(width: 300)
            Color.clear
                .frame(width: 100)
            VStack(alignment: .trailing) {
                ForEach($section.items) { $item in
                    HStack {
                        Text(item.title)
                            .foregroundColor(.primary)
                            .lineLimit(3)
                        Spacer()
                        Picker("", selection: $item.level) {
                            Text("Low").tag("Low")
                            Text("Medium").tag("Medium")
                            Text("High").tag("High")
                        }
                        .pickerStyle(.segmented)
                        .frame(width: 200)
                    }
                    Divider()
                }
                
            }
            
        }
    }
}

struct SectionView_Previews: PreviewProvider {
    static var previews: some View {
        SectionView(section: .constant(Section(id: UUID(), imageName: "", title: "", blurb: "", items: [SectionItem]())))
    }
}
