//
//  Libraryswift.swift
//  Vipps Clone
//
//  Created by Henrik Anthony Odden Sandberg on 10/08/2020.
//

import SwiftUI

struct LibraryContent: LibraryContentProvider {
//    @LibraryContentBuilder
//    var views: [LibraryItem] {
//        LibraryItem(
//            CloseButton(),
//            title: "Round Close Button",
//            category: .control
//        )
//    }
    
//    @LibraryContentBuilder
//    func modifiers(base: Image) -> [LibraryItem] {
//        LibraryItem(
//            base.cardStyle(),
//            title: "Card Style",
//            category: .effect)
//    }
    
//    @LibraryContentBuilder
//    func roundImage(name: String, color: Color = Color("Vipps White")) -> Image {
//        return
//    }
    
    
}

extension View {
//    func cardStyle(color: Color = Color.blue, cornerRadius: CGFloat = 22 ) -> some View {
//        return self
//            .background(color)
//            .clipShape(RoundedRectangle(cornerRadius: cornerRadius, style: .continuous))
//            .shadow(color: color.opacity(0.3), radius: 20, x: 0, y: 10)
//    }
    
}

extension Int {
    var randum: Int {
        if self > 0 {
            return Int(arc4random_uniform(UInt32(self)))
        } else if self < 0{
            return -Int(arc4random_uniform(UInt32(abs(self))))
        } else {
            return 0
        }
    }
}

extension String  {
    var isNumber: Bool {
        return !isEmpty && rangeOfCharacter(from: CharacterSet.decimalDigits.inverted) == nil
    }
    
    var removAllWhitespaces: String {
        return components(separatedBy: .whitespaces).joined()
    }
}

extension Formatter {
    static let withSeparator: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.groupingSeparator = " "
        return formatter
    }()
}

extension Numeric {
    var formattedWithSeparator: String { Formatter.withSeparator.string(for: self) ?? "" }
}
