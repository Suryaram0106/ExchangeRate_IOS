//
//  HomeView.swift
//  ExchangeRate App
//
//  Created by Surya on 20/06/25.
//

import SwiftUI


//struct HomeView: View {
//    @StateObject private var viewModel = ExchangeRateViewModel()
//    @AppStorage("isDarkMode") private var isDarkMode = false
//
//    var body: some View {
//        NavigationView {
//            VStack {
//                HStack {
//                    Text("Last updated: \(viewModel.lastUpdatedText)")
//                        .font(.caption)
//                        .foregroundColor(.gray)
//                    Spacer()
//                    Button(action: {
//                        isDarkMode.toggle()
//                        UIApplication.shared.windows.first?.overrideUserInterfaceStyle = isDarkMode ? .dark : .light
//                    }) {
//                        Image(systemName: isDarkMode ? "moon.fill" : "sun.max.fill")
//                    }
//                }
//                .padding()
//
//                if viewModel.isLoading {
//                    ProgressView("Loading...")
//                } else if let error = viewModel.errorMessage {
//                    Text("Error: \(error)").foregroundColor(.red)
//                } else {
//                    List(viewModel.rates.sorted(by: { $0.key < $1.key }), id: \.key) { key, value in
//                        HStack {
//                            Text("\(flag(for: key)) \(key)")
//                            Spacer()
//                            Text(String(format: "%.2f", value))
//                        }
//                    }
//                }
//            }
//            .navigationTitle("Exchange Rates")
//            .onAppear {
//                viewModel.loadRates()
//            }
//        }
//    }
//
//    func flag(for currencyCode: String) -> String {
//        let base: UInt32 = 127397
//        let cc = viewModel.currencyToCountryCode[currencyCode] ?? String(currencyCode.prefix(2))
//        return cc.uppercased().unicodeScalars
//            .compactMap { UnicodeScalar(base + $0.value) }
//            .map { String($0) }
//            .joined()
//    }
//}


import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = ExchangeRateViewModel()
    @AppStorage("isDarkMode") private var isDarkMode = false

    var body: some View {
        VStack {
            // Top bar: Last updated + dark mode toggle
            HStack {
                Text("Last updated: \(viewModel.lastUpdatedText)")
                    .font(.caption)
                    .foregroundColor(.gray)
                Spacer()
                Button(action: {
                    isDarkMode.toggle()
                    // Dynamically update interface style
                    UIApplication.shared.connectedScenes
                        .compactMap { $0 as? UIWindowScene }
                        .first?.windows
                        .first?.overrideUserInterfaceStyle = isDarkMode ? .dark : .light
                }) {
                    Image(systemName: isDarkMode ? "moon.fill" : "sun.max.fill")
                        .imageScale(.large)
                }
            }
            .padding(.horizontal)

            // Content: Loading, error, or list
            if viewModel.isLoading {
                ProgressView("Loading...")
                    .padding()
            } else if let error = viewModel.errorMessage {
                Text("Error: \(error)")
                    .foregroundColor(.red)
                    .padding()
            } else {
                List(viewModel.rates.sorted(by: { $0.key < $1.key }), id: \.key) { key, value in
                    HStack {
                        Text("\(flag(for: key)) \(key)")
                        Spacer()
                        Text(String(format: "%.2f", value))
                    }
                }
                .listStyle(.plain)
                .safeAreaInset(edge: .bottom) {
                    Color.clear.frame(height: 0)  // Prevents TabView overlap
                }
            }
        }
        .navigationTitle("Exchange Rates")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            viewModel.loadRates()
        }
    }

    func flag(for currencyCode: String) -> String {
        let base: UInt32 = 127397
        let cc = viewModel.currencyToCountryCode[currencyCode] ?? String(currencyCode.prefix(2))
        return cc.uppercased().unicodeScalars
            .compactMap { UnicodeScalar(base + $0.value) }
            .map { String($0) }
            .joined()
    }
}
