//
//  RoundImage.swift
//  Vipps Clone (iOS)
//
//  Created by Henrik Anthony Odden Sandberg on 10/08/2020.
//

import SwiftUI

struct RoundImage: View {
    var name: String = "vipps_blink"
    var size: CGFloat = 75
    var color: Color = Color("Vipps White")
    var shadow: CGFloat = 1
    
    var body: some View {
        Image(name)
            .resizable()
            .frame(width: size, height: size)
            .background(color)
            .clipShape(Circle())
            .shadow(radius: shadow)
    }
}

struct RoundImage_Previews: PreviewProvider {
    static var previews: some View {
        RoundImage(size: 150, shadow: 10)
    }
}
