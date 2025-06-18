import Foundation

struct ExchangeRateResponse: Codable {
    let base_code: String
    let conversion_rates: [String: Double]
}
