//
//  MoneyField.swift
//  Vipps Clone
//
//  Created by Henrik Anthony Odden Sandberg on 11/08/2020.
//

import SwiftUI

struct MoneyField: View {
    @State var text: String = ""
    @State var number: Int = 0
    @State var warning: Warning = Warning()
    @State var isValid: Bool = false
    @State var description: String = ""
    @State var validDescription: Bool = false

    
    var body: some View {
        VStack {
            if warning.display && !validDescription && number <= 0 {
                if number <= 0 {
                    WarningView(warning: $warning, simpleWarning: false)
                } else if !validDescription {
                    WarningView(warning: $warning, simpleWarning: true)
                }
            }
            VStack(alignment: .center, spacing: 15, content: {
                VippsTextField(text: $text, number: $number, warning: $warning, isValid: $isValid, hasDescription: $validDescription)
                DescriptionTextField(text: $description, isValid: $validDescription)
                Spacer()
            })
            .frame(width: 200, height: 75, alignment: .center)
            .padding(50)
            .background(Color("Ebony"))
            .clipShape(RoundedRectangle(cornerRadius: 30))
            
            Spacer()
            ActionButton(text: "Neste", isValid: $isValid, number: $number, warning: $warning)
        }
    }
}


struct MoneyField_Previews: PreviewProvider {
    static var previews: some View {
        MoneyField()
    }
}
