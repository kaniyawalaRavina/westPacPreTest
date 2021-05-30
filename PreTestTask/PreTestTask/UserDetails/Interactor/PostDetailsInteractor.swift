//
//  PostDetailsInteractor.swift
//  PreTestTask
//
//  Created by Riya Kaniyawala on 30/05/21.
//

import UIKit
import ObjectMapper

class PostDetailsInteractor {
    
    //MARK:- Variable & Constant
    weak var output : PostDetailsInteractorOutput!
    var userid: Int!
}

//MARK:- UserInteractorInupt
extension PostDetailsInteractor: PostDetailsInteractorInupt {
    func getUser(success: @escaping ((User?)) -> Void, failure: @escaping (String?) -> ()) {
        let endpoint = "users/\(userid ?? 0)"
        AlamofireHelper.alamofireRequestWithoutTokenFromUrl(endpoint, params: nil, method: .get) { (result) in
            guard let json = result as? [String: Any] else {return}
            var user: User?
            print(json)
            let map = Map.init(mappingType: .fromJSON, JSON: json)
            user = User(map: map)
            success((user))
            
        } failure: { (error) in
            failure(error)
        }
    }
}
