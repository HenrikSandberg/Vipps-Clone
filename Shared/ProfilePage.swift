//
//  ProfilePage.swift
//  Vipps Clone
//
//  Created by Henrik Anthony Odden Sandberg on 21/08/2020.
//

import SwiftUI

struct ProfilePage: View {
    
    private func getScrollOffset(_ geometry: GeometryProxy) -> CGFloat {
        geometry.frame(in: .global).minY
    }
    
    
    private func getOffsetForHeaderImage(_ geometry: GeometryProxy) -> CGFloat {
        let offset = getScrollOffset(geometry)
        
        if offset > 0 {
            return -offset
        }
        
        return 0
    }
    
    private func getHeightForHeaderImage(_ geometry: GeometryProxy) -> CGFloat {
        let offset = getScrollOffset(geometry)
        let imageHeight = geometry.size.height

        if offset > 0 {
            return imageHeight + offset
        }

        return imageHeight
    }
    
    var body: some View {
        ScrollView {
            GeometryReader { geometry in
                ZStack {
                    VStack {
                        Image("QRCode")
                            .resizable()
                            .frame(width: 250, height: 250)
                            .offset(x: 0, y: -self.getOffsetForHeaderImage(geometry)/1.8)
                    }
                        .scaledToFill()
                        .frame(width: 500, height: self.getHeightForHeaderImage(geometry), alignment: .center)
                        .background(Color("AccentColor"))
                        .clipped()
                        .offset(x: 0, y: self.getOffsetForHeaderImage(geometry))

                    
                }
                .frame(width: geometry.size.width, height: 350, alignment: .center)

            }.frame(height: 350)

            
        }.edgesIgnoringSafeArea(.all)
    }
}

struct ProfilePage_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePage()
    }
}


//.resizable()
//.scaledToFit()
//.frame(width: geometry.size.width, height: geometry.size.height)
//.clipped()
//.offset(y: self.getOffsetForHeaderImage(geometry))
//.padding(20)
//.background(Color("AccentColor"))
