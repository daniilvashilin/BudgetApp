//
//  ScrollGoalVIew.swift
//  BudgetApp
//
//  Created by Daniil Vaschilin on 28/08/2024.
//

import SwiftUI

struct ScrollGoalVIew: View {
    var body: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 20) {
                ForEach(0..<6) {item in
                    VStack {
                        GoalTabItemView()
                    }
                }
            }
        }
        .scrollIndicators(.hidden)
        .padding(.horizontal)
    }
}

#Preview {
    ScrollGoalVIew()
}
