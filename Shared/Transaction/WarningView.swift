//
//  WarningView.swift
//  Vipps Clone
//
//  Created by Henrik Anthony Odden Sandberg on 19/08/2020.
//

import SwiftUI

struct WarningView: View {
    var warningString: String
    var simpleWarning: Bool
    var warningTitle: String?
    
    var body: some View {
        withAnimation {
            VStack(alignment: .leading, spacing: 5, content: {
                if let title = warningTitle {
                    Text(title)
                        .fontWeight(.bold)
                }
                HStack {
                    Text(warningString)
                    if warningTitle == nil {
                        Spacer()
                    }
                }
            })
            .multilineTextAlignment(.leading)
            .padding(.vertical, 20)
            .padding(.horizontal, 16)
            .foregroundColor(Color(simpleWarning ? "Ebony" : "Feedback No"))
            .background(Color(simpleWarning ? "Vipps Background change" : "Feedback No Light"))
            .cornerRadius(25)
            .transition(.moveAndShow)
            .padding(.horizontal)
        }
    }
}

struct WarningView_Previews: PreviewProvider {
    static var previews: some View {
        WarningView(
            warningString: "Legg med en beskrivelse av hva det gjelder i meldingsfeltet",
            simpleWarning: false,
            warningTitle:  "Beløp fra og med 50 000 kr trenger beskrivelse.")
    }
}
