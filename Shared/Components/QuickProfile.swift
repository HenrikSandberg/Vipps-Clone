//
//  QuickProfile.swift
//  Vipps Clone
//
//  Created by Henrik Anthony Odden Sandberg on 11/08/2020.
//

import SwiftUI

struct QuickProfile: View {
    var firstname: String
    var lastname:String
    var imageString: String?
    var body: some View {
        VStack(alignment: .center, spacing: 2, content: {
            (imageString != nil) ? RoundImage(name: imageString!) : RoundImage()
            Text(firstname)
            Text(lastname)
        })
    }
}

struct QuickProfile_Previews: PreviewProvider {
    static var previews: some View {
        QuickProfile(firstname: "Henrik", lastname: "Sandberg", imageString: nil)
    }
}
