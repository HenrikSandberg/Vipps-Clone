//
//  Navigation.swift
//  Vipps Clone
//
//  Created by Henrik Anthony Odden Sandberg on 11/08/2020.
//

import SwiftUI

struct Navigation: View {
    #if os(iOS)
    @Environment(\.horizontalSizeClass) var horizintalSizeClass
    #endif
    
    var body: some View {
        #if os(iOS)
        if horizintalSizeClass == .compact {
            TabBar()
        } else {
            Sidebar()
        }
        #endif
    }
}

struct Navigation_Previews: PreviewProvider {
    static var previews: some View {
        Navigation()
    }
}
