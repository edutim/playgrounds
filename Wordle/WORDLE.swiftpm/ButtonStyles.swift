//
//  ButtonStyles.swift
//  Wordle
//
//  Created by Timothy Hart on 2/1/22.
//

import Foundation
import SwiftUI

let keyWidth: CGFloat = 30
let keyHeight: CGFloat = 40

struct NormalButtonStyle: ViewModifier {
  func body(content: Content) -> some View {
    content
      .frame(width: keyWidth, height: keyHeight)
      .font(.system(size: 16, weight: .bold, design: .rounded))
      .foregroundColor(.gray)
      .background(Color(.systemGray6))
      .clipShape(RoundedRectangle(cornerRadius: 4.0))
  }
}

extension View {
  func normalButtonStyle() -> some View {
    modifier(NormalButtonStyle())
  }
}

//---

struct NotInWordButtonStyle: ViewModifier {
  func body(content: Content) -> some View {
    content
      .frame(width: keyWidth, height: keyHeight)
      .font(.system(size: 16, weight: .bold, design: .rounded))
      .foregroundColor(.gray)
      .background(Color(.systemGray3))
      .clipShape(RoundedRectangle(cornerRadius: 4.0))
  }
}

extension View {
  func notInWordButtonStyle() -> some View {
    modifier(NotInWordButtonStyle())
  }
}

//---

struct InWordButtonStyle: ViewModifier {
  func body(content: Content) -> some View {
    content
      .frame(width: keyWidth, height: keyHeight)
      .font(.system(size: 16, weight: .bold, design: .rounded))
      .foregroundColor(.gray)
      .background(Color(.systemYellow))
      .clipShape(RoundedRectangle(cornerRadius: 4.0))
  }
}

extension View {
  func inWordButtonStyle() -> some View {
    modifier(InWordButtonStyle())
  }
}

//---

struct CorrectPositionButtonStyle: ViewModifier {
  func body(content: Content) -> some View {
    content
      .frame(width: keyWidth, height: keyHeight)
      .font(.system(size: 16, weight: .bold, design: .rounded))
      .foregroundColor(.gray)
      .background(Color(.systemGreen))
      .clipShape(RoundedRectangle(cornerRadius: 4.0))
  }
}

extension View {
  func correctPositionButtonStyle() -> some View {
    modifier(CorrectPositionButtonStyle())
  }
}
