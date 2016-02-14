import Foundation

struct Minion {
    let name: String
}

extension Minion: Equatable {}

func ==(lhs: Minion, rhs: Minion) -> Bool {
    return lhs.name == rhs.name
}
