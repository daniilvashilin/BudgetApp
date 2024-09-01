//
//  CustomButtonBlueView.swift
//  BudgetApp
//
//  Created by Daniil Vaschilin on 25/08/2024.
//

import SwiftUI

struct CustomButtonBlueView: View {
    @State var isPressed = false
    @StateObject var vm = GlobalModel()
    var body: some View {
        Button(action: {
            withAnimation(.easeInOut(duration: 3)) { // Custom animation
                isPressed.toggle()}
        }, label: {
            Text("+ Add transaction")
                .frame(width: 200, height: 40)
                .background(.blueButton)
                .foregroundStyle(.white)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .font(.custom("Inter18pt-ExtraLight", size: 18))
        })
        .sheet(isPresented: $isPressed) {
            TransactionAddingView( isPresented: $isPressed)
                        .presentationDetents([.large]) // Forces the sheet to appear in full height
                        .presentationDragIndicator(.visible)
                }
    }
}

#Preview {
    CustomButtonBlueView()
}
