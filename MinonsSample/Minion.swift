import Foundation

struct Minion {
    let name: String
    let username: String
    let email: String?
}

extension Minion: Equatable {}

func ==(lhs: Minion, rhs: Minion) -> Bool {
    return
        lhs.name == rhs.name &&
        lhs.username == rhs.username &&
        lhs.email == rhs.email
}
