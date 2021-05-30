//
//  PostPresenter.swift
//  PreTestTask
//
//  Created by Riya Kaniyawala on 30/05/21.
//

import UIKit
import SVProgressHUD
class PostPresenter {
    
    //MARK:- Variables & Constant
    weak var view   : PostViewInput!
    var interactor  : PostInteractorInupt!
    var router      : PostRouterInput!
    
    var posts: [Post?] = []
}

//MARK:- View Output
extension PostPresenter: PostViewOutput {
  
    func viewIsReady() {
        getPost()
    }
    
    func didTouchPost(post: Post?) {
        router.openPostDetailsModule(post: post)
    }
}

//MARK:- Interactor Output
extension PostPresenter: PostInteractorOutput {
    
}

//MARK:- Private Method
extension PostPresenter {
    private func getPost() {
        SVProgressHUD.show()
        interactor.loadPosts { [weak self] (posts) in
            SVProgressHUD.dismiss()
            guard let self = self else {return}
            self.posts = posts
            self.view.update(posts: self.posts)
        } failure: { (error) in
            SVProgressHUD.dismiss()
        }
    }
}
