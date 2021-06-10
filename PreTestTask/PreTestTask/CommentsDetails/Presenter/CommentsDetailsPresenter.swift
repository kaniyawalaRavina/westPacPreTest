//
//  CommentsDetailsPresenter.swift
//  PreTestTask
//
//  Created by Riya Kaniyawala on 09/06/21.
//

import Foundation
import UIKit
import SVProgressHUD
class CommentsDetailsPresenter {
    
    //MARK:- Variables & Constant
    weak var view   :CommentsDetailsViewInput!
    var interactor  : CommentsDetailsInteractorInupt!
    var router      : CommentsDetailsRouterInput!
    var comments: [Comments?] = []
    var commentsNameArray: [String] = []
}

//MARK:- View Output
extension CommentsDetailsPresenter: CommentsDetailsViewOutput {
    func viewIsReady() {
        getCommentsDetail()
        commentsNameArray = getnameArray()
    }
}

//MARK:- Interactor Output
extension CommentsDetailsPresenter: CommentsDetailsInteractorOutput {
    
}

//MARK:- Private Method
extension CommentsDetailsPresenter {
    func getCommentsDetail() {
        SVProgressHUD.show()
        interactor.getComments { (comments) in
            SVProgressHUD.dismiss()
            self.comments = comments
            self.view.update(comments: self.comments)
        } failure: { (error) in
            SVProgressHUD.dismiss()
        }

    }
    func getnameArray() -> [String] {
        var nameArray: [String] = []
        for comment in comments {
            print("name is :::\(String(describing: comment?.name))")
            nameArray.append(comment?.name ?? "")
        }
        return nameArray
    }
}
