//import Foundation
//import Combine
//
//class ExchangeRateViewModel: ObservableObject {
//    @Published var rates: [String: Double] = [:]
//    @Published var isLoading = false
//    @Published var errorMessage: String?
//
//    
//    
//    func loadRates() {
//        isLoading = true
//        errorMessage = nil
//
//        NetworkManager.shared.fetchExchangeRates { [weak self] result in
//            DispatchQueue.main.async {
//                self?.isLoading = false
//                switch result {
//                case .success(let response):
//                    self?.rates = response.conversion_rates
//                case .failure(let error):
//                    self?.errorMessage = error.localizedDescription
//                }
//            }
//        }
//    }
//    
//    
//
//}

import Foundation
import Combine

//protocol ExchangeRateServiceProtocol {
//    func fetchExchangeRates(completion: @escaping (Result<ExchangeRateResponse, Error>) -> Void)
//}
class ExchangeRateViewModel: ObservableObject {
    @Published var rates: [String: Double] = [:]
    @Published var isLoading = false
    @Published var errorMessage: String?

    private let service: ExchangeRateServiceProtocol

    init(service: ExchangeRateServiceProtocol = NetworkManager.shared) {
           self.service = service
       }
        
    func loadRates() {
        isLoading = true
        errorMessage = nil

        service.fetchExchangeRates { [weak self] result in
            DispatchQueue.main.async {
                self?.isLoading = false
                switch result {
                case .success(let response):
                    self?.rates = response.conversion_rates
                case .failure(let error):
                    self?.errorMessage = error.localizedDescription
                }
            }
        }
    }
    

    
    

    
    

}
