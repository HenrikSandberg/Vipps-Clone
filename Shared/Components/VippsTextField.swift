//
//  VippsTextField.swift
//  Vipps Clone
//
//  Created by Henrik Anthony Odden Sandberg on 19/08/2020.
//

import SwiftUI

struct VippsTextField: View {
    @Binding var text: String
    @Binding var number: Int
    @Binding var warning: Warning
    var isValid: Bool
    @Binding var description: String

    var body: some View {
        HStack {
            Spacer()
            ZStack(alignment: .trailing) {
                if text.isEmpty {
                    Text("0")
                        .foregroundColor(.white)
                }
                TextField("0", text: $text)
                    .onChange(of: text, perform: { _ in
                        let numberText = text.removAllWhitespaces
                        
                        if numberText.isNumber{
                            let newNumber = Int(numberText)!
                            
                            if description.count <= 0 {
                                if newNumber < 100000 {
                                    number = newNumber
                                    warning.display = false
                                    
                                } else {
                                    number = newNumber
                                    warning.display = true
                                    warning.text = "Høye beløp må ha beskrivelse"
                                }
                                text = number.formattedWithSeparator
                            } else {
                                print("Now added description")
                                number = Int(numberText)!
                                warning.display = false
                            }
                        }
                    })
                    .foregroundColor(.white)
                    .keyboardType(.numberPad)
            }
            Text("kr")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.white)
            Spacer()
        }
        .font(Font.system(size: CGFloat((text.count <= 6) ? 40 : (text.count < 39) ? 40-(text.count) : 2), weight: .heavy, design: .default))
        .multilineTextAlignment(.trailing)
    }
}
