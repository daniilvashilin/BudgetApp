import SwiftUI

struct TransactionAddingView: View {
    @StateObject var vm = GlobalModel()
    @State var inputName = ""
    @State var inputDescription = ""
    @State var inputAmount = ""
    @State private var selectedColor: Color = .blue
    @State private var selectedIcon: String = "carIcon" // Use singular "selectedIcon"
    @Binding var isPresented: Bool
    @State var colorPickerPressed = false
    @State var iconPickerPressed = false
    @StateObject var allIcons = AddTransactionModel()

    var body: some View {
        VStack {
            TextField("Name", text: $inputName)
                .padding()
                .frame(maxWidth: .infinity, maxHeight: 50)
                .background(.selectionBackground)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            
            TextField("Description", text: $inputDescription)
                .padding()
                .frame(maxWidth: .infinity, maxHeight: 50)
                .background(.selectionBackground)
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
                .background(.selectionBackground)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                
                Button(action: {
                    iconPickerPressed.toggle()
                }, label: {
                    Image(selectedIcon) // Display the selected icon
                        .resizable()
                        .renderingMode(.template)
                        .frame(width: 35, height: 35)
                        .foregroundStyle(selectedColor)
                })
                .frame(width: 65, height: 65)
                .background(.selectionBackground)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                
                TextField("0.000", text: $inputAmount)
                    .padding()
                    .frame(maxWidth: .infinity, maxHeight: 70)
                    .background(.selectionBackground)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }
            .sheet(isPresented: $colorPickerPressed) {
                CustimColorPickerView(selectedColor: $selectedColor) {
                    colorPickerPressed.toggle() // Dismiss the sheet when a color is selected
                }
                .presentationDetents([.height(250)]) // Set the height of the sheet
                .presentationDragIndicator(.visible)
            }
            .sheet(isPresented: $iconPickerPressed) {
                IconPickerView(selectIcon: $selectedIcon) {
                    iconPickerPressed.toggle() // Dismiss the sheet when an icon is selected
                }
                .presentationDetents([.height(250)]) // Set the height of the sheet
                .presentationDragIndicator(.visible)
            }
        }
        .padding(.horizontal)
    }
}

#Preview {
    TransactionAddingView(isPresented: .constant(true))
}
