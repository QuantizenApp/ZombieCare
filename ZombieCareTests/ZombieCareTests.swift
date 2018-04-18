//
//  ZombieCareTests.swift
//  ZombieCareTests
//
//  Created by Chris Baxter on 09/06/2016.
//  Copyright © 2016 Catalyst Mobile Ltd. All rights reserved.
//

import XCTest
@testable import ZombieCare

class ZombieCareTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testTheMockService() {
        
        let service = newZCService(.Mock)
        
        let mockResource = MockResource(path: "careplan", method: "GET", headers: nil, parameters: nil)
        let expectation = self.expectation(description: "Mock Service expected")
        
        
        service.request(mockResource) { (carePlan : CarePlan?, error) in
            
            if error == nil {
                
                print("\(carePlan!.title)")
            }
            else {
                XCTFail()
            }
            
            XCTAssert(carePlan?.activities.count == 5)
            
            
            carePlan?.interventionActivities({ (activities) in
                XCTAssert(activities.count == 3)
            })
            
            carePlan?.assessmentActivities({ (activities) in
                XCTAssert(activities.count == 2)
            })
            
            
            expectation.fulfill()
            
            return
        }
        
        self.waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
