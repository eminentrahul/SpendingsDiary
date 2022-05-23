//
//  TransactionCardView.swift
//  KharchaDiary
//
//  Created by Rahul Ravi Prakash on 22/05/22.
//

import SwiftUI

struct TransactionCardView: View {
    
    var expense: Expense
    @EnvironmentObject var expenseViewModel: ExpenseViewModel
    
    var body: some View {
        HStack(spacing: 12) {
            //MARK: First letter avatar
            if let first = expense.remark.first {
                Text(String(first))
                    .font(.title.bold())
                    .foregroundColor(.white)
                    .frame(width: 50, height: 50)
                    .background{
                        Circle()
                            .fill(Color(expense.color))
                    }
                    .shadow(color: .black.opacity(0.08), radius: 5, x: 5, y: 5)
            }
            
            Text(expense.remark)
                .fontWeight(.semibold)
                .lineLimit(1)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            VStack(alignment: .trailing, spacing: 7) {
                let price = expenseViewModel.convertNumberToPrice(value: expense.type == .EXPENCE ? -expense.amount : expense.amount)
                Text(price)
                    .font(.callout)
                    .opacity(0.7)
                    .foregroundColor(expense.type == .EXPENCE ? .red : .green)
                
                Text(expense.date.formatted(date: .numeric, time: .omitted))
                    .font(.caption)
                    .opacity(0.5)
            }
        }
        .padding()
        .background {
            RoundedRectangle(cornerRadius: 15, style: .continuous)
                .fill(
                    .linearGradient(colors: [Color("gradient1").opacity(0.3), Color("gradient2").opacity(0.2)], startPoint: .topLeading, endPoint: .bottomTrailing)
                )
        }
    }
}

struct TransactionCardView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
