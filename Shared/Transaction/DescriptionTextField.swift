//
//  DescriptionTextField.swift
//  Vipps Clone
//
//  Created by Henrik Anthony Odden Sandberg on 19/08/2020.
//

import SwiftUI

struct DescriptionTextField: View {
    @Binding var text: String
    @Binding var warning: Bool

    var body: some View {
        ZStack(alignment: .center) {
            if text.isEmpty {
                Text("Skriv en liten melding ...")
                    .foregroundColor(.white)
            }
            TextField("Skriv en liten melding ...", text: $text)
                .onChange(of: text, perform: { _ in
                    warning = text.count <= 0
                })
                .foregroundColor(.white)
                .keyboardType(.default)
        }
    }
}
