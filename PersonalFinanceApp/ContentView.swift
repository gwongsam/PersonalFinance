//
//  ContentView.swift
//  PersonalFinanceApp
//
//  Created by apple on 3/18/23.
//

import SwiftUI
import CoreData

struct ContentView: View {
    var body: some View {
        TabView {
            CashFlowView()
                .tabItem {
                    Image(systemName: "dollarsign.circle")
                    Text("现金流管理")
                }
            
            AssetsLiabilitiesView()
                .tabItem {
                    Image(systemName: "creditcard")
                    Text("资产负债管理")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
