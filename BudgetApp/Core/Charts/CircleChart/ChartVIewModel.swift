import SwiftUI
import Charts

struct ChartVIewModel: View {
    @EnvironmentObject var vm: GlobalModel
    @State var insertRadius: MarkDimension
    var chartWidth: Double
    var chartHeight: Double
    var sumSize: Double
    var totalSize: Double
    var isSmallShowing: Bool
    
    var body: some View {
        let categories = vm.getCategoriesReversed()
        let sum = vm.sumStorage()
        
        ZStack {
            if categories.isEmpty {
                // Default view when there's no data
                Circle()
                    .stroke(.gray.opacity(0.5) ,style: StrokeStyle(lineWidth: 25)) // Default color for no data
                    .frame(width: chartWidth, height: chartHeight)
                    .overlay(
                        Text("No Data")
                            
                            .font(.headline)
                    )
            } else {
                Chart {
                    ForEach(categories) { category in
                        SectorMark(angle: .value("Marking", category.categoryAmount),
                                   innerRadius: insertRadius,
                                   angularInset: 2)
                        .foregroundStyle(category.categoryImageColor)
                    }
                }
                .chartLegend(.hidden)
                .frame(width: chartWidth, height: chartHeight, alignment: .center)
                VStack(alignment: .center) {
                    Text("\(sum, specifier: "%.2f")")
                        .font(.custom("Inter18pt-ExtraLight", size: sumSize))
                }
            }
        }
        .padding()
        
        if isSmallShowing {
            Text("Spend: 11.558 ₪")
                .font(.custom("Inter18pt-ExtraLight", size: 16))
                .foregroundStyle(.whiteAndGrayFont)
        }
    }
}

#Preview {
    ChartVIewModel(insertRadius: 135, chartWidth: 300, chartHeight: 300, sumSize: 30, totalSize: 16, isSmallShowing: true).environmentObject(GlobalModel())
}
