import SwiftUI

struct IconPickerView: View {
    @Binding var selectIcon: String // Binding for the selected icon
    var onIconSelect: (() -> Void)? // Optional closure to run when an icon is selected
    let icons = AddTransactionModel().icons // Icons array from your model

    var body: some View {
        ScrollView {
            LazyVGrid(columns: Array(repeating: .init(.flexible()), count: 4), spacing: 16) {
                ForEach(icons, id: \.self) { icon in
                    Button(action: {
                        selectIcon = icon
                        onIconSelect?() // Call the closure when an icon is selected
                    }) {
                        Image(icon) // Use the icon name from your model
                            .resizable()
                            .renderingMode(.template) // Apply the color template
                            .frame(width: 40, height: 40)
                            .padding()
                            .background(Color.selectionBackground)
                            .cornerRadius(10)
                            .foregroundStyle(.whiteAndGrayFont)
                    }
                }
            }
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: 300)
    }
}
#Preview {
    IconPickerView(selectIcon: .constant("defaultIcon"))
}
