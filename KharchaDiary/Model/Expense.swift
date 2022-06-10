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
    Expense(remark: "Salary", amount: 25999, date: Date(timeIntervalSince1970: 1651467309), type: .INCOME, color: "cyan"),
    Expense(remark: "Cooler", amount: 12999, date: Date(timeIntervalSince1970: 1652331309), type: .EXPENCE, color: "green"),
    Expense(remark: "Mugga", amount: 999, date: Date(timeIntervalSince1970: 1652417709), type: .EXPENCE, color: "maroon"),
    Expense(remark: "Beddsheet", amount: 2999, date: Date(timeIntervalSince1970: 1652417709), type: .EXPENCE, color: "red"),
    Expense(remark: "Pillow", amount: 259, date: Date(timeIntervalSince1970: 1653022509), type: .EXPENCE, color: "yellow"),
    Expense(remark: "Macbook", amount: 2059, date: Date(timeIntervalSince1970: 1653022509), type: .EXPENCE, color: "yellow"),

]
