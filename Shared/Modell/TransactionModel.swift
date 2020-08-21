//
//  TransactionModel.swift
//  Vipps Clone
//
//  Created by Henrik Anthony Odden Sandberg on 21/08/2020.
//

import Foundation

class TransactionModel: ObservableObject {
    @Published var reciver: User?
    @Published var value: Int = 0
    @Published var description: String = ""
    
    func limit() -> Int {
        return description.count >= 0 ? 50000 : 999999
    }
    
    func isValid() -> Bool {
        if 0 < value && value <= limit(){
            return true
        }
        return description.count > 0 && 0 < value
    }
}
