import Foundation
@testable import MinionsSample

class FakeJsonParser: DataParser {

    var parse_arg = NSData()
    let parse_result = [
        Minion(name: "Fred", username: "Fred", email: ""),
        Minion(name: "Alex", username: "Alex", email: "")
    ]

    func parse(jsonData: NSData) -> [Minion] {

        parse_arg = jsonData

        return parse_result
    }
}
