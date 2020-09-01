//
//  TransactionBubble.swift
//  Vipps Clone
//
//  Created by Henrik Anthony Odden Sandberg on 01/09/2020.
//

import SwiftUI

struct TransactionBubble: View {
    var amount: Int
    var text: String = "Vipps"
    var sendDate: String
    var isSender: Bool
    var imageForSender: String? = nil
    
    var body: some View {
        if isSender {
            VStack(alignment: .trailing, spacing: nil, content: {
                transactionBubbleContainer(amount: amount, text: text, isSender: isSender)
                footerInformation(sendDate: sendDate)
                
            }).padding(.leading, 50.0)
        } else {
            HStack(alignment: .center, spacing: nil, content: {
                SenderImage(imageString: imageForSender ?? "vipps_blink")
                    .padding(.bottom, 150)
                VStack(alignment: .leading, spacing: nil, content: {
                    transactionBubbleContainer(amount: amount, text: text, isSender: isSender)
                    footerInformation(sendDate: sendDate)
                })
            })
        }
    }
}


private struct footerInformation: View {
    var sendDate: String
    var body: some View {
        HStack {
            Text(sendDate)
            Button("Se detaljer") {
                print("Should open a modal") //TODO: Make modal
            }
        }
        .font(.footnote)
        .foregroundColor(.gray)
    }
}

private struct transactionBubbleContainer: View {
    var amount: Int
    var text: String = "Vipps"
    var isSender: Bool
    
    var body: some View {
        VStack(alignment: .center, spacing: 15, content: {
            HStack{
                Image(systemName: "checkmark.circle")
                Text(isSender ? "Du vippset" : "Vippset deg")
            }
            .foregroundColor(Color("Feedback Yes"))
            .padding(6)
            .background(Color("Feedback Yes Light"))
            .cornerRadius(30)
            
            Text("\(amount.formattedWithSeparator) kr")
                .font(.system(size: 60))
                .fontWeight(.bold)
            Text(text)
        })
        .padding(.horizontal, 50)
        .padding(.vertical, 10)
        .background(Color(.white))
        .cornerRadius(30)
        .shadow(radius: 2)
    }
}

//MARK: Preview
struct TransactionBubble_Previews: PreviewProvider {
    static var previews: some View {
        let amount = 300
        let sendDate = "08.02.2019 13:22"
        let img = "vipps_blink"
        TransactionBubble(amount: amount, sendDate: sendDate, isSender: false, imageForSender: img)
    }
}
