//
//  RoundButton.swift
//  Vipps Clone
//
//  Created by Henrik Anthony Odden Sandberg on 10/08/2020.
//

import SwiftUI

struct RoundButton: View {
    var title: String
    var ikon: String
    var color: Color = Color("AccentColor")
    
    var body: some View {
        VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 5, content: {
            Image(systemName: ikon)
                .resizable()
                .padding(20)
                .frame(width: 60, height: 60)
                .foregroundColor(.white)
                .background(color)
                .clipShape(Circle())
                .shadow(radius: 5)
            Text(title)
                .font(.subheadline)
                .fontWeight(.semibold)
        })
    }
}

struct RoundButton_Previews: PreviewProvider {
    static var previews: some View {
        RoundButton(title: "Send", ikon: "arrow.up")
    }
}
