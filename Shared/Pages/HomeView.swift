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
    
    let ikons = ["vipps_blink", "vipps_flatt", "vipps_happy",
                 "vipps_line", "vipps_meah", "vipps_o",
                 "vipps_sad", "vipps_side_smile", "vipps_smile",
                 "vipps_squddle", "vipps_wide_smile", "vipps_x",
                 "vipps_hihi"]
    
    var body: some View {        
        ScrollView {
            VStack(alignment: .center, spacing: 10, content: {
                
                if horizintalSizeClass == .compact {
                    ActionButtons()
                }
                
                
                LazyVGrid(
                    columns: [GridItem(.adaptive(minimum: 300), spacing: 16)],
                    spacing: 16
                ){
                    ForEach(0 ..< 10 ){ _ in
                        let value = 1000.randum
                        let isPosetiv = 100.randum < 50
                        let ikon = ikons[ikons.count.randum]
                        MainListItem(value: "\(value)", isPosetiv: isPosetiv, imageTitle: ikon)
                    }
                }
                .padding()
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
