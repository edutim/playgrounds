//
//  SettingsView.swift
//  Wordle
//
//  Created by Timothy Hart on 2/2/22.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
      VStack() {
        Text("SETTINGS")
          .font(.largeTitle)
        Divider()
          .padding(EdgeInsets(top: 0, leading: 10, bottom: 10, trailing: 10))
        Text("There aren't any settings yet.")
        Spacer()
      }
      .padding()
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
