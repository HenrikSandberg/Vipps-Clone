//
//  TransactionForm.swift
//  Vipps Clone
//
//  Created by Henrik Anthony Odden Sandberg on 21/08/2020.
//

import SwiftUI

struct TransactionForm: View {
    @Binding var text: String
    @ObservedObject var content: TransactionModel
    
    var body: some View {
        VStack(alignment: .center, spacing: 15, content: {
            HStack {
                ZStack(alignment: .trailing) {
                    if text.isEmpty { Text("0") }
                    
                    TextField("0", text: $text)
                        .onChange(of: text, perform: { item in
                            let numberText = text.removAllWhitespaces
                            if let newNumber = Int(numberText) {
                                if newNumber < 1000000 {
                                    //if content.isValid() || newNumber <= content.value || content.value == 0 {
                                        content.value = newNumber
                                }

                                text = content.value.formattedWithSeparator
                            } else if numberText.count >= 0 {
                                text = ""
                            }
                        })
                        .keyboardType(.numberPad)
                }
                
                Text("kr")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                Spacer()
            }
            .foregroundColor(.white)
            .font(Font.system(size: 40, weight: .semibold, design: .default))
            .multilineTextAlignment(.trailing)
            
            //MARK: Description
            ZStack(alignment: .center) {
                if content.description.isEmpty {
                    Text("Skriv en liten melding ...")
                        .foregroundColor(.white)
                }
                TextField("Skriv en liten melding ...", text: $content.description)
                    .foregroundColor(.white)
                    .keyboardType(.default)
                    .multilineTextAlignment(.center)
            }
        })
        .frame(maxWidth: 400)
        .padding(40)
        .background(Color("Ebony"))
        .clipShape(RoundedRectangle(cornerRadius: 30))
        .padding(.horizontal)
    }
}


struct TransactionForm_Previews: PreviewProvider {
    @State static var text = ""
    @ObservedObject static var content = TransactionModel()
    
    static var previews: some View {
        TransactionForm(text: $text, content: content)
    }
}
