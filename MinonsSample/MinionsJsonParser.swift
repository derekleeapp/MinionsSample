import Foundation

protocol DataParser {
    typealias ParsedObject

    func parse(jsonData: NSData) -> [ParsedObject]
}

class MinionsJsonParser: DataParser {

    func parse(jsonData: NSData) -> [Minion] {

        let json = try? NSJSONSerialization.JSONObjectWithData(jsonData, options: [])

        if let minionsObj = json as? [Dictionary<String, AnyObject>] {

            var minionsArray: [Minion] = []

            for minionJson in minionsObj {

                if
                    let name = minionJson["name"] as? String,
                    let username = minionJson["username"] as? String {

                        let email = minionJson["email"] as? String

                        let minion = Minion(name: name, username: username, email: email)

                        minionsArray.append(minion)
                }
            }

            return minionsArray
        }

        return []
    }
}
