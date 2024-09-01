//
//  ContentView.swift
//  BudgetApp
//
//  Created by Daniil Vaschilin on 24/08/2024.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.colorScheme) var colorScheme
    var body: some View {
        GeometryReader { geom in
            ZStack {
                Color.globalBackground
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    // Header
                    HeaderView(showPicker: true)
                    // Chart
                    MainCircleChartView(chartWidth: 300, chartHeight: 300, sumSize: 30, totalSize: 16, isSmallShowing: true, insertRadius: 135)
                        .padding(.bottom)
                    // Blue Button Add transaction
                    CustomButtonBlueView()
                        .padding(.bottom)
                    // Search button and title
                    SearchButtonView()
                    // Scrollview for last transactions
                    TransactionsView()
                        .frame(width: geom.size.width, height: geom.size.height)
                        .background(.tabIconBackground)
                        .clipShape(RoundedRectangle(cornerRadius: 30))
                        .shadow(radius: 1)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
