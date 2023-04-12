//
//  CashFlowView.swift
//  PersonalFinanceApp
//
//  Created by apple on 3/18/23.
//

import SwiftUI

struct CashFlowView: View {
    @State private var cashFlowItems: [CashFlowItem] = [
        CashFlowItem(type: "固定支出", amount: 1000, cycle: "月", account: Account(name: "借记卡", type: "debit", balance: 10000, amount: 1000, cycle: "1")),
        CashFlowItem(type: "还款", amount: 500, cycle: "月", account: Account(name: "信用卡", type: "credit", balance: 10000, amount: 1000, cycle: "1"))
    ]
    @State private var accounts: [Account] = [
        Account(name: "借记卡", type: "debit", balance: 10000, amount: 1000, cycle: "1"),
        Account(name: "信用卡", type: "credit", balance: 10000, amount: 1000, cycle: "1")
    ]
    @State private var showingEditView = false
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(cashFlowItems) { item in
                        NavigationLink(destination: EditCashFlowItemView(accounts: $accounts, cashFlowItem: item)) {
                            CashFlowItemRow(item: item)
                        }
                    }
                    .onDelete(perform: deleteItem)
                }
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: addItem) {
                            Image(systemName: "plus")
                        }
                    }
                }
            }
            .navigationTitle("现金流管理")
        }
    }
    
    private func addItem() {
        // 添加新的周期账单项目
        cashFlowItems.append(CashFlowItem(type: "新项目", amount: 0, cycle: "月", account: accounts[0]))
    }
    
    private func deleteItem(at offsets: IndexSet) {
        // 删除选定的周期账单项目
        cashFlowItems.remove(atOffsets: offsets)
    }
}

struct CashFlowItemRow: View {
    let item: CashFlowItem
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(item.type)
                    .font(.headline)
                Text("周期: \(item.cycle)")
                    .font(.subheadline)
            }
            Spacer()
            Text("\(item.amount, specifier: "%.2f")")
                .font(.headline)
        }
    }
}

struct EditCashFlowItemView: View {
    @Binding var accounts: [Account]
    let cashFlowItem: CashFlowItem
    @State private var selectedAccountIndex: Int
    @State private var amount: String
    @State private var cycle: String
    
    init(accounts: Binding<[Account]>, cashFlowItem: CashFlowItem) {
        self._accounts = accounts
        self.cashFlowItem = cashFlowItem
        self._selectedAccountIndex = State(initialValue: accounts.wrappedValue.firstIndex(where: { $0.id == cashFlowItem.account.id }) ?? 0)
        self._amount = State(initialValue: String(cashFlowItem.amount))
        self._cycle = State(initialValue: cashFlowItem.cycle)
    }

    var body: some View {
        Form {
            Section(header: Text("账户")) {
                Picker("选择账户", selection: $selectedAccountIndex) {
                    ForEach(0 ..< accounts.count) { index in
                        Text(accounts[index].name).tag(index)
                    }
                }
            }

            Section(header: Text("金额")) {
                TextField("金额", text: $amount)
                    .keyboardType(.decimalPad)
            }

            Section(header: Text("周期")) {
                TextField("周期", text: $cycle)
            }
        }
    }
}

struct CashFlowView_Previews: PreviewProvider {
    static var previews: some View {
        CashFlowView()
    }
}
