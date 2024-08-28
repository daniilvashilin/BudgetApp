//
//  GoalTabItemView.swift
//  BudgetApp
//
//  Created by Daniil Vaschilin on 28/08/2024.
//

import SwiftUI
import Charts

struct GoalTabItemView: View {
    var body: some View {
        ZStack {
            Chart {
                ForEach(goalModel.itemGOal) {data in
                    SectorMark(angle: .value("Strem", data.goalResult),
                               innerRadius: 25,
                               angularInset: 2
                    )
                    .foregroundStyle(LinearGradient(colors: [.purple, .blue], startPoint: .topLeading, endPoint: .bottomTrailing))
                }
            }
            .frame(width: 60, height: 60)
            VStack {
                Image("keyIcon")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .foregroundColor(.green.opacity(0.8))
                Text("10%")
                    .font(.custom("Inter18pt-ExtraLight", size: 8))
                    .foregroundStyle(.primary)
            }
        }
        .frame(width: 80, height: 80)
        .background(.selectionBackground)
        .clipShape(RoundedRectangle(cornerRadius: 5))
        .shadow(radius: 3, y: 0.5)
        Text("Category")
            .font(.custom("Inter18pt-ExtraLight", size: 12))
            .foregroundStyle(.primary)
    }
}

#Preview {
    GoalTabItemView()
}


struct goalModel {
   static var itemGOal: [MockDataGoal] = [
    MockDataGoal(titleGoal: "Vevation", imageGoal: "cheeseIcon", goalResult: 50),
//    MockDataGoal(titleGoal: "Car", imageGoal: "carIcon", goalResult: 150),
//    MockDataGoal(titleGoal: "Invest", imageGoal: "charticon", goalResult: 300),
//    MockDataGoal(titleGoal: "Gift", imageGoal: "gifticon", goalResult: 350)
   ]
    
}

struct MockDataGoal: Identifiable {
    var id = UUID()
    var titleGoal: String
    var imageGoal: String
    var goalResult: Double
}
