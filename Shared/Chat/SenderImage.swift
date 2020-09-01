//
//  SenderImage.swift
//  Vipps Clone
//
//  Created by Henrik Anthony Odden Sandberg on 01/09/2020.
//

import SwiftUI

struct SenderImage: View {
    var imageString: String
    
    var body: some View {
        Image(imageString)
            .resizable()
            .frame(width: 30, height: 30)
            .background(Color("Vipps White"))
            .clipShape(Circle())
            .padding(.bottom, 24)
    }
}

struct SenderImage_Previews: PreviewProvider {
    static var previews: some View {
        let img = "vipps_blink"
        SenderImage(imageString: img)
    }
}
