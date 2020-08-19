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
    @State var scale: CGFloat = 1
    
    var body: some View {
        withAnimation {
            VStack(alignment: .center, spacing: 5, content: {
                if let title = warningTitle {
                    Text(title)
                        .fontWeight(.bold)
                        .fixedSize(horizontal: false, vertical: true)
                        .padding(.horizontal)
                }
                Text(warningString)
                    .fixedSize(horizontal: false, vertical: true)
                    .padding(.horizontal)
            })
            .lineLimit(.none)
            .padding()
            .foregroundColor(Color(simpleWarning ? "Ebony" : "Feedback No"))
            .background(Color(simpleWarning ? "Vipps Background change" : "Feedback No Light"))
            .cornerRadius(25)
            .transition(.moveAndShow)
        }
    }
}
