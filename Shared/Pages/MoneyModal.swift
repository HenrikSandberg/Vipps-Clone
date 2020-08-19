//
//  MoneyModal.swift
//  Vipps Clone
//
//  Created by Henrik Anthony Odden Sandberg on 11/08/2020.
//

import SwiftUI

struct MoneyModal: View {
    var isSending: Bool
    
    @Environment(\.presentationMode) var presentationMode
    
    var users = [
        User(first: "Henrik", last: "Sandberg", phone: "+47 934 431 44"),
        User(first: "Henrik", last: "Sandberg", phone: "+47 934 431 44"),
        User(first: "Henrik", last: "Sandberg", phone: "+47 934 431 44"),
        User(first: "Henrik", last: "Sandberg", phone: "+47 934 431 44"),
        User(first: "Henrik", last: "Sandberg", phone: "+47 934 431 44")
    ]
    
    var body: some View {
        NavigationView(content: {
            ScrollView(.vertical, showsIndicators: true, content: {
                ScrollView(.horizontal, showsIndicators: true) {
                    LazyHStack(spacing: 0) {
                        ForEach(users, id: \.id) { user in
                            NavigationLink(
                                destination:
                                    Transaction(
                                        user: user,
                                        isSending: isSending,
                                        presentationMode: presentationMode),
                                label: {
                                    QuickProfile(firstname: user.first, lastname: user.last, imageString: user.imgString)
                                        .font(.body)
                                })
                        }
                        .padding(16)
                    }
                }

            })
            .navigationTitle((isSending ? "Sender" : "Ber om"))
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(
                leading: Button("Lukk",
                    action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }
                )
            )
        })
    }
}




struct MoneyModal_Previews: PreviewProvider {
    static var previews: some View {
        MoneyModal(isSending: true)
    }
}
