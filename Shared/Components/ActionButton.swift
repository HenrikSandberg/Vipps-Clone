//
//  ActionButton.swift
//  Vipps Clone
//
//  Created by Henrik Anthony Odden Sandberg on 19/08/2020.
//

import SwiftUI

struct ActionButton: View {
    var text: String
    var isValid: Bool
    @Binding var number: Int
    @Binding var warning: Warning
    
    
    var body: some View {
        Button(action: {
            if number <= 0 {
                warning = Warning(text: "Tast inn beløp for å fortsette", display: true)
            }
        }) {
            VStack(alignment: .center, spacing: 5, content: {
                Text(text)
                    .foregroundColor(.white)
                    .fontWeight(.semibold)
                    .font(Font.system(size: 25, weight: .heavy, design: .default))
            })
            .padding(15)
            .padding(.horizontal, 30)
            .background(Color(isValid ? "AccentColor" : "Gray" ))
            .cornerRadius(25)
        }
        
    }
}
