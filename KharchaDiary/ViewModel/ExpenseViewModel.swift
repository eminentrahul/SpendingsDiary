//
//  ExpenseViewModel.swift
//  KharchaDiary
//
//  Created by Rahul Ravi Prakash on 22/05/22.
//

import SwiftUI

class ExpenseViewModel: ObservableObject {
    
    //MARK: Properties
    @Published var startDate: Date = Date()
    @Published var endDate: Date = Date()
    @Published var currentMonthStartDate: Date = Date()
    
    init() {
        //MARK: Get Current Month starting datte
        let calendar = Calendar.current
        let components = calendar.dateComponents([.year, .month], from: Date())
        
        startDate = calendar.date(from: components)!
        currentMonthStartDate = calendar.date(from: components)!
        
        
    }
    
    @Published var expenses : [Expense] = sampleExpenses
    
    
    //MARK:
    func currentMonthDateString() -> String {
        return currentMonthStartDate.formatted(date: .abbreviated, time: .omitted) + " - " + Date().formatted(date: .abbreviated, time: .omitted)
    }
    
    func convertExpenseToCurrency(expenses: [Expense], type: ExpenseType = .ALL) -> String {
        
        var value: Double = 0.00
        
        value = expenses.reduce(0, {partialResult, expense in
            return partialResult + (type == .ALL ? (expense.type == .INCOME ? expense.amount : -expense.amount) : (expense.type == type ? expense.amount : 0))
        })
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        
        return formatter.string(from: .init(value: value)) ?? "₹0.00"
        
    }
}
