//
//  NavigationContent.swift
//  Vipps Clone
//
//  Created by Henrik Anthony Odden Sandberg on 10/08/2020.
//

import SwiftUI

struct NavigationItem {
    var name: String
    var icon: String
    var tag: NavigationCase
}

enum NavigationCase {
    case hjem
    case betalinger
    case oppgjør
    case profil
}

//var destinations = [
//    HomeView(),
//    HomeView(),
//    HomeView(),
//    ProfilePage()
//]

let navigationContent = [
    NavigationItem(name: "Hjem", icon: "house.fill", tag: .hjem),
    NavigationItem(name: "Betalinger", icon: "doc.on.doc.fill", tag: .betalinger),
    NavigationItem(name: "Oppgjør", icon: "chart.pie.fill", tag: .oppgjør),
    NavigationItem(name: "Profil", icon: "person.fill", tag: .profil)
]
