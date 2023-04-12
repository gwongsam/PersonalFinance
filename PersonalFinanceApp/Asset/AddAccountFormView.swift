//
//  AddAccountFormView.swift
//  PersonalFinanceApp
//
//  Created by apple on 3/18/23.
//

import SwiftUI

struct AddAccountFormView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var name: String = ""
    @State private var balance: String = ""
    @State private var category: AssetLiabilityItem.Category = .asset
    let onSave: (AssetLiabilityItem) -> Void
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("账户名称")) {
                    TextField("账户名称", text: $name)
                }
                
                Section(header: Text("余额")) {
                    TextField("余额", text: $balance)
                        .keyboardType(.decimalPad)
                }
                
                Section(header: Text("类别")) {
                    Picker("选择类别", selection: $category) {
                        Text("资产").tag(AssetLiabilityItem.Category.asset)
                        Text("负债").tag(AssetLiabilityItem.Category.liability)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
            }
            .navigationTitle("添加新账户")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("保存") {
                        if let balanceValue = Double(balance) {
                            let newItem = AssetLiabilityItem(type: name, balance: balanceValue, category: category)
                            onSave(newItem)
                            presentationMode.wrappedValue.dismiss()
                        }
                    }
                }
            }
        }
    }
}

struct AddAccountFormView_Previews: PreviewProvider {
    static var previews: some View {
        AddAccountFormView{_ in}
    }
}
