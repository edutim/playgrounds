//
//  Stats.swift
//  Wordle
//
//  Created by Timothy Hart on 2/2/22.
//

import Foundation


struct Stats {
  private let defaults = UserDefaults.standard
  
  func gameWon(game: Game) {
    var gamesWon = defaults.integer(forKey: "gamesWon")
    gamesWon += 1
    defaults.set(gamesWon, forKey: "gamesWon")
    
    guard let averageRoundsPerWinHolder = defaults.array(forKey: "averageRoundsPerWin") as? [Int] else {
      defaults.set([game.currentRound + 1], forKey: "averageRoundsPerWin")
      return
    }
    var newArray = averageRoundsPerWinHolder
    newArray.append(game.currentRound + 1)
    defaults.set(newArray, forKey: "averageRoundsPerWin")
    
  }
  
  func numberOfGamesWon() -> Int {
    return defaults.integer(forKey: "gamesWon")
  }
  
  func gameLost() {
    var gamesWon = defaults.integer(forKey: "gamesLost")
    gamesWon += 1
    defaults.set(gamesWon, forKey: "")
  }
  
  func numberOfGamesLost() -> Int {
    return defaults.integer(forKey: "gamesLost")
  }
  
  func averageNumberOfRoundsPerWin() -> Double {
    guard let averageRoundsPerWinHolder = defaults.array(forKey: "averageRoundsPerWin") as? [Int] else {
      return 0.0
    }
    let sum = averageRoundsPerWinHolder.reduce(0,+)
    var average = Double(sum) / Double(averageRoundsPerWinHolder.count)
    let returnValue = Double(round(100 * average) / 100)
    return returnValue
  }
  
}
