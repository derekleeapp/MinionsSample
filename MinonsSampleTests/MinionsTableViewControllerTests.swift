import XCTest
import UIKit
@testable import MinonsSample

class MinionsTableViewControllerTests: XCTestCase {

    let fakeMinionsSupplier = FakeMinionSupplier()

    var minionsTableViewController: MinionsTableViewController!

    override func setUp() {
        super.setUp()

        minionsTableViewController = MinionsTableViewController(minionSupplier: fakeMinionsSupplier)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testFetchingMinionsAsynchronously() {

        let _ = minionsTableViewController!.view

        XCTAssertTrue(fakeMinionsSupplier.getTheMinionsWasCalled)

        if let minions = minionsTableViewController.minions {
            print("minions: \(minions)")
            XCTAssertEqual(fakeMinionsSupplier.result, minions)
        } else {
            XCTFail("Minions are nil")
        }

    }
}
