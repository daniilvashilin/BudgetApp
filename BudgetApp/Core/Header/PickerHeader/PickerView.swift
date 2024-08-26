//
//  PickerView.swift
//  BudgetApp
//
//  Created by Daniil Vaschilin on 25/08/2024.
//

import SwiftUI

struct PickerView: View {
    @State var choice = variations(variationSelected: .daily)
    var body: some View {
        Menu {
            ForEach(variations.selections.allCases, id: \.self) { variation in
                Button(action: {
                    choice.variationSelected = variation
                }) {
                    Text(variation.rawValue.capitalized)
                }
            }
        } label: {
            Label(choice.choiceVariation, systemImage: "chevron.down")
                .font(.caption2) // Customization
                .frame(width: 80, height: 20)
                .background(.selectionBackground)
                .clipShape(RoundedRectangle(cornerRadius: 5))
                .foregroundStyle(.fontColorSwitchPrimary)
        }
    }
}

#Preview {
    PickerView()
}

struct variations {
    
    enum selections: String, CaseIterable {
        case daily
        case monthly
        case yearly
    }
    
    var variationSelected: selections
    
    var choiceVariation: String {
        switch variationSelected {
        case .daily:
            return "Daily"
        case .monthly:
            return "Monthly"
        case .yearly:
            return "Yearly"
        }
    }
}
