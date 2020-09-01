//
//  Chat.swift
//  Vipps Clone
//
//  Created by Henrik Anthony Odden Sandberg on 27/08/2020.
//

import SwiftUI

struct Chat: View {
    var user: User
    @State var text = ""
    
    let messages = [
        Message(id: 1, sender: "Meea Laitinen", reciver: "Henrik Sandberg", isReciver: true, trasaction: 100, text: "For kino biletter", isRecivingMoney: true, sendDate: Date()),
        Message(id: 2, sender: "Meea Laitinen", reciver: "Henrik Sandberg", isReciver: true, trasaction: nil, text: "Forresten, kunne du vippset meg for middagen i går?", isRecivingMoney: false, sendDate: Date()),
        Message(id: 3, sender: "Henrik Sandberg", reciver: "Meea Laitinen", isReciver: false, trasaction: 250, text: "For middageb", isRecivingMoney: false, sendDate: Date())
    ]
    
    var body: some View {
        List(messages, id: \.id)  { message in
            VStack{
                if let transaction = message.trasaction {
                    TransactionBubble(amount: transaction, sendDate: "13.08.2020 00:13", isSender: message.isReciver)
                } else {
                    TextBoubble(text: message.text, sendDate: "13.08.2020 00:13", isSender: message.isReciver)
                }
            }
        }
        .listStyle(SidebarListStyle())
        
    }
}

struct Chat_Previews: PreviewProvider {
    static var previews: some View {
        let user = User(first: "Meea", last: "Laitinen", phone: "+47 954 56 989")
        Chat(user: user)
    }
}
