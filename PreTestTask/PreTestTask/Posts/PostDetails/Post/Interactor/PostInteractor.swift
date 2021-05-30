//
//  PostInteractor.swift
//  PreTestTask
//
//  Created by Riya Kaniyawala on 30/05/21.
//

import UIKit
import ObjectMapper

class PostInteractor {
    
    //MARK:- Variable & Constant
    weak var output : PostInteractorOutput!
}

//MARK:- PostInteractorInupt
extension PostInteractor: PostInteractorInupt {
    func loadPosts(success: @escaping (([Post?])) -> Void, failure: @escaping (String?) -> ()) {
        let endpoint = "posts"
        AlamofireHelper.alamofireRequestWithoutTokenFromUrl(endpoint, params: nil, method: .get) { (result) in
            
            guard let json = result else {return}
            var posts: [Post?] = []
            print(json)
            if let jsonPosts = json as? [[String: Any]] {
                for c in jsonPosts {
                    let map = Map.init(mappingType: .fromJSON, JSON: c)
                    posts.append(Post(map: map))
                }
            }
            success((posts))
            
        } failure: { (error) in
            failure(error)
        }
    }
    
    
}

final class PostInteractorOutputMock: PostInteractorOutput {
    
}
