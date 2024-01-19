//
//  HowToPlayView.swift
//  Wordle
//
//  Created by Timothy Hart on 2/2/22.
//

import SwiftUI

struct HowToPlayView: View {
    var body: some View {
      VStack(alignment:.leading) {
        HStack {
          Spacer()
          Text("HOW TO PLAY")
            .font(.title)
          Spacer()
        }
        Text("Guess the WORLDE in 6 tries.")
          .padding(EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0))
        Text("Each guess must be a valid 5 letter word. Hit the enter button to submit.")
          .padding(EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0))
        Text("After each guess, the color of the tiles will change to show how close your guess was to the word.")
        Divider()
          .padding(EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0))
        Group {
          Text("Examples")
          Image("howTo")
            .resizable()
            .aspectRatio(contentMode: .fit)
          Text("The letter H is in the word and in the corrent spot.")
            .padding(EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0))
          Text("The letter E is in the word but in the wrong spot.")
            .padding(EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0))
          Text("The letters A, S, and T are not in the word in any spot.")
            .padding(EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0))
        }
        Divider()
          .padding()
        
        Spacer()
      }
      .padding()
    }
}

struct HowToPlayView_Previews: PreviewProvider {
    static var previews: some View {
        HowToPlayView()
    }
}
