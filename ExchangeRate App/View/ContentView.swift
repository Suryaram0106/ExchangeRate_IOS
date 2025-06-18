//
//import SwiftUI
//
//struct ContentView: View {
//    @StateObject private var viewModel = ExchangeRateViewModel()
//
//    let currencyToCountryCode: [String: String] = [
//        "AED": "AE", "AFN": "AF", "ALL": "AL", "AMD": "AM", "ANG": "CW",
//        "AOA": "AO", "ARS": "AR", "AUD": "AU", "AWG": "AW", "AZN": "AZ",
//        "BAM": "BA", "BBD": "BB", "BDT": "BD", "BGN": "BG", "BHD": "BH",
//        "BIF": "BI", "BMD": "BM", "BND": "BN", "BOB": "BO", "BRL": "BR",
//        "BSD": "BS", "BTN": "BT", "BWP": "BW", "BYN": "BY", "BZD": "BZ",
//        "CAD": "CA", "CDF": "CD", "CHF": "CH", "CLP": "CL", "CNY": "CN",
//        "COP": "CO", "CRC": "CR", "CUP": "CU", "CVE": "CV", "CZK": "CZ",
//        "DJF": "DJ", "DKK": "DK", "DOP": "DO", "DZD": "DZ", "EGP": "EG",
//        "ERN": "ER", "ETB": "ET", "EUR": "EU", "FJD": "FJ", "FKP": "FK",
//        "FOK": "FO", "GBP": "GB", "GEL": "GE", "GGP": "GG", "GHS": "GH",
//        "GIP": "GI", "GMD": "GM", "GNF": "GN", "GTQ": "GT", "GYD": "GY",
//        "HKD": "HK", "HNL": "HN", "HRK": "HR", "HTG": "HT", "HUF": "HU",
//        "IDR": "ID", "ILS": "IL", "IMP": "IM", "INR": "IN", "IQD": "IQ",
//        "IRR": "IR", "ISK": "IS", "JEP": "JE", "JMD": "JM", "JOD": "JO",
//        "JPY": "JP", "KES": "KE", "KGS": "KG", "KHR": "KH", "KID": "KI",
//        "KMF": "KM", "KRW": "KR", "KWD": "KW", "KYD": "KY", "KZT": "KZ",
//        "LAK": "LA", "LBP": "LB", "LKR": "LK", "LRD": "LR", "LSL": "LS",
//        "LYD": "LY", "MAD": "MA", "MDL": "MD", "MGA": "MG", "MKD": "MK",
//        "MMK": "MM", "MNT": "MN", "MOP": "MO", "MRU": "MR", "MUR": "MU",
//        "MVR": "MV", "MWK": "MW", "MXN": "MX", "MYR": "MY", "MZN": "MZ",
//        "NAD": "NA", "NGN": "NG", "NIO": "NI", "NOK": "NO", "NPR": "NP",
//        "NZD": "NZ", "OMR": "OM", "PAB": "PA", "PEN": "PE", "PGK": "PG",
//        "PHP": "PH", "PKR": "PK", "PLN": "PL", "PYG": "PY", "QAR": "QA",
//        "RON": "RO", "RSD": "RS", "RUB": "RU", "RWF": "RW", "SAR": "SA",
//        "SBD": "SB", "SCR": "SC", "SDG": "SD", "SEK": "SE", "SGD": "SG",
//        "SHP": "SH", "SLE": "SL", "SLL": "SL", "SOS": "SO", "SRD": "SR",
//        "SSP": "SS", "STN": "ST", "SYP": "SY", "SZL": "SZ", "THB": "TH",
//        "TJS": "TJ", "TMT": "TM", "TND": "TN", "TOP": "TO", "TRY": "TR",
//        "TTD": "TT", "TVD": "TV", "TWD": "TW", "TZS": "TZ", "UAH": "UA",
//        "UGX": "UG", "USD": "US", "UYU": "UY", "UZS": "UZ", "VES": "VE",
//        "VND": "VN", "VUV": "VU", "WST": "WS", "XAF": "CM", "XCD": "AG",
//        "XCG": "CW", "XDR": "IMF", "XOF": "BJ", "XPF": "PF", "YER": "YE",
//        "ZAR": "ZA", "ZMW": "ZM", "ZWL": "ZW"
//    ]
//    
//    var body: some View {
//        NavigationView {
//            VStack {
//                if viewModel.isLoading {
//                    ProgressView("Loading...")
//                } else if let error = viewModel.errorMessage {
//                    Text("Error: \(error)").foregroundColor(.red)
//                } else {
////                    List(viewModel.rates.sorted(by: { $0.key < $1.key }), id: \.key) { key, value in
////                        HStack {
////                            Text(key)
////                            Spacer()
////                            Text(String(format: "%.2f", value))
////                        }
////                    }
//                    
//                    List(viewModel.rates.sorted(by: { $0.key < $1.key }), id: \.key) { key, value in
//                        HStack {
//                            Text("\(flag(for: key)) \(key)") // Flag + Currency Code
//                                .font(.headline)
//                            Spacer()
//                            Text(String(format: "%.2f", value))
//                                .font(.subheadline)
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
//    
//    func flag(for currencyCode: String) -> String {
//        let countryCode = currencyToCountryCode[currencyCode] ?? String(currencyCode.prefix(2))
//        let base: UInt32 = 127397
//        
//        return countryCode.uppercased().unicodeScalars
//            .compactMap { UnicodeScalar(base + $0.value) }
//            .map { String($0) }
//            .joined()
//    }
//}

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ExchangeRateViewModel()
    
    let currencyToCountryCode: [String: String] = [
        "AED": "AE", "AFN": "AF", "ALL": "AL", "AMD": "AM", "ANG": "CW",
        "AOA": "AO", "ARS": "AR", "AUD": "AU", "AWG": "AW", "AZN": "AZ",
        "BAM": "BA", "BBD": "BB", "BDT": "BD", "BGN": "BG", "BHD": "BH",
        "BIF": "BI", "BMD": "BM", "BND": "BN", "BOB": "BO", "BRL": "BR",
        "BSD": "BS", "BTN": "BT", "BWP": "BW", "BYN": "BY", "BZD": "BZ",
        "CAD": "CA", "CDF": "CD", "CHF": "CH", "CLP": "CL", "CNY": "CN",
        "COP": "CO", "CRC": "CR", "CUP": "CU", "CVE": "CV", "CZK": "CZ",
        "DJF": "DJ", "DKK": "DK", "DOP": "DO", "DZD": "DZ", "EGP": "EG",
        "ERN": "ER", "ETB": "ET", "EUR": "EU", "FJD": "FJ", "FKP": "FK",
        "FOK": "FO", "GBP": "GB", "GEL": "GE", "GGP": "GG", "GHS": "GH",
        "GIP": "GI", "GMD": "GM", "GNF": "GN", "GTQ": "GT", "GYD": "GY",
        "HKD": "HK", "HNL": "HN", "HRK": "HR", "HTG": "HT", "HUF": "HU",
        "IDR": "ID", "ILS": "IL", "IMP": "IM", "INR": "IN", "IQD": "IQ",
        "IRR": "IR", "ISK": "IS", "JEP": "JE", "JMD": "JM", "JOD": "JO",
        "JPY": "JP", "KES": "KE", "KGS": "KG", "KHR": "KH", "KID": "KI",
        "KMF": "KM", "KRW": "KR", "KWD": "KW", "KYD": "KY", "KZT": "KZ",
        "LAK": "LA", "LBP": "LB", "LKR": "LK", "LRD": "LR", "LSL": "LS",
        "LYD": "LY", "MAD": "MA", "MDL": "MD", "MGA": "MG", "MKD": "MK",
        "MMK": "MM", "MNT": "MN", "MOP": "MO", "MRU": "MR", "MUR": "MU",
        "MVR": "MV", "MWK": "MW", "MXN": "MX", "MYR": "MY", "MZN": "MZ",
        "NAD": "NA", "NGN": "NG", "NIO": "NI", "NOK": "NO", "NPR": "NP",
        "NZD": "NZ", "OMR": "OM", "PAB": "PA", "PEN": "PE", "PGK": "PG",
        "PHP": "PH", "PKR": "PK", "PLN": "PL", "PYG": "PY", "QAR": "QA",
        "RON": "RO", "RSD": "RS", "RUB": "RU", "RWF": "RW", "SAR": "SA",
        "SBD": "SB", "SCR": "SC", "SDG": "SD", "SEK": "SE", "SGD": "SG",
        "SHP": "SH", "SLE": "SL", "SLL": "SL", "SOS": "SO", "SRD": "SR",
        "SSP": "SS", "STN": "ST", "SYP": "SY", "SZL": "SZ", "THB": "TH",
        "TJS": "TJ", "TMT": "TM", "TND": "TN", "TOP": "TO", "TRY": "TR",
        "TTD": "TT", "TVD": "TV", "TWD": "TW", "TZS": "TZ", "UAH": "UA",
        "UGX": "UG", "USD": "US", "UYU": "UY", "UZS": "UZ", "VES": "VE",
        "VND": "VN", "VUV": "VU", "WST": "WS", "XAF": "CM", "XCD": "AG",
        "XCG": "CW", "XDR": "IMF", "XOF": "BJ", "XPF": "PF", "YER": "YE",
        "ZAR": "ZA", "ZMW": "ZM", "ZWL": "ZW"
    ]
    
    func flag(for currencyCode: String) -> String {
        let base: UInt32 = 127397
        let countryCode = currencyToCountryCode[currencyCode] ?? String(currencyCode.prefix(2))
        
        return countryCode.uppercased().unicodeScalars
            .compactMap { UnicodeScalar(base + $0.value) }
            .map { String($0) }
            .joined()
    }
    
    var body: some View {
        NavigationView {
            VStack {
                if viewModel.isLoading {
                    ProgressView("Loading...")
                } else if let error = viewModel.errorMessage {
                    Text("Error: \(error)").foregroundColor(.red)
                } else {
                                        List(viewModel.rates.sorted(by: { $0.key < $1.key }), id: \.key) { key, value in
                                            HStack {
                                                Text(key)
                                                Spacer()
                                                Text(String(format: "%.2f", value))
                                            }
                                        }
                    
//                    List(viewModel.rates.sorted(by: { $0.key < $1.key }), id: \.key) { key, value in
//                        HStack {
//                            Text("\(flag(for: key)) \(key)") // Flag + Currency Code
//                                .font(.headline)
//                            Spacer()
//                            Text(String(format: "%.2f", value))
//                                .font(.subheadline)
//                        }
//                    }
                    
                    
                }
            }
            .navigationTitle("Exchange Rates")
            .onAppear {
                viewModel.loadRates()
            }
        }
    }
    
}

