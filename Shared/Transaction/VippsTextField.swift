//
//  VippsTextField.swift
//  Vipps Clone
//
//  Created by Henrik Anthony Odden Sandberg on 19/08/2020.
//

import SwiftUI

struct VippsTextField: View {
    @Binding var text: String
    @Binding var warning: Bool
    @Binding var description: String
    var number: Int

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
                                warning = newNumber >= 1000000
                                text = warning ? number.formattedWithSeparator : newNumber.formattedWithSeparator
                            } else {
                                warning = false
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
