//
//  TransactionsView.swift
//  BudgetApp
//
//  Created by Daniil Vaschilin on 26/08/2024.
//

import SwiftUI

struct TransactionsView: View {
    @EnvironmentObject var vm: GlobalModel
    
    var body: some View {
        GeometryReader { geom in
            let categories = vm.getCategories() // Store the categories in a variable
            
            if categories.isEmpty {
                Text("No transactions available")
                    .frame(width: geom.size.width, height: geom.size.height)
                    .background(Color(.systemGray6)) // Optional: Add a background to distinguish the placeholder
            } else {
                ScrollView(.vertical) {
                    VStack {
                        ForEach(categories) { item in
                            ScrollTabItemView(category: item)
                                .padding(.horizontal, geom.size.height * 0.02) // Horizontal padding
                                .padding(.vertical, geom.size.height * 0.03)  // Vertical padding
                        }
                    }
                }
                .frame(maxHeight: .infinity) // Ensure the ScrollView can expand as needed
                .scrollIndicators(.hidden)
            }
        }
    }
}
#Preview {
    TransactionsView().environmentObject(GlobalModel())
}
