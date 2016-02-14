import XCTest
@testable import MinonsSample

class MinionSupplierTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testGetMinionsSynchronouslyReturnsMinions() {
        let minionSupplier = MinionSupplier()

        let minions: [Minion] = minionSupplier.getMinionsSynchronously()

        XCTAssertTrue(minions.count == 4)
        XCTAssertTrue(minions[0].name == "Bob")
        XCTAssertTrue(minions[1].name == "Dave")
    }

    func testGetMinionsAsynchronouslyReturnsMinions() {
        let minionSupplier = MinionSupplier()

        minionSupplier.getMinionsAsynchronously { arrayOfMinions in

            print("arrayOfMinions.count: \(arrayOfMinions.count)")
            print("arrayOfMinions: \(arrayOfMinions)")

            XCTAssertTrue(arrayOfMinions.count == 4)
            XCTAssertTrue(arrayOfMinions[0].name == "Bob")
            XCTAssertTrue(arrayOfMinions[1].name == "Dave")
        }

    }


    //MARK: - Private Methods
    func createXYZ() {
        // Private!
    }

}
