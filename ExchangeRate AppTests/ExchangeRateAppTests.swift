import XCTest
@testable import ExchangeRate_App

final class ExchangeRateViewModelTests: XCTestCase {
    
    func testLoadRatesSuccess() {
        let viewModel = ExchangeRateViewModel(service: MockSuccessService())
        let expectation = self.expectation(description: "Rates loaded")

        viewModel.loadRates()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            XCTAssertEqual(viewModel.rates["USD"], 1.0)
            XCTAssertEqual(viewModel.rates["INR"], 86.5)
            XCTAssertNil(viewModel.errorMessage)
            XCTAssertFalse(viewModel.isLoading)
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 2, handler: nil)
    }
    
    func testLoadRatesFailure() {
        let viewModel = ExchangeRateViewModel(service: MockFailureService())
        let expectation = self.expectation(description: "Error handled")
        
        viewModel.loadRates()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            XCTAssertTrue(viewModel.rates.isEmpty)
            XCTAssertNotNil(viewModel.errorMessage)
            XCTAssertFalse(viewModel.isLoading)
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 2, handler: nil)
    }
}
