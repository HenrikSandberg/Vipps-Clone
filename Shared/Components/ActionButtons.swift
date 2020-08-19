//
//  ActionButtons.swift
//  Vipps Clone
//
//  Created by Henrik Anthony Odden Sandberg on 10/08/2020.
//

import SwiftUI

struct ActionButtons: View {
    @State var showingSend = false
    @State var showingAsk = false
    @State var showingSkann = false
    
    var body: some View {
        HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 50, content: {
            
            RoundButton(title: "Send", ikon: "arrow.up")
                .onTapGesture( perform: {
                    showingSend.toggle()
                    
                }).sheet(isPresented: $showingSend) {
                    MoneyModal(isSending: true)
                }
            
            RoundButton(title: "Be om", ikon: "arrow.down")
                .onTapGesture( perform: {
                    showingAsk.toggle()
                }).sheet(isPresented: $showingAsk) {
                    MoneyModal(isSending: false)
                }
            
            RoundButton(title: "Skann", ikon: "scanner")
                .onTapGesture( perform: {
                    showingSkann.toggle()
                }).sheet(isPresented: $showingSkann) {
                    MoneyModal(isSending: false)
                }
        })
    }
}

struct ActionButtons_Previews: PreviewProvider {
    static var previews: some View {
        ActionButtons()
    }
}
