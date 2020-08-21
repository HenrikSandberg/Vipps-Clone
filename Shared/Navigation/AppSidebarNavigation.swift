//
//  Sidebar.swift
//  Vipps Clone
//
//  Created by Henrik Anthony Odden Sandberg on 10/08/2020.
//

import SwiftUI

struct AppSidebarNavigation: View {

    enum NavigationItem {
        case hjem
        case betalinger
        case oppgjør
        case profil
    }

    @State private var selection: Set<NavigationItem> = [.hjem]
    
    var sidebar: some View {
        List(selection: $selection) {
            NavigationLink(destination: HomeView()) {
                Label("Hjem", systemImage: "house.fill")
            }
            .accessibility(label: Text("Hjem"))
            .tag(NavigationItem.hjem)
            
            NavigationLink(destination: HomeView()) {
                Label("Betalinger", systemImage: "doc.on.doc.fill")
            }
            .accessibility(label: Text("Betalinger"))
            .tag(NavigationItem.betalinger)
        
            NavigationLink(destination: HomeView()) {
                Label("Oppgjør", systemImage: "chart.pie.fill")
            }
            .accessibility(label: Text("Oppgjør"))
            .tag(NavigationItem.oppgjør)
            
            NavigationLink(destination: ProfilePage()) {
                Label("Profil", systemImage: "person.fill")
            }
            .accessibility(label: Text("Profil"))
            .tag(NavigationItem.profil)
        }
        .listStyle(SidebarListStyle())
        .background(Color("Vipps Background change"))
    }
    
    var body: some View {
        NavigationView {
            sidebar
            HomeView()
        }
    }
}

struct AppSidebarNavigation_Previews: PreviewProvider {
    static var previews: some View {
        AppSidebarNavigation()
    }
}
