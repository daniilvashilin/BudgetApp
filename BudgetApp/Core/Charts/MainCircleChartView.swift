//
//  MainCircleChartView.swift
//  BudgetApp
//
//  Created by Daniil Vaschilin on 25/08/2024.
//

import SwiftUI
import Charts

struct MainCircleChartView: View {
    var body: some View {
        ZStack(alignment: .center) {
            Chart {
                ForEach(MockDataTesting.theResultValue)  {data in
                    SectorMark(angle: .value("stream", data.categoryValue),
                               innerRadius: 135,
                               angularInset: 2)
                    .foregroundStyle(data.color)
                }
            }
            .chartLegend(.hidden)
            .frame(width: 300, height: 300, alignment: .center)
            VStack(alignment: .center) {
                Text("1975.80 ₪")
                    .font(.custom("Inter18pt-ExtraLight", size: 30))
                Text("Total")
                    .font(.custom("Inter18pt-ExtraLight", size: 16))
                    .foregroundStyle(.whiteAndGrayFont)
            }
        }
        .padding()
        Text("Spend: 11.558 ₪")
            .font(.custom("Inter18pt-ExtraLight", size: 16))
    }
}

#Preview {
    MainCircleChartView()
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
