//
//  Message.swift
//  Vipps Clone
//
//  Created by Henrik Anthony Odden Sandberg on 27/08/2020.
//

import Foundation

struct Message {
    var id: Int
    var sender: String
    var reciver: String
    var isReciver: Bool
    var trasaction: Int?
    var text: String
    var isRecivingMoney: Bool
    var sendDate: Date
}
