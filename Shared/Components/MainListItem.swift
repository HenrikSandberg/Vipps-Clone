//
//  MainListItem.swift
//  Vipps Clone (iOS)
//
//  Created by Henrik Anthony Odden Sandberg on 10/08/2020.
//

import SwiftUI

struct MainListItem: View {
    
    var name = "Meea Laitinen"
    var dataText = "30.07.2020"
    var value: String = "1 000"
    var isPosetiv: Bool = true
    var imageTitle: String = "vipps_blink"
    
    var body: some View {
        HStack {
            RoundImage(name: imageTitle, size: 60)
                .padding(.horizontal, 5)

            VStack(alignment: .leading, spacing: 2, content: {
                Text(name)
                    .font(.headline)
                    .fontWeight(.semibold)
                Text("\(isPosetiv ? "Vippset deg" : "Du vippset") - \(dataText)")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            })
            Spacer()
            VStack(alignment: .trailing, spacing: 3, content: {
                if isPosetiv {
                    Text("+\(value) kr")
                        .font(.body)
                        .fontWeight(.semibold)
                        .padding(10)
                        .foregroundColor(Color("Feedback Yes"))
                        .background(Color("Background Color"))
                } else {
                    Text("\(value) kr")
                        .font(.body)
                        .fontWeight(.semibold)
                        .padding(10)
                }

            })
            .background(Color("Gray"))
            .cornerRadius(10)
        }
        .padding(.horizontal, 5)
    }
}

struct MainListItem_Previews: PreviewProvider {
    static var previews: some View {
        MainListItem()
        MainListItem().preferredColorScheme(.dark)
    }
}
