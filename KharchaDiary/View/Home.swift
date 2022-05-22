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
                        Text("Welcome!")
                            .font(.caption)
                            .fontWeight(.semibold)
                            .foregroundColor(.gray)
                        
                        Text("Rahul")
                            .font(.title2.bold())
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    NavigationLink {
                        FilteredDetailView()
                            .environmentObject(expenseViewModel)
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
                    .environmentObject(expenseViewModel)
                TransactionView()
            }
            .padding()
        }
        .background{
            Color("background")
                .ignoresSafeArea()
        }
    }
    
    //MARK: - Transaction Card View
    @ViewBuilder
    func TransactionView() -> some View {
        VStack (spacing: 15) {
            Text("Transaction")
                .font(.title2.bold())
                .opacity(0.2)
                .frame(maxWidth: .infinity, alignment: .leading)
            
        //MARK: - Transaction Card View
            ForEach(expenseViewModel.expenses) { expense in
                TransactionCardView(expense: expense)
                    .environmentObject(expenseViewModel)
            }
        }//VStack
        .padding(.top)
    }
    
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
