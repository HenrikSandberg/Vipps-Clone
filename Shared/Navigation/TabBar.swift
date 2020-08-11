//
//  Tabbar.swift
//  Vipps Clone
//
//  Created by Henrik Anthony Odden Sandberg on 10/08/2020.
//

import SwiftUI

struct TabBar: View {    
    var body: some View {
        TabView {
            ForEach(navigationContent.indices) {index in
                NavigationView {
                    destinations[index]
                }.tabItem {
                    Image(systemName: navigationContent[index].icon)
                    Text(navigationContent[index].name)
                }            
            }
        }
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}
