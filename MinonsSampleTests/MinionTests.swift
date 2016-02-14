import XCTest
@testable import MinonsSample

class MinionTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testThatTwoMinionsAreEqual() {
        let minion1 = Minion(name: "Dave")
        let minion2 = Minion(name: "Dave")

        XCTAssertTrue(minion1 == minion2)
    }

    func testThatTwoDifferentMinionsAreNotTheSame() {
        let minion1 = Minion(name: "Dave")
        let minion2 = Minion(name: "Bob")

        XCTAssertTrue(minion1 != minion2)
    }
}
