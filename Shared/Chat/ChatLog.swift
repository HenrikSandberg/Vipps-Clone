//
//  ChatLog.swift
//  Vipps Clone
//
//  Created by Henrik Anthony Odden Sandberg on 27/08/2020.
//

import SwiftUI

struct ChatLog: View {
    
    let ikons = ["vipps_blink", "vipps_flatt", "vipps_happy",
                 "vipps_line", "vipps_meah", "vipps_o",
                 "vipps_sad", "vipps_side_smile", "vipps_smile",
                 "vipps_squddle", "vipps_wide_smile", "vipps_x",
                 "vipps_hihi"]
    
    var body: some View {
        LazyVGrid(
            columns: [GridItem(.adaptive(minimum: 300), spacing: 16)],
            spacing: 16
        ){
            ForEach(0 ..< 10 ){ _ in
                let value = 1000.randum
                let isPosetiv = 100.randum < 50
                let ikon = ikons[ikons.count.randum]
                NavigationLink(destination: Chat(user: User(first: "Meea", last: "Laitinen", phone: "+47 954 56 989"))){
                    MainListItem(
                        value: "\(value)",
                        isPosetiv: isPosetiv,
                        imageTitle: ikon)
                        .foregroundColor(.black)
                }
            }
        }
        .padding()
    }
}

struct ChatLog_Previews: PreviewProvider {
    static var previews: some View {
        ChatLog()
    }
}
