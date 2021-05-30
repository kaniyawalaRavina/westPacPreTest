//
//  PostDetailsPresenter.swift
//  PreTestTask
//
//  Created by Riya Kaniyawala on 30/05/21.
//

import UIKit
import SVProgressHUD
class PostDetailsPresenter {
    
    //MARK:- Variables & Constant
    weak var view   : PostDetailsViewInput!
    var interactor  : PostDetailsInteractorInupt!
    var router      : PostDetailsRouterInput!
    var user: User?
}

//MARK:- View Output
extension PostDetailsPresenter: PostDetailsViewOutput {
    func viewIsReady() {
        getUserDetail()
    }
}

//MARK:- Interactor Output
extension PostDetailsPresenter: PostDetailsInteractorOutput {
    
}

//MARK:- Private Method
extension PostDetailsPresenter {
    func getUserDetail() {
        SVProgressHUD.show()
        interactor.getUser { (user) in
            SVProgressHUD.dismiss()
            self.user = user
            self.view.update(user: self.user)
        } failure: { (error) in
            SVProgressHUD.dismiss()
        }

    }
}
