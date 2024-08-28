//
//  CategroyListVIew.swift
//  BudgetApp
//
//  Created by Daniil Vaschilin on 28/08/2024.
//

import SwiftUI

struct CategroyListVIew: View {
    let colums = Array(repeating: GridItem(.flexible()), count: 3)
    var body: some View {
        ScrollView {
            LazyVGrid(columns: colums, spacing: 10) {
                ForEach(0..<12, id: \.self) { item in
                    CategoryListtItemView()
                }
            }
            .padding()
        }
        .frame(width: UIScreen.main.bounds.width, height: 220)
        .background(.selectionBackground)
//        .clipShape(RoundedRectangle(cornerRadius: 25))
        .shadow(radius: 0.5, x: 0.5, y: 0.5)
        .edgesIgnoringSafeArea(.bottom)
        .scrollIndicators(.hidden)
    }
}

#Preview {
    CategroyListVIew()
}
