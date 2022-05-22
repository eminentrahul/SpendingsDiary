//
//  Expense.swift
//  KharchaDiary
//
//  Created by Rahul Ravi Prakash on 22/05/22.
//

import SwiftUI

//MARK: Expense model and sample data

struct Expense : Identifiable, Hashable {
    var id = UUID().uuidString
    var remark: String
    var amount: Double
    var date: Date
    var type: ExpenseType
    var color: String
}


enum ExpenseType : String {
    case INCOME = "income"
    case EXPENCE = "expense"
    case ALL = "all"
}

var sampleExpenses : [Expense] = [
    Expense(remark: "Salary", amount: 25999, date: Date(timeIntervalSince1970: 1689374987), type: .INCOME, color: "Yellow"),
    Expense(remark: "Cooler", amount: 12999, date: Date(timeIntervalSince1970: 1689374393), type: .EXPENCE, color: "Green"),
    Expense(remark: "Mugga", amount: 999, date: Date(timeIntervalSince1970: 1689374987), type: .EXPENCE, color: "Purple"),
    Expense(remark: "Beddsheet", amount: 2999, date: Date(timeIntervalSince1970: 1689374987), type: .EXPENCE, color: "Red"),
    Expense(remark: "Pillow", amount: 259, date: Date(timeIntervalSince1970: 1689374987), type: .EXPENCE, color: "Teal"),

]
