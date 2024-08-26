//
//  ScrollTabItemView.swift
//  BudgetApp
//
//  Created by Daniil Vaschilin on 26/08/2024.
//

import SwiftUI
 
struct ScrollTabItemView: View {
    @Environment(\.colorScheme) var colorScheme
    var body: some View {
        GeometryReader { geom in
            HStack {
                Image(colorScheme == .light ?"bedIcon" : "bedIconLight")
                    .resizable()
                    .frame(width: 25, height: 25)
                    .padding(10)
                    .background(.tabIconBackground)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                VStack(alignment: .leading) {
                    Text("Category Name")
                        .font(.custom("Inter18pt-ExtraLight", size: 18))
                    Text("Category Context")
                        .font(.custom("Inter18pt-ExtraLight", size: 12))
                }
                Spacer()
                Text("167.30₪")
                    .font(.custom("Inter18pt-ExtraLight", size: 16))
                    .foregroundStyle(.red)
                    
            }
            .padding(.horizontal)
            .frame(width: geom.size.width, height: geom.size.height * 6)
            .background(.tabItmeColors)
            .clipShape(RoundedRectangle(cornerRadius: 15))
            .shadow(radius: 6, y: 10.0)
        }
    }
}


#Preview {
    ScrollTabItemView()
}


