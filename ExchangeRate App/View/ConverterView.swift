//
//  ConverterView.swift
//  ExchangeRate App
//
//  Created by Surya on 20/06/25.
//


import SwiftUI


extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder),
                                        to: nil, from: nil, for: nil)
    }
}


struct ConverterView: View {
    @StateObject private var viewModel = ExchangeRateViewModel()
    @State private var amount: String = ""
    @State private var selectedCurrency = "USD"

       @FocusState private var isAmountFocused: Bool
    
    var body: some View {
        VStack(spacing: 20) {
            TextField("Enter amount", text: $amount)
                            .keyboardType(.decimalPad)
                            .focused($isAmountFocused)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding()

            Button("Done") {
                isAmountFocused = false  // This will hide keyboard
            }
            
            Picker("Currency", selection: $selectedCurrency) {
                ForEach(viewModel.rates.keys.sorted(), id: \.self) { key in
                    Text("\(key)").tag(key)
                }
            }
            .pickerStyle(WheelPickerStyle())
            .padding()

            if let value = Double(amount), let rate = viewModel.rates[selectedCurrency] {
                Text("Converted: \(String(format: "%.2f", value * rate))")
                    .font(.title)
                    .padding()
            }

            Spacer()
        }
        .onTapGesture {
                    isAmountFocused = false  // Hides keyboard, no matter what
                }
                .toolbar {
                    ToolbarItemGroup(placement: .keyboard) {
                        Spacer()
                        Button("Done") {
                            isAmountFocused = false
                        }
                    }
                }
        .navigationTitle("Converter")
        .onAppear {
            viewModel.loadRates()
        }
    }
}

