//
//  EditAssetLiabilityItemView.swift
//  PersonalFinanceApp
//
//  Created by apple on 3/18/23.
//

import SwiftUI

struct EditAssetLiabilityItemView: View {
    let item: AssetLiabilityItem
    @State private var name: String
    @State private var balance: String

    init(item: AssetLiabilityItem) {
        self.item = item
        self._name = State(initialValue: item.type)
        self._balance = State(initialValue: String(item.balance))
    }

    var body: some View {
        Form {
            Section(header: Text("资产名称")) {
                TextField("资产名称", text: $name)
            }

            Section(header: Text("资产数量")) {
                TextField("资产数量", text: $balance)
                    .keyboardType(.decimalPad)
            }
        }
        .navigationTitle("编辑资产")
    }
}

struct EditAssetLiabilityItemView_Previews: PreviewProvider {
    static var previews: some View {
        EditAssetLiabilityItemView(item: AssetLiabilityItem(type: "借记卡", balance: 10000, category: .asset))
    }
}

