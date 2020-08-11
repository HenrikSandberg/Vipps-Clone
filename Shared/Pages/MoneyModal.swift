//
//  MoneyModal.swift
//  Vipps Clone
//
//  Created by Henrik Anthony Odden Sandberg on 11/08/2020.
//

import SwiftUI

struct MoneyModal: View {
    var title: String
    var body: some View {
        NavigationView(content: {
            ScrollView {
                ScrollView(.horizontal, showsIndicators: true) {
                    HStack(spacing: 0) {
                            ForEach(0 ..< 10) { item in
                                VStack {
                                    NavigationLink(
                                        destination: Transaction(),
                                        label: {
                                            QuickProfile(firstname: "Henrik", lastname: "Sandberg", imageString: nil)
                                                .font(.body)
                                        })
                                }
                            }
                        .padding(16)
                    }
                }
            }.navigationTitle(title)
        })
    }
}


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

struct MoneyModal_Previews: PreviewProvider {
    static var previews: some View {
        MoneyModal(title: "Test")
    }
}
