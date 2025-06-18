// MockSuccessService.swift
import Foundation
@testable import ExchangeRate_App


// MockFailureService.swift
class MockFailureService: ExchangeRateServiceProtocol {
    struct MockError: Error {}
    
    func fetchExchangeRates(completion: @escaping (Result<ExchangeRate_App.ExchangeRateResponse, Error>) -> Void) {
        completion(.failure(MockError()))
    }
}

