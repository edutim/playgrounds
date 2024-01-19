//
//  ContentView.swift
//  Wordle
//
//  Created by Timothy Hart on 1/29/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var vm: ViewModel = ViewModel()
    
    @State var currentGuess = ""
    
    @State var showHowTo = false
    @State var showStats = false
    @State var showSettings = false
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Button(action: {
                        showHowTo = true
                    }, label: {
                        Image(systemName: "questionmark.circle")
                    })
                    .sheet(isPresented: $showHowTo) {
                        HowToPlayView()
                    }
                    Spacer()
                    Text("WORDLE")
                        .font(.largeTitle)
                    Spacer()
                    Button(action: {
                        showStats = true
                    }, label: {
                        Image(systemName: "chart.bar.xaxis")
                    })
                    .sheet(isPresented: $showStats) {
                        StatisticsView(vm: vm)
                    }
                    Button(action: {
                        showSettings = true
                    }, label: {
                        Image(systemName: "gearshape.fill")
                    })
                    .sheet(isPresented: $showSettings) {
                        SettingsView()
                    }
                }
                .padding()
                Divider()
                    .padding(EdgeInsets(top: 0, leading: 10, bottom: 10, trailing: 10))
                Spacer()
                Group {
                    HStack {
                        tile(forRound: 0, forLetterPosition: 0)
                        tile(forRound: 0, forLetterPosition: 1)
                        tile(forRound: 0, forLetterPosition: 2)
                        tile(forRound: 0, forLetterPosition: 3)
                        tile(forRound: 0, forLetterPosition: 4)
                    }
                    .modifier(Shake(animatableData: vm.invalidWord0Animator))
                    
                    HStack {
                        tile(forRound: 1, forLetterPosition: 0)
                        tile(forRound: 1, forLetterPosition: 1)
                        tile(forRound: 1, forLetterPosition: 2)
                        tile(forRound: 1, forLetterPosition: 3)
                        tile(forRound: 1, forLetterPosition: 4)
                    }
                    .modifier(Shake(animatableData: vm.invalidWord1Animator))
                    HStack {
                        tile(forRound: 2, forLetterPosition: 0)
                        tile(forRound: 2, forLetterPosition: 1)
                        tile(forRound: 2, forLetterPosition: 2)
                        tile(forRound: 2, forLetterPosition: 3)
                        tile(forRound: 2, forLetterPosition: 4)
                    }
                    .modifier(Shake(animatableData: vm.invalidWord2Animator))
                    HStack {
                        tile(forRound: 3, forLetterPosition: 0)
                        tile(forRound: 3, forLetterPosition: 1)
                        tile(forRound: 3, forLetterPosition: 2)
                        tile(forRound: 3, forLetterPosition: 3)
                        tile(forRound: 3, forLetterPosition: 4)
                    }
                    .modifier(Shake(animatableData: vm.invalidWord3Animator))
                    HStack {
                        tile(forRound: 4, forLetterPosition: 0)
                        tile(forRound: 4, forLetterPosition: 1)
                        tile(forRound: 4, forLetterPosition: 2)
                        tile(forRound: 4, forLetterPosition: 3)
                        tile(forRound: 4, forLetterPosition: 4)
                    }
                    .modifier(Shake(animatableData: vm.invalidWord4Animator))
                    HStack {
                        tile(forRound: 5, forLetterPosition: 0)
                        tile(forRound: 5, forLetterPosition: 1)
                        tile(forRound: 5, forLetterPosition: 2)
                        tile(forRound: 5, forLetterPosition: 3)
                        tile(forRound: 5, forLetterPosition: 4)
                    }
                    .modifier(Shake(animatableData: vm.invalidWord5Animator))
                }
                .fixedSize()
                
                Spacer()
                KeyboardView(currentGuess: $currentGuess, vm: vm)
                Spacer()
                
                Button("New Game") {
                    vm.newGameWithRandomWord()
                }
                .disabled(!vm.isCurrentGameComplete)
                .padding()
            }
            .onAppear() {
                vm.newGameWithRandomWord()
            }
        }
    }
    
    @ViewBuilder
    func tile(forRound: Int, forLetterPosition: Int) -> some View {
        let word = vm.roundWords[forRound]
        let letter = word.letters[forLetterPosition]
        let character = word.letters[forLetterPosition].character
        switch letter.state {
        case .empty:
            Text(character)
                .font(.title)
                .frame(width: 25,height: 25)
            //.frame(maxWidth: .infinity, maxHeight: .infinity)
                .padding()
                .border(Color.gray, width: 2)
                .background(Color.clear)
            //.font(.largeTitle)
            //.font(.system(size: 16, weight: .bold, design: .rounded))
                .foregroundColor(Color.primary)
                .transition(.scale)
        case .notInWord:
            Text(character)
                .frame(width: 25,height: 25)
            //.frame(maxWidth: .infinity, maxHeight: .infinity)
                .padding()
                .border(Color.gray, width: 5)
                .background(Color.gray)
                .font(.title)
            //.font(.system(size: 16, weight: .bold, design: .rounded))
                .foregroundColor(Color.white)
                .transition(.scale)
        case .inWord:
            Text(character)
                .frame(width: 25,height: 25)
            //.frame(maxWidth: .infinity, maxHeight: .infinity)
                .padding()
                .background(Color.yellow)
                .font(.title)
            //.font(.system(size: 16, weight: .bold, design: .rounded))
                .foregroundColor(Color.white)
                .transition(.scale)
        case .correctPosition:
            Text(character)
                .frame(width: 25,height: 25)
            //.frame(maxWidth: .infinity, maxHeight: .infinity)
                .padding()
                .background(Color.green)
                .font(.title)
            //.font(.system(size: 16, weight: .bold, design: .rounded))
                .foregroundColor(Color.white)
                .transition(.scale)
        }
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct GameBoardView: View {
    @Binding var currentGuess: String
    @ObservedObject var vm: ViewModel
    
    var body: some View {
        VStack {
            HStack {
                WordView(currentGuess: $currentGuess, vm: vm, roundIndex: 0)
            }
            HStack {
                WordView(currentGuess: $currentGuess, vm: vm, roundIndex: 1)
            }
            HStack {
                WordView(currentGuess: $currentGuess, vm: vm, roundIndex: 2)
            }
            HStack {
                WordView(currentGuess: $currentGuess, vm: vm, roundIndex: 3)
            }
            HStack {
                WordView(currentGuess: $currentGuess, vm: vm, roundIndex: 4)
            }
            HStack {
                WordView(currentGuess: $currentGuess, vm: vm, roundIndex: 5)
            }
        }
    }
}

struct WordView: View {
    @Binding var currentGuess: String
    @ObservedObject var vm: ViewModel
    var roundIndex: Int
    
    var body: some View {
        HStack {
            //      ForEach(vm.roundWords[roundIndex], id: \.self) { item in
            //        Text(item)
            //      }
        }
    }
}

struct LetterView: View {
    var letter: String?
    var body: some View {
        if let letter = letter {
            Text(letter)
        } else {
            Text("-")
        }
    }
}



struct KeyboardView: View {
    @Binding var currentGuess: String
    @ObservedObject var vm: ViewModel
    
    var body: some View {
        VStack {
            HStack {
                KeyView(letter: "Q", currentGuess: $currentGuess, vm: vm)
                KeyView(letter: "W", currentGuess: $currentGuess, vm: vm)
                KeyView(letter: "E", currentGuess: $currentGuess, vm: vm)
                KeyView(letter: "R", currentGuess: $currentGuess, vm: vm)
                KeyView(letter: "T", currentGuess: $currentGuess, vm: vm)
                KeyView(letter: "Y", currentGuess: $currentGuess, vm: vm)
                KeyView(letter: "U", currentGuess: $currentGuess, vm: vm)
                KeyView(letter: "I", currentGuess: $currentGuess, vm: vm)
                KeyView(letter: "O", currentGuess: $currentGuess, vm: vm)
                KeyView(letter: "P", currentGuess: $currentGuess, vm: vm)
            }
            .fixedSize()
            .frame(maxHeight: 50)
            HStack {
                KeyView(letter: "A", currentGuess: $currentGuess, vm: vm)
                KeyView(letter: "S", currentGuess: $currentGuess, vm: vm)
                KeyView(letter: "D", currentGuess: $currentGuess, vm: vm)
                KeyView(letter: "F", currentGuess: $currentGuess, vm: vm)
                KeyView(letter: "G", currentGuess: $currentGuess, vm: vm)
                KeyView(letter: "H", currentGuess: $currentGuess, vm: vm)
                KeyView(letter: "J", currentGuess: $currentGuess, vm: vm)
                KeyView(letter: "K", currentGuess: $currentGuess, vm: vm)
                KeyView(letter: "L", currentGuess: $currentGuess, vm: vm)
            }
            .fixedSize()
            .frame(maxHeight: 50)
            HStack {
                EnterKeyView(vm: vm)
                KeyView(letter: "Z", currentGuess: $currentGuess, vm: vm)
                KeyView(letter: "X", currentGuess: $currentGuess, vm: vm)
                KeyView(letter: "C", currentGuess: $currentGuess, vm: vm)
                KeyView(letter: "V", currentGuess: $currentGuess, vm: vm)
                KeyView(letter: "B", currentGuess: $currentGuess, vm: vm)
                KeyView(letter: "N", currentGuess: $currentGuess, vm: vm)
                KeyView(letter: "M", currentGuess: $currentGuess, vm: vm)
                DeleteKeyView(vm: vm)
            }
            .fixedSize()
            .frame(maxHeight: 50)
        }
    }
}

struct EnterKeyView: View {
    @ObservedObject var vm: ViewModel
    var body: some View {
        Button("ENTER") {
            
            if vm.game.currentRound <= 5 {
                if !vm.game.isValid(word: vm.roundWords[vm.game.currentRound].word) {
                    switch vm.game.currentRound {
                    case 0:
                        withAnimation() {
                            vm.invalidWord0Animator += 1
                        }
                    case 1:
                        withAnimation() {
                            vm.invalidWord1Animator += 1
                        }
                    case 2:
                        withAnimation() {
                            vm.invalidWord2Animator += 1
                        }
                    case 3:
                        withAnimation() {
                            vm.invalidWord3Animator += 1
                        }
                    case 4:
                        withAnimation() {
                            vm.invalidWord4Animator += 1
                        }
                    case 5:
                        withAnimation() {
                            vm.invalidWord5Animator += 1
                        }
                    default:
                        print("")
                    }
                }
                withAnimation() {
                    vm.evaluate(guessedWord: vm.roundWords[vm.game.currentRound].word)
                }
            } else {
                print("No more rounds available")
            }
            
            
        }
        .padding(5)
        .frame( height: 40)
        .font(.system(size: 16, weight: .bold, design: .rounded))
        .foregroundColor(.gray)
        .background(Color(.systemGray6))
        .clipShape(RoundedRectangle(cornerRadius: 4.0))
    }
}

struct DeleteKeyView: View {
    @ObservedObject var vm: ViewModel
    var body: some View {
        Button(action: {
            if vm.letterInsertionIndex > 0 && vm.letterInsertionIndex <= 5 {
                vm.letterInsertionIndex -= 1
                
                vm.roundWords[vm.game.currentRound].replaceLetter(at: vm.letterInsertionIndex, with: " ")
            }
        }, label: {
            Image(systemName: "delete.left")
        })
        .padding(10)
        .frame( height: 40)
        .font(.system(size: 16, weight: .bold, design: .rounded))
        .foregroundColor(.gray)
        .background(Color(.systemGray6))
        .clipShape(RoundedRectangle(cornerRadius: 4.0))
    }
}

struct KeyView: View {
    
    var letter: String
    
    @Binding var currentGuess: String
    @ObservedObject var vm: ViewModel
    
    var body: some View {
        button(forLetter: letter)
    }
    
    func butttonAction() {
        if vm.letterInsertionIndex <= 4 {
            
            vm.roundWords[vm.game.currentRound].replaceLetter(at: vm.letterInsertionIndex, with: letter)
            
            vm.letterInsertionIndex += 1
        }
    }
    
    @ViewBuilder
    func button(forLetter letter: String) -> some View {
        let currentLetterState = vm.keyboardStates[letter]
        switch currentLetterState {
        case .empty:
            Button(letter) {
                butttonAction()
            }
            .frame(maxHeight: .infinity)
            .normalButtonStyle()
        case .notInWord:
            Button(letter) {
                butttonAction()
            }
            .frame(maxHeight: .infinity)
            .notInWordButtonStyle()
        case .inWord:
            Button(letter) {
                butttonAction()
            }
            .frame(maxHeight: .infinity)
            .inWordButtonStyle()
        case .correctPosition:
            Button(letter) {
                butttonAction()
            }
            .frame(maxHeight: .infinity)
            .correctPositionButtonStyle()
        case .none:
            Button(letter) {
                butttonAction()
            }
            .frame(maxHeight: .infinity)
            .normalButtonStyle()
        }
        
    }
}
