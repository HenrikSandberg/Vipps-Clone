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
    @Binding var presentationMode: PresentationMode
    @State private var showingAlert = false
    
    //MARK: State for transactions
    @State var text: String = ""
    @State var shouldDisplayWarning: Bool = false
    @State var description: String = ""
    @State var transactionButtonPressed: Bool = false
    @State var warningTitle: String = ""
    
    var isValid: Bool {
        if 0 < number && number < 500000 {
            return true
        } else {
            return description.count > 0 && number > 0 && number < 500000
        }
    }
    
    var warning: WarningView {
        if number <= 0 {
            return WarningView(warningString: "Tast inn beløp for å fortsette", simpleWarning: false)
        } else if number >= 50000 && description.count <= 0 {
            if transactionButtonPressed {
                return WarningView(
                    warningString: "Legg med en beskrivelse av hva det gjelder i meldingsfeltet",
                    simpleWarning: false,
                    warningTitle: "Beløp fra og med 50 000 kr trenger beskrivelse.")
            }
            return WarningView(warningString: "Høye beløp må ha beskrivelse", simpleWarning: true)
        } else {
            return WarningView(warningString: "Høye beløp må ha beskrivelse", simpleWarning: true)
        }
    }
    
    var number: Int {
        let newText = text.removAllWhitespaces
        return Int(newText) != nil ? Int(newText)! : 0
    }
    
    //MARK: Body
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
            VStack(alignment: .center, spacing: 5) {
                if shouldDisplayWarning {
                    warning
                        .padding(.horizontal, 20)
                }
                
                VStack(alignment: .center, spacing: 15, content: {
                    VippsTextField(
                        text: $text,
                        warning: $shouldDisplayWarning,
                        description:$description,
                        number: number,
                        changes: $transactionButtonPressed
                    )
                    DescriptionTextField(
                        text: $description,
                        warning: $shouldDisplayWarning,
                        changes: $transactionButtonPressed
                    )
                    Spacer()
                })
                .frame(width: 200, height: 75, alignment: .center)
                .padding(50)
                .background(Color("Ebony"))
                .clipShape(RoundedRectangle(cornerRadius: 30))
                
                Spacer()
                
                ActionButton(
                    text: "Neste",
                    isValid: isValid,
                    number: number,
                    warning: $shouldDisplayWarning,
                    pressed: $transactionButtonPressed
                )
            }
            .animation(.easeInOut)
            .transition(.move(edge: .top))
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
