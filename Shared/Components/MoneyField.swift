//
//  MoneyField.swift
//  Vipps Clone
//
//  Created by Henrik Anthony Odden Sandberg on 11/08/2020.
//

import SwiftUI

struct MoneyField: View {
    @State var amount: String = ""
    
    var body: some View {
        VStack(alignment: .center, spacing: 5, content: {
            HStack(alignment: .center, content: {
                Spacer()
                VippsTextField(placeholder: Text("0"), text: $amount)
                    
                Text("kr")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                Spacer()
            })
            Spacer()
        })
        .frame(width: 200, height: 75, alignment: .center)
        .padding(50)
        .background(Color("Ebony"))
        .clipShape(RoundedRectangle(cornerRadius: 30))
    }
}

private struct VippsTextField: View {
    var placeholder: Text
    @Binding var text: String
    var editingChanged: (Bool)->() = { _ in }
    var commit: ()->() = { }

    var body: some View {
        ZStack(alignment: .trailing) {
            if text.isEmpty {
                placeholder
                    .foregroundColor(.white)
            }
            TextField("0", text: $text)
                .font(Font.system(size: 40, weight: .heavy, design: .default))
                .foregroundColor(.white)
                .keyboardType(.numberPad)
        }
        .font(Font.system(size: 40, weight: .heavy, design: .default))
        .multilineTextAlignment(.trailing)
    }
}

struct MoneyField_Previews: PreviewProvider {
    static var previews: some View {
        MoneyField()
    }
}
