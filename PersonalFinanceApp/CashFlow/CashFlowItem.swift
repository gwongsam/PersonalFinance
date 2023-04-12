//
//  CashFlowItem.swift
//  PersonalFinanceApp
//
//  Created by apple on 3/18/23.
//

import Foundation

struct CashFlowItem: Identifiable {
    var id = UUID()
    var type: String
    var amount: Double
    var cycle: String
    var account: Account
}
