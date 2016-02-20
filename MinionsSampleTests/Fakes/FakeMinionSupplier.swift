import Foundation
@testable import MinionsSample

class FakeMinionRepo: Repo {

    var getTheMinionsWasCalled = false
    var result = [
        Minion(name: "Fred", username: "Fred", email: ""),
        Minion(name: "Alex", username: "Alex", email: "")
    ]

    func getMinionsSynchronously() -> [Minion] {
        getTheMinionsWasCalled = true
        return result
    }

    func getMinionsAsynchronously(completionHandler: ([Minion] -> Void)) {
        getTheMinionsWasCalled = true
        completionHandler(result)
    }
    
}
