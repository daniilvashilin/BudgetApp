//
//  CategoryListtItemView.swift
//  BudgetApp
//
//  Created by Daniil Vaschilin on 28/08/2024.
//

import SwiftUI
import Charts

struct CategoryListtItemView: View {
    var body: some View {
        VStack(alignment: .center) {
            ZStack {
                Chart {
                    ForEach(goalModel.itemGOal) {data in
                        SectorMark(angle: .value("Strem", data.goalResult),
                                   innerRadius: 25,
                                   angularInset: 2
                        )
                        .foregroundStyle(.purple.opacity(0.8))
                    }
                }
                
                .frame(width: 60, height: 60)
              
                Image("guitarIcon")
                    .resizable()
                    .frame(width: 25, height: 25)
                    .foregroundColor(.orange)
            }
            Text("17.000₪")
                .font(.custom("", size: 14))
                .foregroundColor(.green)
            Text("Music Subscription")
                .padding(.horizontal)
                .frame(width: 130, height: 20, alignment: .center)
                .font(.custom("Inter18pt-ExtraLight", size: 10))
        }
        .frame(width: 100, height: 130)
        .background(.globalBackground)
        .clipShape(RoundedRectangle(cornerRadius: 5))
        .shadow(radius: 3, y: 0.5)
        
    }
}
#Preview {
    CategoryListtItemView()
}
