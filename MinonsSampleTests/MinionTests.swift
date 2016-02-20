import XCTest
@testable import MinonsSample

class MinionTests: XCTestCase {

    func testThatTwoMinionsAreEqual() {
        let minion1 = Minion(name: "Dave", username: "Dave", email: "")
        let minion2 = Minion(name: "Dave", username: "Dave", email: "")

        XCTAssertTrue(minion1 == minion2)
    }

    func testThatTwoDifferentMinionsAreNotTheSame() {
        let minion1 = Minion(name: "Dave", username: "Dave", email: "")
        let minion2 = Minion(name: "Bob", username: "Bob", email: "")

        XCTAssertTrue(minion1 != minion2)
    }

}
