//
//  MainCircleChartView.swift
//  BudgetApp
//
//  Created by Daniil Vaschilin on 25/08/2024.
//

import SwiftUI
import Charts

struct MainCircleChartView: View {
    var chartWidth: Double
    var chartHeight: Double
    var sumSize: Double
    var totalSize: Double
    var isSmallShowing: Bool
    var insertRadius: MarkDimension
    var body: some View {
        ZStack(alignment: .center) {
            Chart {
                ForEach(MockDataTesting.theResultValue)  {data in
                    SectorMark(angle: .value("stream", data.categoryValue),
                               innerRadius: insertRadius,
                               angularInset: 2)
                    .foregroundStyle(data.color)
                }
            }
            .chartLegend(.hidden)
            .frame(width: chartWidth, height: chartHeight, alignment: .center)
            VStack(alignment: .center) {
                Text("1975.80 ₪")
                    .font(.custom("Inter18pt-ExtraLight", size: sumSize))
//                Text("Total")
//                    .font(.custom("Inter18pt-ExtraLight", size: totalSize))
//                    .foregroundStyle(.whiteAndGrayFont)
            }
        }
        .padding()
        if isSmallShowing {
            Text("Spend: 11.558 ₪")
                .font(.custom("Inter18pt-ExtraLight", size: 16))
        }
    }
}

#Preview {
    MainCircleChartView(chartWidth: 300, chartHeight: 300, sumSize: 30, totalSize: 16, isSmallShowing: true, insertRadius: 135)
}


struct MockDataTesting {
    static var theResultValue: [ItmeDataTesting] = [
        .init(categoryName: "House rent", categoryValue: 350.00, color: .purple),
        .init(categoryName: "Bills pay", categoryValue: 1300.00, color: .orange),
        .init(categoryName: "Subsriptions", categoryValue: 325.80, color: .green)
    ]
    
    
    struct ItmeDataTesting: Hashable, Identifiable {
        var id = UUID()
        var categoryName: String
        var categoryValue: Double
        let color: Color
    }
}
