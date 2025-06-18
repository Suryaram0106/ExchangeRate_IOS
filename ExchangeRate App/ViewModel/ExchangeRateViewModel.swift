import Foundation
import Combine

class ExchangeRateViewModel: ObservableObject {
    @Published var rates: [String: Double] = [:]
    @Published var isLoading = false
    @Published var errorMessage: String?

    


    
    func loadRates() {
        isLoading = true
        errorMessage = nil

        NetworkManager.shared.fetchExchangeRates { [weak self] result in
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
