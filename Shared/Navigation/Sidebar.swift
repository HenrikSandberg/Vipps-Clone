//
//  Sidebar.swift
//  Vipps Clone
//
//  Created by Henrik Anthony Odden Sandberg on 10/08/2020.
//

import SwiftUI

struct Sidebar: View {
    
    #if os(iOS)
    @Environment(\.horizontalSizeClass) var horizintalSizeClass
    #endif
    @State private var selection: Set<NavigationCase> = [.hjem]
    
    var body: some View {
        NavigationView {

            #if os(iOS)
            content.navigationTitle("Vipps")
            HomeView()
            #else
            content
                .frame(minWidth: 200, idealWidth: 250, minHeight: 300)
            #endif
        }
    }
    var content: some View {
        List(selection: $selection) {
            if horizintalSizeClass == .regular {
                ActionButtons()
            }
            
            ForEach(navigationContent.indices) { index in
                NavigationLink(destination: destinations[index]) {
                    Label(
                        navigationContent[index].name,
                        systemImage: navigationContent[index].icon)
                }
                .accessibility(label: Text(navigationContent[index].name))
                .tag(navigationContent[index].tag)
            }
        }
        .listStyle(SidebarListStyle())
        
    }
}

struct Sidebar_Previews: PreviewProvider {
    static var previews: some View {
        Sidebar()
    }
}

//.toolbar{
//    ToolbarItem(placement: .navigationBarTrailing) {
//        Image(systemName: "person.crop.circle")
//    }
//}
