//import Foundation
//
//class NetworkManager {
//    static let shared = NetworkManager()
//    private init() {}
//
//    private let baseURL = "https://v6.exchangerate-api.com/v6/0601664db3e6cb1c57b2e7c4/latest/USD"
//
//    //private let baseURL = "http://api.exchangeratesapi.io/v1/latest?access_key=0353337fec4fa397a71d253769676291"
//    
//    func fetchExchangeRates(completion: @escaping (Result<ExchangeRateResponse, Error>) -> Void) {
//        guard let url = URL(string: baseURL) else {
//            completion(.failure(NSError(domain: "Invalid URL", code: -1)))
//            return
//        }
//
//        let task = URLSession.shared.dataTask(with: url) { data, _, error in
//            if let error = error {
//                completion(.failure(error))
//                return
//            }
//
//            guard let data = data else {
//                completion(.failure(NSError(domain: "No data", code: -1)))
//                return
//            }
//
//            do {
//                let result = try JSONDecoder().decode(ExchangeRateResponse.self, from: data)
//                print("✅ API Response: \(result)")
//                print("🔁 Conversion Rates: \(result.conversion_rates)")
//                completion(.success(result))
//            } catch {
//                print("❌ Decoding error: \(error)")
//                completion(.failure(error))
//            }
//        }
//
//        task.resume()
//    }
//}

import Foundation


class NetworkManager: ExchangeRateServiceProtocol {
    static let shared = NetworkManager()
    private init() {}

    private let baseURL = "https://v6.exchangerate-api.com/v6/0601664db3e6cb1c57b2e7c4/latest/USD"

    func fetchExchangeRates(completion: @escaping (Result<ExchangeRateResponse, Error>) -> Void) {
        guard let url = URL(string: baseURL) else {
            completion(.failure(NSError(domain: "Invalid URL", code: -1)))
            return
        }

        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let data = data else {
                completion(.failure(NSError(domain: "No data", code: -1)))
                return
            }

            do {
                let result = try JSONDecoder().decode(ExchangeRateResponse.self, from: data)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }

        task.resume()
    }
}



