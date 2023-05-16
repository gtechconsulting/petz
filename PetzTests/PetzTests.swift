//
//  PetzTests.swift
//  PetzTests
//
//  Created by Camilo Oscar Girardelli Baptista on 15/05/23.
//

import XCTest
@testable import Petz

final class PetzTests: XCTestCase {

    func test_CardListApiResource_With_ValidResquest_Return_CardListResponse() {
        
        let cardTypeHeroURL = WebServiceAPIPaths.cardTypeAPIPath + "Hero"
        let expectation = self.expectation(description: "ValidResquest_Return_CardListResponse")
        
        WebServiceManager.sharedService.requestAPI(url: cardTypeHeroURL, parameter: nil, httpMethodType: .GET) { (response, error) in
            
            XCTAssertNotNil(response)
            XCTAssertNil(error)
            XCTAssertGreaterThan(response!.count, 0)
            expectation.fulfill()
            
        }
        
        waitForExpectations(timeout: 15, handler: nil)
    }

}
