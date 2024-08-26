//
//  CustomButtonBlueView.swift
//  BudgetApp
//
//  Created by Daniil Vaschilin on 25/08/2024.
//

import SwiftUI

struct CustomButtonBlueView: View {
    var body: some View {
        Button(action: {
            // Action
        }, label: {
            Text("+ Add transaction")
                .frame(width: 200, height: 40)
                .background(.blueButton)
                .foregroundStyle(.white)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .font(.custom("Inter18pt-ExtraLight", size: 18))
        })
    }
}

#Preview {
    CustomButtonBlueView()
}
