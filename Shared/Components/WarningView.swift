//
//  WarningView.swift
//  Vipps Clone
//
//  Created by Henrik Anthony Odden Sandberg on 19/08/2020.
//

import SwiftUI

struct WarningView: View {
    @Binding var warning: Warning
    var simpleWarning: Bool
    
    var body: some View {
        Text(warning.text)
            .foregroundColor(Color(simpleWarning ? "Ebony" : "Feedback No"))
            .padding()
            .background(Color(simpleWarning ? "Vipps Background change" : "Feedback No Light"))
            .cornerRadius(25)
    }
}
