//
//  Transaction.swift
//  Vipps Clone
//
//  Created by Henrik Anthony Odden Sandberg on 11/08/2020.
//

import SwiftUI

struct Transaction: View {
    var user: User
    var isSending: Bool
    var presentationMode:Binding<PresentationMode>
    @State private var showingAlert = false
    
    var body: some View {
        VStack(alignment: .center, spacing: 20, content: {
            HStack(alignment: .top, spacing: 20, content: {
                if let imgString = user.imgString{
                    RoundImage(name: imgString, size: 50)
                } else {
                    RoundImage(size: 50)
                }
                VStack{
                    Text("\(user.first) \(user.last)")
                    Text("\(user.phone)")
                }
            })
            MoneyField()
            Spacer()
        })
        .navigationBarTitle(Text("\((isSending) ? "Sender penger til" : "Ber om penger fra")"), displayMode: .inline)
        .navigationBarItems(trailing: Button("Avbryt", action: {
            self.showingAlert = true
        }).alert(isPresented: $showingAlert){
            Alert(
                title: Text("Avslutt"),
                message: Text("Sikker på at du vil avslutte?"),
                primaryButton: .default(Text("Ja"),
                    action:{
                        self.presentationMode.wrappedValue.dismiss()
                        
                    }),
                secondaryButton: .default(Text("Nei"), action: {
                    self.showingAlert = false
                }))
        })
    }
}
