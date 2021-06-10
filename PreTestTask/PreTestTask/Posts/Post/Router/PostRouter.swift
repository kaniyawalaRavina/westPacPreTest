//
//  PostRouter.swift
//  PreTestTask
//
//  Created by Riya Kaniyawala on 30/05/21.
//

import UIKit

class PostRouter {
    
    //MARK: - Variable & Constant
    weak var viewController : UIViewController?
}

//MARK:- Router Input Method
extension PostRouter : PostRouterInput {
    func openPostDetailsModule(post: Post?) {
//        //Navigate
//        let vc = PostDetailsFactory.shared.createModule(post: post)
//        self.viewController?.navigationController?.pushViewController(vc, animated: true)
        //Navigate to comments:
        let vc = CommentsDetailsFactory.shared.createModule(posts: post)
        self.viewController?.navigationController?.pushViewController(vc, animated: true)
    }
}
