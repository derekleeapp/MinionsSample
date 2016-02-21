import Foundation

protocol HttpRequester {
    
    func request(urlString: String, completion: (NSData? -> Void))
}

class MinionsHttpRequester: HttpRequester {
    
    func request(urlString: String, completion: (NSData? -> Void)) {
        
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
                    
                    completion(maybeData)
            })
            .resume()
    }
}