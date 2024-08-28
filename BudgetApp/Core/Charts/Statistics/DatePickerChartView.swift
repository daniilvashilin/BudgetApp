//
//  DatePickerChartView.swift
//  BudgetApp
//
//  Created by Daniil Vaschilin on 27/08/2024.
//

import SwiftUI

struct DatePickerChartView: View {
    var body: some View {
            VStack {
                Text("< August 2024 >")
                    .font(.custom("Inter18pt-ExtraLight", size: 16))
                Divider()
                    
                HStack {
                    VStack {
                        Text("Income")
                            .font(.footnote.bold())
                        Text("17.211₪")
                            .font(.custom("Inter18pt-ExtraLight", size: 14))
                    }
                    Spacer()
                    VStack {
                        Text("Expensses")
                            .font(.footnote.bold())
                        Text("16.098₪")
                            .font(.custom("Inter18pt-ExtraLight", size: 14))
                    }
                    Spacer()
                    VStack {
                        Text("Saved")
                            .font(.footnote.bold())
                        Text("1.113₪")
                            .font(.custom("Inter18pt-ExtraLight", size: 14))
                    }
                }
                .padding(.horizontal)
            }
            .frame(width: 290, height: 85)
            .background(.selectionBackground)
            .clipShape(RoundedRectangle(cornerRadius: 5))
            .shadow(radius: 5, y: 1.0)
        }
}

#Preview {
    DatePickerChartView()
}
