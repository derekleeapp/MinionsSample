import Foundation

protocol Repo {
    func getMinionsAsynchronously(completionHandler: ([Minion] -> Void))
}

struct MinionsRepo
    <P: DataParser where P.ParsedObject == Minion>
{
    let parser: P
    let requester: MinionsHttpRequester
}

extension MinionsRepo: Repo {
    func getMinionsAsynchronously(completion: ([Minion] -> Void)) {

        let urlString = "http://jsonplaceholder.typicode.com/users"
        self.requester.request(urlString) { (data: NSData?) -> Void in
            let minionsArray = self.parser.parse(data!)
            
            completion(minionsArray)
        }
    }
}
