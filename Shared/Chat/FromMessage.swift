//
//  FromMessage.swift
//  Vipps Clone
//
//  Created by Henrik Anthony Odden Sandberg on 01/09/2020.
//

import SwiftUI

struct FromMessage: View {
    var text: String
    var sendDate: String
    
    var body: some View {
        VStack(alignment: .trailing, spacing: nil, content: {
            HStack {
                Spacer()
                if !text.containsOnlyEmoji && text.count > 3 {
                    Text(text)
                        .padding()
                        .background(Color("Ebony"))
                        .foregroundColor(.white)
                        .cornerRadius(25)
                        .multilineTextAlignment(.leading)
                } else {
                    Text(text)
                        .font(.largeTitle)
                }

            }
            .padding(.leading, 50)
            Text(sendDate)
                .font(.footnote)
                .padding(.trailing, 8)
                .foregroundColor(.gray)
        })
        .padding()
    }
}


struct FromMessage_Previews: PreviewProvider {
    static var previews: some View {
        let text = "Du er best ingen protest ❤️"
        let sendDate = "28.07.2019, 12:17"
        FromMessage(text: text, sendDate: sendDate)
    }
}
