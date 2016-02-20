import XCTest
@testable import MinonsSample

class MinionRepoTests: XCTestCase {

    // TODO: Test that MinionsRepo makes a call to the http object

    func testGetMinionsAsynchronouslyParsesData() {
        let fakeJsonParser = FakeJsonParser()
        let minionRepo = MinionsRepo(parser: fakeJsonParser)

        minionRepo.getMinionsAsynchronously { _ in }

        let expectedData: NSData = "test".dataUsingEncoding(NSUTF8StringEncoding)!

        XCTAssertEqual(fakeJsonParser.parse_arg, expectedData)
    }
    
}
