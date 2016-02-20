import Foundation

protocol Repo {
    func getMinionsAsynchronously(completionHandler: ([Minion] -> Void))
}

struct MinionsRepo
    <P: DataParser where P.ParsedObject == Minion>
{
    let parser: P
}

extension MinionsRepo: Repo {
    func getMinionsAsynchronously(completion: ([Minion] -> Void)) {

        let urlString = "http://jsonplaceholder.typicode.com/users"
        let url = NSURL(string: urlString)!
        let urlRequest = NSURLRequest(URL: url)

        let _ = NSURLSession
            .sharedSession()
            .dataTaskWithRequest(
                urlRequest,
                completionHandler: {
                    (maybeData: NSData?,
                    maybeResponse: NSURLResponse?,
                    maybeError: NSError?) -> Void in

                    let minionsArray = self.parser.parse(maybeData!)

                    completion(minionsArray)
                })
            .resume()
    }
}
