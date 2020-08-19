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
    @Binding var presentationMode:PresentationMode
    @State private var showingAlert = false
    
    //MARK: State for transactions
    @State var text: String = ""
    @State var number: Int = 0
    @State var warning: Warning = Warning()
    @State var description: String = ""
    
    var isValid: Bool {
        if 0 < number && number < 100000 {
            return true
        }
        return description.count > 0 && number > 0 && number < 1000000
    }
    
    var body: some View {
        //MARK: Display name, picture and number
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
            
            //MARK: Display money field & and relevenat content
            VStack {
                if warning.display && description.count <= 0 || warning.display && number <= 0 {
                    if number <= 0 {
                        WarningView(warning: $warning, simpleWarning: false)
                    } else if description.count <= 0 {
                        WarningView(warning: $warning, simpleWarning: true)
                    }
                }
                
                VStack(alignment: .center, spacing: 15, content: {
                    VippsTextField(text: $text, number: $number, warning: $warning, isValid: isValid, description: $description)
                    DescriptionTextField(text: $description)
                    Spacer()
                })
                .frame(width: 200, height: 75, alignment: .center)
                .padding(50)
                .background(Color("Ebony"))
                .clipShape(RoundedRectangle(cornerRadius: 30))
                
                Spacer()
                ActionButton(text: "Neste", isValid: isValid, number: $number, warning: $warning)
            }
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
                        $presentationMode.wrappedValue.dismiss()
                    }),
                secondaryButton: .default(Text("Nei"), action: {
                    self.showingAlert = false
                }))
        })
    }
}
