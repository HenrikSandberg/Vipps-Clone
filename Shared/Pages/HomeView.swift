//
//  ContentView.swift
//  Shared
//
//  Created by Henrik Anthony Odden Sandberg on 10/08/2020.
//

import SwiftUI

struct HomeView: View {
    #if os(iOS)
    @Environment(\.horizontalSizeClass) var horizintalSizeClass
    #endif
    
    
    var body: some View {        
        ScrollView {
            VStack(alignment: .center, spacing: 10, content: {
                
                if horizintalSizeClass == .compact {
                    ActionButtons()
                }
                
                ChatLog()
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

//.preferredColorScheme(.dark)
