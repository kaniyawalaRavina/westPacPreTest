//
//  AlamofireHelper.swift
//  PreTestTask
//
//  Created by Riya Kaniyawala on 30/05/21.
//

import Foundation
import Alamofire

typealias successBlockAlamofire = (Any?) -> ()
typealias failureBlock = (String?) -> ()

class AlamofireHelper {
    
    private static let baseURL = "https://jsonplaceholder.typicode.com/"

    class func alamofireRequestWithoutTokenFromUrl(_ endpoint: String, params: Parameters?, method: HTTPMethod, success: @escaping successBlockAlamofire, failure: @escaping failureBlock) {
        let url = URL(string: baseURL + endpoint)!
  
        Alamofire.request(url, method: method, parameters: params, encoding: URLEncoding.default, headers: nil).responseJSON { (response) in
            switch response.result {
            case .success:
                #if DEBUG
//                print("Str-> \(response.result.value ?? "")")
                #endif
                if response.response?.statusCode == 401 {
                    var errStr = ""
                    if let json = response.result.value as? [String: Any], let err = json["error"] as? String {
                        errStr = err
                    }
                    failure(errStr)
                }
                else if response.response?.statusCode == 422 {
                    var errStr = ""
                    if let json = response.result.value as? [String: Any], let err = json["message"] as? String, let errors = json["errors"] as? [String: Any] {
                        for k in errors.keys {
                            if let error = errors[k] as? [String] {
                                for err in error {
                                    errStr.append(errStr.isEmpty ? "" : "\n")
                                    errStr.append(err)
                                }
                            }
                        }
                        errStr = errStr.isEmpty ? err : errStr
                    }
                    failure(errStr)
                }
                else {
                    //success
                    success(response.result.value)
                }
            case .failure:
                #if DEBUG
                print("Error result -> \(response.error.debugDescription)")
                #endif
                failure(response.error?.localizedDescription)
            }
        }
        
    }
}
