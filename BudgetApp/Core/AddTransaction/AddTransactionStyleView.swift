//
//  AddTransactionStyleView.swift
//  BudgetApp
//
//  Created by Daniil Vaschilin on 29/08/2024.
//

import SwiftUI

struct AddTransactionStyleView: View {
    @State var categoryInputName = ""
    @State var categoryInputAmount = ""
    @StateObject var iconsSet = AddTransactionModel()
    @State private var selectedIcon: String = "pawIcon" // Default selected icon
    @Binding var isPresented: Bool
    @State var colorPickerPressed = false
    @State private var selectedColor: Color = .blue
    let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    //    @Binding var selectedIcon: String
    var body: some View {
        VStack {
            // Enter Category Name
            TextField("Name", text: $categoryInputName)
                .padding()
                .frame(width: 300, height: 50)
                .background(.selectionBackground)
                .clipShape(RoundedRectangle(cornerRadius: 5))
            
            // Select icon color and amount
            
            HStack {
                Button(action: {
                    
                }, label: {
                    Image(selectedIcon)
                        .resizable()
                        .frame(width: 30, height: 30)
                        .padding()
                        .background(.selectionBackground)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .foregroundStyle(selectedColor)
                })
                
                Button(action: {
                    colorPickerPressed.toggle()
                }, label: {
                    ZStack {
                        Circle()
                            .foregroundStyle(selectedColor)
                            .frame(width: 40, height: 40)
                       Circle()
                            .stroke(.globalBackground2 ,style: StrokeStyle(lineWidth: 5))
                            .frame(width: 40, height: 40)
                            
                    }
                    .frame(width: 60, height: 60)
                    .background(.selectionBackground)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                })
                .sheet(isPresented: $colorPickerPressed) {
                            CustimColorPickerView(selectedColor: $selectedColor) {
                                colorPickerPressed.toggle() // Dismiss the sheet when a color is selected
                            }
                            .presentationDetents([.height(250)]) // Set the height of the sheet
                            .presentationDragIndicator(.visible)
                        }
                
                
                HStack {
                    TextField("0.0000", text: $categoryInputAmount)
                        .padding()
                        .keyboardType(.decimalPad)
                    Text("₪")
                        .padding()
                }
                .frame(width: 160, height: 60)
                .background(.selectionBackground)
                .clipShape(RoundedRectangle(cornerRadius: 5))
            }
            .padding(.bottom, 10)
            // Grid of icons buttons
            ScrollView {
                LazyVGrid(columns: columns, spacing: 0) {
                    ForEach(iconsSet.icons, id: \.self) {icon in
                        Button(action: {
                            selectedIcon = icon
                        }, label: {
                            Image("\(icon)")
                                .resizable()
                                .frame(width: 20, height: 20)
                                .foregroundStyle(.whiteAndGrayFont)
                        })
                        .frame(width: 40, height: 40)
                        .background(selectedIcon == icon ? .selectionBackgroundPressed : .selectionBackground)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .padding()
                    }
                }
            }
            .shadow(radius: 2, x: 1.0, y: 1.0)
            .scrollIndicators(.hidden)
            .background(.addSetting)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            // Button add
            Button("Add +") {
                isPresented = false
            }
            .frame(width: 200, height: 30)
            .background(.blueButton)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .foregroundStyle(.white)
        }
        .shadow(radius: 2, x: 1.0, y: 1.0)
        .padding()
        .background(.addSetting)
        .clipShape(RoundedRectangle(cornerRadius: 25))
        .shadow(radius: 2, x: 1.0, y: 1.0)
        .ignoresSafeArea(.keyboard, edges: .bottom)
    }
}

#Preview {
    AddTransactionStyleView( isPresented: .constant(true))
}
