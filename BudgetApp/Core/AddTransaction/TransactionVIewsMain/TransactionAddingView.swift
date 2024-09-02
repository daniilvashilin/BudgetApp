import SwiftUI

struct TransactionAddingView: View {
    @EnvironmentObject var vm: GlobalModel
    @State var inputName = ""
    @State var inputDescription = ""
    @State var inputAmount = ""
    @State private var selectedColor: Color = .blue
    @State private var selectedIcon: String = "carIcon"
    @Binding var isPresented: Bool
    @State var colorPickerPressed = false
    @State var iconPickerPressed = false
    @StateObject var allIcons = AddTransactionModel()
    
    @State private var isAmountValid = true
    
    var body: some View {
        VStack {
            TextField("Name", text: $inputName)
                .padding()
                .frame(maxWidth: .infinity, maxHeight: 50)
                .background(Color.selectionBackground)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            
            TextField("Description", text: $inputDescription)
                .padding()
                .frame(maxWidth: .infinity, maxHeight: 50)
                .background(Color.selectionBackground)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            
            HStack {
                Button(action: {
                    colorPickerPressed.toggle()
                }, label: {
                    Circle()
                        .fill(selectedColor)
                        .frame(width: 35, height: 35)
                })
                .frame(width: 65, height: 65)
                .background(Color.selectionBackground)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                
                Button(action: {
                    iconPickerPressed.toggle()
                }, label: {
                    Image(selectedIcon)
                        .resizable()
                        .renderingMode(.template)
                        .frame(width: 35, height: 35)
                        .foregroundStyle(selectedColor)
                })
                .frame(width: 65, height: 65)
                .background(Color.selectionBackground)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                
                TextField("0.000", text: $inputAmount)
                    .keyboardType(.decimalPad)
                    .padding()
                    .frame(maxWidth: .infinity, maxHeight: 70)
                    .background(isAmountValid ? Color.selectionBackground : Color.red.opacity(0.3))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(isAmountValid ? Color.clear : Color.red, lineWidth: 2)
                    )
                    .onChange(of: inputAmount) { newValue in
                        if let _ = Double(newValue) {
                            isAmountValid = true
                        } else {
                            isAmountValid = false
                        }
                    }
            }
            
            Button(action: {
                if let amount = Double(inputAmount) {
                    isAmountValid = true
                    vm.addCategory(
                        name: inputName,
                        description: inputDescription,
                        amount: amount,
                        isMinus: false,
                        image: selectedIcon,
                        imageColro: selectedColor
                    )
                    isPresented = false
                } else {
                    isAmountValid = false
                }
            }, label: {
                Text("Add Transaction")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            })
            .padding(.top)
        }
        .padding(.horizontal)
        .sheet(isPresented: $colorPickerPressed) {
            CustimColorPickerView(selectedColor: $selectedColor) {
                colorPickerPressed.toggle()
            }
            .presentationDetents([.height(250)])
            .presentationDragIndicator(.visible)
        }
        .sheet(isPresented: $iconPickerPressed) {
            IconPickerView(selectIcon: $selectedIcon) {
                iconPickerPressed.toggle()
            }
            .presentationDetents([.height(250)])
            .presentationDragIndicator(.visible)
        }
        .ignoresSafeArea(.keyboard, edges: .bottom)
    }
}

#Preview {
    TransactionAddingView(isPresented: .constant(true))
        .environmentObject(GlobalModel())
}
