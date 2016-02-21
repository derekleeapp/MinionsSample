import XCTest
@testable import MinionsSample

class MinionRepoTests: XCTestCase {

    // TODO: Test that MinionsRepo makes a call to the http object

    func testGetMinionsAsynchronouslyParsesData() {
        let fakeJsonParser = FakeJsonParser()
        let fakeHttpRequester = FakeHttpRequester()
        let minionRepo = MinionsRepo(parser: fakeJsonParser, requester: fakeHttpRequester)

        minionRepo.getMinionsAsynchronously { _ in }

        let expectedData: NSData = "[{\"name\": \"Bob\",\"username\": \"bminion\",\"email\": \"bob@minion.io\",}]".dataUsingEncoding(NSUTF8StringEncoding)!
        
        XCTAssertEqual(fakeJsonParser.parse_arg, expectedData)
    }
}
