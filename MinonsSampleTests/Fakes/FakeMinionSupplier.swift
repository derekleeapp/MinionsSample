import Foundation
@testable import MinonsSample

class FakeMinionSupplier: Supplier {

    var getTheMinionsWasCalled = false
    var result = [Minion(name: "Fred"), Minion(name: "Alex")]

    func getMinionsSynchronously() -> [Minion] {
        getTheMinionsWasCalled = true
        return result
    }

    func getMinionsAsynchronously(completionHandler: ([Minion] -> Void)) {
        getTheMinionsWasCalled = true
        completionHandler(result)
    }
    
}
