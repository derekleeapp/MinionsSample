import Foundation
import XCTest
@testable import MinonsSample

class MinionsJsonParserTest: XCTestCase {

    var minionsJsonParser: MinionsJsonParser!

    override func setUp() {
        minionsJsonParser = MinionsJsonParser()
    }

    func testCanCreateMinionsFromJson() {

        let json = "[{\"name\": \"Bob\",\"username\": \"bminion\",\"email\": \"bob@minion.io\",}]".dataUsingEncoding(NSUTF8StringEncoding)!

        let minions = minionsJsonParser.parse(json)

        XCTAssertTrue(minions.count == 1)

        let minion = minions[0]
        XCTAssertTrue(minion.name == "Bob")
        XCTAssertTrue(minion.username == "bminion")
        XCTAssertTrue(minion.email == "bob@minion.io")
    }

    func testInvalidMinionsJsonReturnsNoMinions() {

        let json = "[{\"email\": \"email@test.com\",}]".dataUsingEncoding(NSUTF8StringEncoding)!

        let minions = minionsJsonParser.parse(json)

        XCTAssertNotNil(minions)
        XCTAssertTrue(minions.count == 0)
    }

    func testGarbageJsonReturnsNoMinions() {

        let json = "asdf98764".dataUsingEncoding(NSUTF8StringEncoding)!

        let minions = minionsJsonParser.parse(json)

        XCTAssertNotNil(minions)
        XCTAssertTrue(minions.count == 0)
    }

}
