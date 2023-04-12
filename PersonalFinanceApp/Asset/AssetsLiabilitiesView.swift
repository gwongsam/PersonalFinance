//
//  AssetsLiabilitiesView.swift
//  PersonalFinanceApp
//
//  Created by apple on 3/18/23.
//

import SwiftUI

struct AssetsLiabilitiesView: View {
    @State private var assetItems: [AssetLiabilityItem] = [
        // ...
    ]
    @State private var showingAddAccountForm = false
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(assetItems) { item in
                        NavigationLink(destination: EditAssetLiabilityItemView(item: item)) {
                            AssetLiabilityItemRow(item: item)
                        }
                    }
                }
                Button(action: {
                    showingAddAccountForm = true
                }) {
                    Text("添加账户")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(8)
                }
            }
            .navigationTitle("资产负债管理")
            .sheet(isPresented: $showingAddAccountForm) {
                AddAccountFormView { newItem in
                    assetItems.append(newItem)
                    showingAddAccountForm = false
                }
            }
        }
    }
}

struct AssetLiabilityItem: Identifiable {
    var id = UUID()
    var type: String
    var balance: Double
    var category: Category
    
    enum Category {
        case asset, liability
    }
}

struct AssetLiabilityItemRow: View {
    let item: AssetLiabilityItem
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(item.type)
                    .font(.headline)
                Text("类别: \(item.category == .asset ? "资产" : "负债")")
                    .font(.subheadline)
            }
            Spacer()
            Text("\(item.balance, specifier: "%.2f")")
                .font(.headline)
                .foregroundColor(item.category == .asset ? .green : .red)
        }
    }
}

struct AssetsLiabilitiesView_Previews: PreviewProvider {
    static var previews: some View {
        AssetsLiabilitiesView()
    }
}
