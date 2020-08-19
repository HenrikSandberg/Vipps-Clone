//
//  User.swift
//  Vipps Clone
//
//  Created by Henrik Anthony Odden Sandberg on 11/08/2020.
//

import Foundation

struct User: Identifiable {
    var id = UUID()
    var first: String
    var last: String
    var phone: String
    var imgString: String?
}
