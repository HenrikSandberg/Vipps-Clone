//
//  TextBoubble.swift
//  Vipps Clone
//
//  Created by Henrik Anthony Odden Sandberg on 01/09/2020.
//

import SwiftUI

struct TextBoubble: View {
    var text: String
    var sendDate: String
    var isSender: Bool
    var senderImage: String? = nil
    
    var body: some View {
        if (isSender) {
            FromMessage(text: text, sendDate: sendDate)
        } else {
            ToMessage(text: text, sendDate: sendDate, senderImage: senderImage!)
        }
    }
}

struct TextBoubble_Previews: PreviewProvider {
    static var previews: some View {
        let text = "Du er best ingen protest ❤️"
        let sendDate = "28.07.2019, 12:17"
        let isSendt = false
        let img = "vipps_blink"
        TextBoubble(text: text, sendDate: sendDate, isSender: isSendt, senderImage: img)
    }
}
