// MockSuccessService.swift
import Foundation
@testable import ExchangeRate_App

class MockSuccessService: ExchangeRateServiceProtocol {
    
    func fetchExchangeRates(completion: @escaping (Result<ExchangeRate_App.ExchangeRateResponse, Error>) -> Void) {
        let mockResponse = ExchangeRate_App.ExchangeRateResponse(
            base_code: "USD",
            conversion_rates: ["USD": 1.0, "INR": 86.5]
        )
        completion(.success(mockResponse))
    }
}

