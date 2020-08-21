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
    
    @ObservedObject var content = TransactionModel()
    @State var text: String = ""
    @State var warningFlagg = false
    @State var canDisplaywarning = false
    
    var warning: WarningView? {
        if !content.isValid() && canDisplaywarning {
            if content.value <= 0 || warningFlagg && text.count <= 0{
                return WarningView(warningString: "Tast inn beløp for å fortsette.", simpleWarning: false)
            } else if content.description.count <= 0 {
                if warningFlagg {
                    return WarningView(
                        warningString: "Legg med en beskrivelse av hva det gjelder i meldingsfeltet",
                        simpleWarning: false,
                        warningTitle: "Beløp fra og med 50 000 kr trenger beskrivelse.")
                } else if content.value > content.limit() {
                    return WarningView(warningString: "Høye beløp må ha beskrivelse", simpleWarning: true)
                }
            }
        }

        return nil
    }
    
    //MARK: Body
    var body: some View {
        //MARK: Display name, picture and number
        VStack(alignment: .center, spacing: 20, content: {
                VStack(alignment: .center, spacing: 0, content: {
                    HStack(alignment: .top, spacing: 5, content: {
                        if let imgString = user.imgString {
                            RoundImage(name: imgString, size: 25)
                        } else {
                            RoundImage(size: 25)
                        }
                        Text("\(user.first) \(user.last)")
                    })
                    Text("\(user.phone)")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }).multilineTextAlignment(.leading)
            
            
            //MARK: Display money field & and relevenat content
            VStack(alignment: .center, spacing: 5) {
                if !content.isValid() {
                    if let displayWarning = warning {
                        displayWarning
                    }
                }

                
                TransactionForm(text: $text, content: content)
                    .onChange(of: text, perform: { value in
                        warningFlagg = false
                        canDisplaywarning = true
                    })
                Spacer()
                
                Button(action: {
                    if !content.isValid() {
                        warningFlagg = true
                        canDisplaywarning = true
                    }
                }) {
                    VStack(alignment: .center, spacing: 5, content: {
                        Text("Neste")
                            .foregroundColor(.white)
                            .fontWeight(.semibold)
                            .font(Font.system(size: 25, weight: .heavy, design: .default))
                    })
                    .padding(15)
                    .padding(.horizontal, 30)
                    .background(Color(content.isValid() && text.count < 0 ? "AccentColor" : "Gray" ))
                    .cornerRadius(25)
                }
            }
            .padding()
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
//MARK: Previews
struct Transaction_Previews: PreviewProvider {
    
    @Environment(\.presentationMode) static var p
    static let transaction = TransactionModel()
    
    static var previews: some View{
        Transaction(
            user: User(
                first: "Henrik",
                last: "Sandberg",
                phone: "+47 934 431 44"),
            isSending: true,
            presentationMode: p)
    }
}
