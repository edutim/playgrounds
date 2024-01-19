//
//  ViewModel.swift
//  Wordle
//
//  Created by Timothy Hart on 1/29/22.
//

import Foundation

class ViewModel: ObservableObject {
  
  var game: Game = Game(withCorrectWord: "HELLO")
  var stats: Stats = Stats()
  
  var letterInsertionIndex = 0

  @Published var roundWords: [Word] = [Word(), Word(), Word(), Word(), Word(), Word()]
  
  // These controller the shake animation when a word is not valid OR not in the dictionary
  @Published var invalidWord0Animator = 0.0
  @Published var invalidWord1Animator = 0.0
  @Published var invalidWord2Animator = 0.0
  @Published var invalidWord3Animator = 0.0
  @Published var invalidWord4Animator = 0.0
  @Published var invalidWord5Animator = 0.0
  
  @Published var keyboardStates: [String: LetterType] = [
      "A": .empty, "B": .empty, "C": .empty, "D": .empty, "E": .empty, "F": .empty, "G": .empty, "H": .empty, "I": .empty, "J": .empty, "K": .empty, "L": .empty, "M": .empty, "N": .empty, "O": .empty, "P": .empty, "Q": .empty, "R": .empty, "S": .empty, "T": .empty, "U": .empty, "V": .empty, "W": .empty, "X": .empty, "Y": .empty, "Z": .empty
  ]
  
  @Published var isCurrentGameComplete = false
  
  func startGame() {
    
  }
  
  func newGameWithRandomWord() {
    let word = gameWords.randomElement()
    if let word = word {
      game = Game(withCorrectWord: word)
      //print(game.correctWord)
      letterInsertionIndex = 0
      keyboardStates = [
        "A": .empty, "B": .empty, "C": .empty, "D": .empty, "E": .empty, "F": .empty, "G": .empty, "H": .empty, "I": .empty, "J": .empty, "K": .empty, "L": .empty, "M": .empty, "N": .empty, "O": .empty, "P": .empty, "Q": .empty, "R": .empty, "S": .empty, "T": .empty, "U": .empty, "V": .empty, "W": .empty, "X": .empty, "Y": .empty, "Z": .empty
      ]
      roundWords = [Word(), Word(), Word(), Word(), Word(), Word()]
    }
    isCurrentGameComplete = false
  }
  
  func evaluate(guessedWord: String) {
    // Check is the word is valid first
    guard game.isValid(word: guessedWord) else { print("Word isn't valid. Prompt to redo");   return }
    
    //add characters from the guessed word to guessedCharacters
    game.addGuessedCharacters(inWord: guessedWord)
        
    // Add word to round
    game.addGuessedWord(guessedWord)
    
    let word = Word(word: guessedWord, correctWord: game.correctWord, guessedCharacters: game.guessedCharacters)
    
    roundWords[game.currentRound] = word
    
    // loop of the guessed word and update the view's keyboard state
    for (key,state) in word.characterStates {
      keyboardStates[key] = state
    }
    
    // Check if the word is correct.
    if game.isWordCorrect() {
      gameWon()
    } else {
      //Word is not correct. The game will go to the next round
      if game.currentRound <= 4 {
        print("Word is not correct. Going to the next round")
        nextRound()
      } else {
        print("Word is not correct. You lost this game.")
        endGame()
      }
      
    }
         
  }
  
  func gameWon() {
    //Success. game win
    print("Word is correct")
    game.isGameWon = true
    isCurrentGameComplete = true
    stats.gameWon(game: game)
  }
  
  func endGame() {
    stats.gameLost()
    isCurrentGameComplete = true
  }
  
  func nextRound() {
    game.nextRound()
    letterInsertionIndex = 0
  }
  
  func debug() {
    
  }
  
}
