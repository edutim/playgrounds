//
//  StatisticsView.swift
//  Wordle
//
//  Created by Timothy Hart on 2/2/22.
//

import SwiftUI

struct StatisticsView: View {
  @ObservedObject var vm: ViewModel
    var body: some View {
      VStack() {
        Text("STATISTICS")
          .font(.largeTitle)
        Divider()
          .padding(EdgeInsets(top: 0, leading: 10, bottom: 10, trailing: 10))
        Spacer()
        HStack {
          Spacer()
          VStack {
            ZStack {
              Circle()
                .frame(width: 100, height: 100)
                .foregroundColor(.green)
              Text("\(vm.stats.numberOfGamesWon())")
              .font(.largeTitle)
              .foregroundColor(.white)
            }
            Text("Wins")
          }
          Spacer()
          VStack {
            ZStack {
              Circle()
                .frame(width: 100, height: 100)
                .foregroundColor(.gray)
              Text("\(vm.stats.numberOfGamesLost())")
              .font(.largeTitle)
              .foregroundColor(.white)
            }
            Text("Loses")
          }
    
          Spacer()
        }
        Spacer()
          .frame(height: 30)
        VStack {
          ZStack {
            Circle()
              .frame(width: 100, height: 100)
              .foregroundColor(.yellow)
            Text("\(String(vm.stats.averageNumberOfRoundsPerWin()))")
              .font(.largeTitle)
              .foregroundColor(.white)
          }
          Text("Average Number of Rounds Per Win")
        }
        Spacer()
      }
      .padding()
    }
}

struct StatisticsView_Previews: PreviewProvider {
    static var previews: some View {
        StatisticsView(vm: ViewModel())
    }
}
