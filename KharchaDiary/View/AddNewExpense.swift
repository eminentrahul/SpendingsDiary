//
//  AddNewExpense.swift
//  KharchaDiary
//
//  Created by Rahul Ravi Prakash on 23/05/22.
//

import SwiftUI

struct AddNewExpense: View {
    
    @EnvironmentObject var expenseViewModel: ExpenseViewModel
    
    //MARK: Environment Values
    @Environment(\.self) var env
    
    var body: some View {
        VStack {
            VStack(spacing: 15) {
                Text("Add Expense")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .opacity(0.5)
                
                //MARK: Custom Text Field
                if let symbol = expenseViewModel.convertNumberToPrice(value: 0).first {
                    TextField("0", text: $expenseViewModel.amount)
                        .font(.system(size: 35))
                        .foregroundColor(Color("gradient3"))
                        .multilineTextAlignment(.center)
                        .keyboardType(.numberPad)
                        .background{
                            Text(expenseViewModel.amount == "" ? "0" : expenseViewModel.amount)
                                .font(.system(size: 35))
                                .opacity(0)
                                .overlay(alignment: .leading) {
                                    Text(String(symbol))
                                        .opacity(0.5)
                                        .offset(x: -15, y: 5)
                                }
                        }
                        .padding(.vertical, 10)
                        .frame(maxWidth: .infinity)
                        .background{
                            Capsule()
                                .fill(.white)
                        }
                        .padding(.horizontal, 20)
                        .padding(.top)
                }
                
                //MARK: Custom Labels
                Label {
                    TextField("Remark", text: $expenseViewModel.remark)
                        .padding(.leading, 10)
                } icon: {
                    Image(systemName: "list.bullet.rectangle.portrait.fill")
                        .font(.title3)
                        .foregroundColor(Color(.gray))
                }
                .padding(.vertical, 20)
                .padding(.horizontal, 15)
                .background {
                    RoundedRectangle(cornerRadius: 12, style: .continuous)
                        .fill(.white)
                }
                .padding(.top, 25)
                
                //MARK: Checkmark
                Label {
                    customCheckBoxes()
                } icon: {
                    Image(systemName: "arrow.up.arrow.down")
                        .font(.title3)
                        .foregroundColor(Color(.gray))
                }
                .padding(.vertical, 20)
                .padding(.horizontal, 15)
                .background {
                    RoundedRectangle(cornerRadius: 12, style: .continuous)
                        .fill(.white)
                }
                .padding(.top, 25)
                
                Label {
                    DatePicker.init("", selection: $expenseViewModel.date, in: Date.distantPast...Date(), displayedComponents: [.date])
                        .datePickerStyle(.compact)
                        .labelsHidden()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 10)
                } icon: {
                    Image(systemName: "calendar")
                        .font(.title3)
                        .foregroundColor(Color(.gray))
                }
                .padding(.vertical, 20)
                .padding(.horizontal, 15)
                .background {
                    RoundedRectangle(cornerRadius: 12, style: .continuous)
                        .fill(.white)
                }
                .padding(.top, 5)

            }
            .frame(maxHeight: .infinity, alignment: .center)
            
            //MARK: Save Button
            Button (action: expenseViewModel.saveData) {
                Text("Save")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .padding(.vertical, 15)
                    .frame(maxWidth: .infinity)
                    .background {
                        RoundedRectangle(cornerRadius: 12, style: .continuous)
                            .fill(
                                LinearGradient(colors: [
                                    Color("gradient1"),
                                    Color("gradient2")
                                ], startPoint: .topLeading, endPoint: .bottomTrailing)
                            )
                    }
                    .foregroundColor(.white)
                    .padding(.bottom, 10)
            }
            .disabled(expenseViewModel.remark == "" || expenseViewModel.amount == "" || expenseViewModel.type == .ALL)
            .opacity(expenseViewModel.remark == "" || expenseViewModel.amount == "" || expenseViewModel.type == .ALL ? 0.6 : 1.0)

        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background{
            Color("background")
                .ignoresSafeArea()
        }
        .overlay(alignment: .topTrailing) {
            //Close Button
            Button {
                env.dismiss()
            } label: {
                Image(systemName: "xmark")
                    .font(.title2)
                    .foregroundColor(.black)
                    .opacity(0.7)
            }
            .padding()

        }
    }
    
    //MARK: Custom Checkboxes
    @ViewBuilder
    func customCheckBoxes() -> some View {
        HStack(spacing: 10) {
            ForEach([ExpenseType.INCOME, ExpenseType.EXPENCE], id: \.self) { type in
                ZStack {
                    RoundedRectangle(cornerRadius: 2)
                        .stroke(.black, lineWidth: 2)
                        .opacity(0.5)
                        .frame(width: 20, height: 20)
                    
                    if expenseViewModel.type == type {
                        Image(systemName: "checkmark")
                            .font(.caption.bold())
                            .foregroundColor(Color("green"))
                    }
                }
                .contentShape(Rectangle())
                .onTapGesture {
                    expenseViewModel.type = type
                }
                
                Text(type.rawValue.capitalized)
                    .font(.callout)
                    .fontWeight(.semibold)
                    .opacity(0.7)
                    .padding(.trailing, 10)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.leading, 10)
    }
}

struct AddNewExpense_Previews: PreviewProvider {
    static var previews: some View {
        AddNewExpense()
            .environmentObject(ExpenseViewModel())
    }
}
