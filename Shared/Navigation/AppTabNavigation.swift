//
//  Tabbar.swift
//  Vipps Clone
//
//  Created by Henrik Anthony Odden Sandberg on 10/08/2020.
//

import SwiftUI

struct AppTabNavigation: View {
    @State private var selection: Tab = .hjem
    
    var body: some View {
        TabView(selection: $selection) {
            NavigationView {
                HomeView()
            }
            .tabItem {
                Label("Hjem", systemImage: "house.fill")
                    .accessibility(label: Text("Hjem"))
            }
            .tag(Tab.hjem)
            
            NavigationView {
                HomeView()
            }
            .tabItem {
                Label("Betalinger", systemImage: "doc.on.doc.fill")
                    .accessibility(label: Text("Betalinger"))
            }
            .tag(Tab.betalinger)
            
            NavigationView {
                HomeView()
            }
            .tabItem {
                Label("Oppgjør", systemImage: "chart.pie.fill")
                    .accessibility(label: Text("Oppgjør"))
            }
            .tag(Tab.oppgjør)
            NavigationView {
                ProfilePage()
            }
            .tabItem {
                Label("Profil", systemImage: "person.fill")
                    .accessibility(label: Text("Profil"))
            }
            .tag(Tab.profil)
        }
    }
}


// MARK: - Tab

extension AppTabNavigation {
    enum Tab {
        case hjem
        case betalinger
        case oppgjør
        case profil
    }
}

// MARK: - Previews

struct AppTabNavigation_Previews: PreviewProvider {
    static var previews: some View {
        AppTabNavigation()
    }
}

