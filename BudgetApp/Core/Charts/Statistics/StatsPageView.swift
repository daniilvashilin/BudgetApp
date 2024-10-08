//
//  StatsPageView.swift
//  BudgetApp
//
//  Created by Daniil Vaschilin on 27/08/2024.
//

import SwiftUI

struct StatsPageView: View {
    var body: some View {
        GeometryReader { geom in
            ZStack {
                Color.globalBackground
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    // HeaderView
                    HeaderView(showPicker: false)
                        .frame(width: geom.size.width, height: geom.size.height * 0.1) // Header frame
                        Divider()
                        .padding(.bottom)
                    // The Date Picker
                    DatePickerChartView()
                    // The global Chart
                    MainCircleChartView(chartWidth: 180, chartHeight: 180, sumSize: 20, totalSize: 12, isSmallShowing: false, insertRadius: 80)
                    // Goals HScrollview
                    ScrollGoalVIew()
                        .padding(.vertical)
                    // Category List
                    CategroyListVIew()
                }
            }
        }
    }
}

#Preview {
    StatsPageView()
}
