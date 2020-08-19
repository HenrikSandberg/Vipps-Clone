//
//  SwiftUIView.swift
//  Vipps Clone
//
//  Created by Henrik Anthony Odden Sandberg on 11/08/2020.
//

import SwiftUI

struct HorizontalProfileScroll {
    var users = [
        User(first: "Henrik", last: "Sandberg"),
        User(first: "Henrik", last: "Sandberg"),
        User(first: "Henrik", last: "Sandberg"),
        User(first: "Henrik", last: "Sandberg"),
        User(first: "Henrik", last: "Sandberg")
    ]
    var body: some View {
        ScrollView(.horizontal, showsIndicators: true) {
            HStack(spacing: 0) {
                ForEach(users, id: \.id) { user in
                    NavigationLink(
                        destination: Transaction(),
                        label: {
                            QuickProfile(firstname: "Henrik", lastname: "Sandberg", imageString: nil)
                                .font(.body)
                        })
                }
                .padding(16)
            }
        }
    }
}


struct HorizontalProfileScroll_Previews: PreviewProvider {
    static var previews: some View {
        HorizontalProfileScroll()
    }
}
