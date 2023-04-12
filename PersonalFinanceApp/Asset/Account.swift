//
//  Account.swift
//  PersonalFinanceApp
//
//  Created by apple on 3/18/23.
//

import Foundation

struct Account: Identifiable {
    var id = UUID()
    var name: String
    var type: String
    var balance: Double
    var amount: Double
    var cycle: String
}
