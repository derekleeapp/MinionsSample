import XCTest
import UIKit
@testable import MinionsSample

class MinionsTableViewControllerTests: XCTestCase {

    var minionsTableViewController: MinionsTableViewController!

    let fakeMinionsRepo = FakeMinionRepo()

    override func setUp() {
        super.setUp()

        minionsTableViewController = MinionsTableViewController(minionsRepo: fakeMinionsRepo)
    }

    func testFetchingMinionsAsynchronously() {
        let _ = minionsTableViewController!.view

        XCTAssertTrue(fakeMinionsRepo.getTheMinionsWasCalled)

        if let actualMinions = minionsTableViewController.minions {
            let expectedMinions = [
                Minion(name: "Fred", username: "Fred", email: ""),
                Minion(name: "Alex", username: "Alex", email: "")
            ]

            XCTAssertEqual(actualMinions, expectedMinions)
        } else {
            XCTFail("Minions are nil")
        }
    }

}
