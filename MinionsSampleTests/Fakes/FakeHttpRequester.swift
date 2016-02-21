import Foundation
@testable import MinionsSample

class FakeHttpRequester: HttpRequester {

    var request_arg = String()
    let request_result = "[{\"name\": \"Bob\",\"username\": \"bminion\",\"email\": \"bob@minion.io\",}]".dataUsingEncoding(NSUTF8StringEncoding)!
    
    func request(urlString: String, completion: (NSData? -> Void)) {
        
        request_arg = urlString
        completion(request_result)
        
    }
}