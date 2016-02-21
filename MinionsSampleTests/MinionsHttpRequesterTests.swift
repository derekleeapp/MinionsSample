import Foundation
import XCTest
@testable import MinionsSample

class MinionsHttpRequesterTest: XCTestCase {

    var minionsHttpRequester: MinionsHttpRequester!
    
    override func setUp() {
        minionsHttpRequester = MinionsHttpRequester()
    }
    
    func testCanRequestFromUrlString() {
        
        let expectation = expectationWithDescription("SomeService does stuff and runs the callback closure")

        let urlString = "http://jsonplaceholder.typicode.com/users"
        
        minionsHttpRequester.request(urlString) { (data: NSData) -> Void in
            XCTAssertNotNil(data)
            
            // Fulfill the expectation we initially defined
            expectation.fulfill();
        }
        
        // 5 seconds may be a little long
        waitForExpectationsWithTimeout(5) { error -> Void in
            if let error = error {
                XCTFail("waitForExpectationsWithTimeout errored: \(error)")
            }
        }
    }
    
}