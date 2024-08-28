//
//  SearchButtonView.swift
//  BudgetApp
//
//  Created by Daniil Vaschilin on 27/08/2024.
//

import SwiftUI

struct SearchButtonView: View {
    @Environment(\.colorScheme) var colorScheme
    var body: some View {
        HStack {
            Text("Lastest transactions")
                .font(.custom("Inter18pt-ExtraLight", size: 18))
            Spacer()
            Button(action: {
                // search method
            }, label: {
                Image(colorScheme == .dark ? "searchWhite" : "searchBlack")
            })
        }
        .padding(.horizontal)
    }
}

#Preview {
    SearchButtonView()
}
