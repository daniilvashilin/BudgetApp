//
//  ContentView.swift
//  BudgetApp
//
//  Created by Daniil Vaschilin on 24/08/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        GeometryReader { geom in
            ZStack {
                Color.globalBackground
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    HeaderView()
                    MainCircleChartView()
                        .padding(.bottom)
                    CustomButtonBlueView()
                        .padding(.bottom)
                    TransactionsView()
                    
                        .frame(width: geom.size.width, height: geom.size.height)
                        .background(.tabIconBackground)
                        .clipShape(RoundedRectangle(cornerRadius: 30))
                        .shadow(radius: 1)
                }
//                RoundedRectangle(cornerRadius: 25)
//                    .fill(.globalBackground)
//                    .frame(width: geom.size.width * 0.8, height: geom.size.height * 0.09)
//                    .shadow(radius: 10, y: 5.0)
            }
        }
    }
}

#Preview {
    ContentView()
}
