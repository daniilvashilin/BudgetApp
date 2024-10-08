//
//  HeaderView.swift
//  BudgetApp
//
//  Created by Daniil Vaschilin on 24/08/2024.
//

import SwiftUI

struct HeaderView: View {
    var showPicker: Bool
    var body: some View {
        HStack {
            Text("\(Date().formattedAsMonthDay())")
                .font(.custom("Inter18pt-ExtraLight", size: 30))
                .foregroundStyle(.primary)
            if showPicker {
                PickerView()
            }
            Spacer()
            Image("selfiTests")
                .resizable()
                .scaledToFill()
                .frame(width: 40)
                .clipShape(Circle())
        }
        .padding(.horizontal)
    }
}
#Preview {
    HeaderView(showPicker: true)
}


