
import Foundation
import SwiftUI
//import SVGKit

class GlobalModel: ObservableObject, Identifiable {
    
    @Published private var categoryStorage: [CategoryTabElements] = []
    @Published private var storageSumCount: Double = 0
    
    struct CategoryTabElements: Identifiable {
        var id = UUID()
        var categoryName: String
        var categoryDescription: String
        var categoryAmount: Double
        var isMinus: Bool
        var categoryImage: String
        var categoryImageColor: Color
    }
    
    // add new category to my storage
    func addCategory(name: String, description: String, amount: Double, isMinus: Bool, image: String, imageColro: Color) {
        let newCategory = CategoryTabElements(categoryName: name, categoryDescription: description, categoryAmount: amount, isMinus: isMinus, categoryImage: image, categoryImageColor: imageColro)
        categoryStorage.append(newCategory)
    }
    // accsess to my storage
    func getCategories() -> [CategoryTabElements] {
        return categoryStorage.isEmpty ? [] : categoryStorage
    }
    // Last transactions storage accessa
    func getCategoriesReversed() -> [CategoryTabElements] {
        return categoryStorage.reversed()
    }
    
    func sumStorage() -> Double {
        return categoryStorage.reduce(0) { $0 + $1.categoryAmount }
    }
}
