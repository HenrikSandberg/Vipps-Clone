//
//  ToMessage.swift
//  Vipps Clone
//
//  Created by Henrik Anthony Odden Sandberg on 01/09/2020.
//

import SwiftUI

struct ToMessage: View {
    var text: String
    var sendDate: String
    var senderImage: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: nil, content: {
            VStack(alignment: .leading, spacing: nil, content: {
                HStack {
                    SenderImage(imageString: senderImage)

                    if !text.containsOnlyEmoji || text.count > 3 {
                        Text(text)
                            .padding()
                            .background(Color(.white))
                            .foregroundColor(.black)
                            .cornerRadius(25)
                            .multilineTextAlignment(.leading)
                            .shadow(radius: 2)
                    } else if text.containsOnlyEmoji && text.count < 4 {
                        Text(text)
                            .font(.largeTitle)
                    }
                    Spacer()
                }
                .padding(.trailing, 50)
                Text(sendDate)
                    .font(.footnote)
                    .padding(.leading, 40)
                    .foregroundColor(.gray)
            })
        })
        .padding()
    }
}

struct ToMessage_Previews: PreviewProvider {
    static var previews: some View {
        let text = "Du er best ingen protest ❤️"
        let sendDate = "28.07.2019, 12:17"
        let img = "vipps_blink"
        ToMessage(text: text, sendDate: sendDate, senderImage: img)
    }
}


