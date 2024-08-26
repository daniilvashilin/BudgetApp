//
//  DateFormaterExtan.swift
//  BudgetApp
//
//  Created by Daniil Vaschilin on 25/08/2024.
//

import Foundation

extension Date {
    func formattedAsMonthDay() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM dd"  // "MMMM" for full month name, "dd" for day of the month
        return formatter.string(from: self)
    }
}
