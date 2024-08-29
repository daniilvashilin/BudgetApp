import SwiftUI

struct CustimColorPickerView: View {
    @Binding var selectedColor: Color
    var onColorSelected: (() -> Void)?
    let colors: [[Color]] = [
        [.red, .orange, .yellow, .green],
        [.blue, .purple, .pink, .indigo]
    ]
    
    var body: some View {
        VStack(spacing: 20) {
            Spacer()
                    Text("Color")
                        .font(.headline)
                        .padding(.top, 10)
                    
                    ForEach(0..<colors.count, id: \.self) { row in
                        HStack(spacing: 20) {
                            ForEach(0..<colors[row].count, id: \.self) { column in
                                Circle()
                                    .fill(colors[row][column])
                                    .frame(width: 40, height: 40)
                                    .onTapGesture {
                                        selectedColor = colors[row][column]
                                        onColorSelected?()
                                    }
                            }
                        }
                    }
                }
                .padding(.bottom, 20)
                .frame(maxWidth: .infinity)
                .background(Color(UIColor.secondarySystemBackground))
                .cornerRadius(20)
                .shadow(radius: 10)
            }
        }

#Preview {
    CustimColorPickerView(selectedColor: .constant(.blue))
}
