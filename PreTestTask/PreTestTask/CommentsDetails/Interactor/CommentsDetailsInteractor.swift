//
//  CommentsDetailsInteractor.swift
//  PreTestTask
//
//  Created by Riya Kaniyawala on 09/06/21.
//

import UIKit
import ObjectMapper

class CommentsDetailsInteractor {
    
    //MARK:- Variable & Constant
    weak var output : CommentsDetailsInteractorOutput!
    var postId: Int!
}

//MARK:- UserInteractorInupt
extension CommentsDetailsInteractor: CommentsDetailsInteractorInupt {
    
    func getComments(success: @escaping (([Comments?])) -> Void, failure: @escaping (String?) -> ()) {
        let endpoint = "comments?postId=\(postId ?? 0)"
        
        AlamofireHelper.alamofireRequestWithoutTokenFromUrl(endpoint, params: nil, method: .get) { (result) in
            guard let json = result else {return}
            var comments: [Comments?] = []
//            var comments: Comments?
            print("comments::::\(json)")
            if let jsonPosts = json as? [[String: Any]] {
                for c in jsonPosts {
                    let map = Map.init(mappingType: .fromJSON, JSON: c)
                    comments.append(Comments(map: map))
                }
            }
            success((comments))
//            print("all the comments: \(String(describing: comments?.body))")
            
        } failure: { (error) in
            failure(error)
        }
    }
}

