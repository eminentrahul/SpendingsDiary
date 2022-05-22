//
//  Home.swift
//  KharchaDiary
//
//  Created by Rahul Ravi Prakash on 22/05/22.
//

import SwiftUI

struct Home: View {
    
    @StateObject var expenseViewModel: ExpenseViewModel = .init()
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 12) {
                HStack(spacing: 15) {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Swagatam")
                            .font(.caption)
                            .fontWeight(.semibold)
                            .foregroundColor(.gray)
                        
                        Text("Rahul")
                            .font(.title2.bold())
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Button {
                        
                    } label: {
                        Image(systemName: "hexagon.fill")
                            .foregroundColor(.gray)
                            .overlay(content: {
                                Circle()
                                    .stroke(.white, lineWidth: 2)
                                    .padding(7)
                            })
                            .frame(width: 40, height: 40)
                            .background(Color.white, in: RoundedRectangle(cornerRadius: 10, style: .continuous))
                            .shadow(color: .black.opacity(0.1), radius: 5, x: 5, y: 5)
                    }

                }
                ExpenseCardView()
            }
            .padding()
        }
        .background{
            Color(uiColor: .lightGray)
                .ignoresSafeArea()
        }
    }
    
    //MARK: Expense Gradient Card view
    @ViewBuilder
    func ExpenseCardView() -> some View {
        GeometryReader { proxy in
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .fill(
                    .linearGradient(colors: [
                        Color.blue,
                        Color.red,
                        Color.brown
                    ], startPoint: .topLeading, endPoint: .bottomTrailing)
                )
            
            VStack(spacing: 15) {
                VStack(spacing: 15) {
                    //mark Current Date and time
                    Text(expenseViewModel.currentMonthDateString())
                        .font(.callout)
                        .fontWeight(.semibold)
                    
                    //MARK - Cuurent month expense price
                    Text(expenseViewModel.convertExpenseToCurrency(expenses: expenseViewModel.expenses))
                        .font(.system(size: 35, weight: .bold))
                        .lineLimit(1)
                        .padding(.bottom, 5)
                }
                .offset(y: -10)
                
                HStack(spacing: 15) {
                    Image(systemName: "arrow.down")
                        .font(.caption.bold())
                        .foregroundColor(.green)
                        .frame(width: 30, height: 40)
                        .background(.white.opacity(0.7), in: Circle())
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Income")
                            .font(.caption)
                            .opacity(0.7)
                        
                        Text(expenseViewModel.convertExpenseToCurrency(expenses: expenseViewModel.expenses, type: .INCOME))
                            .font(.callout)
                            .fontWeight(.semibold)
                            .lineLimit(1)
                            .fixedSize()
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Image(systemName: "arrow.up")
                        .font(.caption.bold())
                        .foregroundColor(.red)
                        .frame(width: 30, height: 40)
                        .background(.white.opacity(0.7), in: Circle())
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Expense")
                            .font(.caption)
                            .opacity(0.7)
                        
                        Text(expenseViewModel.convertExpenseToCurrency(expenses: expenseViewModel.expenses, type: .EXPENCE))
                            .font(.callout)
                            .fontWeight(.semibold)
                            .lineLimit(1)
                            .fixedSize()
                    }
                    
                }
                .padding(.horizontal)
                .padding(.trailing)
                .offset(y: 15)
            }
            .foregroundColor(.white)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
        }
        .frame(height: 220)
        .padding(.top)
        
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
