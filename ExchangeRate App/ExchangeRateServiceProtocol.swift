//
//  ExchangeRateServiceProtocol.swift
//  ExchangeRate App
//
//  Created by Surya on 18/06/25.
//

protocol ExchangeRateServiceProtocol {
    func fetchExchangeRates(completion: @escaping (Result<ExchangeRateResponse, Error>) -> Void)
}

//protocol ExchangeRateServiceProtocol {
//    func fetchExchangeRates(base: String,completion: @escaping (Result<ExchangeRateResponse, Error>) -> Void)
//}
