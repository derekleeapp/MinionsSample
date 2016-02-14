import Foundation

protocol Supplier {

    func getMinionsSynchronously() -> [Minion]
    func getMinionsAsynchronously(completionHandler: ([Minion] -> Void))

}

class MinionSupplier: Supplier {

    func getMinionsSynchronously() -> [Minion] {
        print("getMinions() synchronous")

        let minions = [Minion(name: "Bob"), Minion(name: "Dave"), Minion(name: "Suzie"), Minion(name: "Lucy")]
        return minions
    }

    func getMinionsAsynchronously(completionHandler: ([Minion] -> Void)) {

        let minions = [Minion(name: "Bob"), Minion(name: "Dave"), Minion(name: "Suzie"), Minion(name: "Lucy")]

        completionHandler(minions)

    }
}
