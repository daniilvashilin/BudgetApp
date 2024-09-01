import SwiftUI

struct ScrollTabItemView: View {
    var category: GlobalModel.CategoryTabElements
    var body: some View {
        GeometryReader { geom in
            HStack {
                Image(category.categoryImage)
                    .renderingMode(.template)
                    .resizable()
                    .frame(width: 25, height: 25)
                    .padding(10)
                    .background(Color(.systemGray5)) // Adjust this to match your design
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    .foregroundColor(category.categoryImageColor)

                VStack(alignment: .leading) {
                    Text(category.categoryName)
                        .font(.custom("Inter18pt-ExtraLight", size: 18))
                    Text(category.categoryDescription)
                        .font(.custom("Inter18pt-ExtraLight", size: 12))
                }

                Spacer()

                Text(String(format: "%.2f", category.categoryAmount))
                    .font(.custom("Inter18pt-ExtraLight", size: 16))
                    .foregroundColor(category.isMinus ? .red : .green)
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    ScrollTabItemView(category: sampleCategory)
}

let sampleCategory = GlobalModel.CategoryTabElements(
    categoryName: "Test Category 1",
    categoryDescription: "Description 1",
    categoryAmount: 300.00,
    isMinus: false,
    categoryImage: "mailIcon",
    categoryImageColor: .blue
)
