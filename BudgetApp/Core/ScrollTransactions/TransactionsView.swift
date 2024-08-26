//
//  TransactionsView.swift
//  BudgetApp
//
//  Created by Daniil Vaschilin on 26/08/2024.
//

import SwiftUI

struct TransactionsView: View {
    var body: some View {
        GeometryReader {geom in
            ScrollView(.vertical) {
                ForEach(0..<5) {item in
                    ScrollTabItemView()
                        .padding(.horizontal, geom.size.height * 0.02) // Horizontal padding
                        .padding(.vertical, geom.size.height * 0.040)  // Vertical padding
                }
            }
            .scrollIndicators(.hidden)
        }
    }
}
#Preview {
    TransactionsView()
}
