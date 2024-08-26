
import Foundation

class GlobalModel {
    // Main global Amount
    var TotalAmount: [ItemModel] = []
    
    // ItemCategoryProtocolExample
    struct ItemModel: Identifiable {
        var id = UUID()
        var categoryName: String
        var categoryIcon: String
        var categoryCount: Double
        var categoryDate: Date
    }
}

// Income class
class Expenses {
    var expensesArray: [GlobalModel.ItemModel] = []
    
   // Add
    func addExpense(item: GlobalModel.ItemModel) {
        expensesArray.append(item)
    }
    
    // Delete
    func removeExpense(id: UUID) {
        expensesArray.removeAll { $0.id == id }
    }
}

// Expensses Class
class Income {
    var incomeArray: [GlobalModel.ItemModel] = []
    
    // Add
    func addIncome(item: GlobalModel.ItemModel) {
        incomeArray.append(item)
    }
    
    // Delete
    func removeIncome(id: UUID) {
        incomeArray.removeAll { $0.id == id }
    }
}

