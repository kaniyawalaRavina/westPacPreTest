//
//  CommentsDetailsFactory.swift
//  PreTestTask
//
//  Created by Riya Kaniyawala on 09/06/21.
//

import Foundation
import UIKit

struct CommentsDetailsFactory {
    
    private static let _shared = CommentsDetailsFactory()
    
    static var shared : CommentsDetailsFactory {
        return _shared
    }
    
    let storyboardId = "CommentsDetails"
    let initialControllerId = "CommentDetailsVC"
    
    func createModule(posts : Post?) -> UIViewController {
        
        let storyboard = UIStoryboard(name: storyboardId, bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: initialControllerId) as? CommentsDetailsViewController
        //
        let presenter   = CommentsDetailsPresenter()
        let router      = CommentsDetailsRouter()
        let interactor  = CommentsDetailsInteractor()
        //
        presenter.view      = controller
        presenter.interactor = interactor
        presenter.router    = router
        //
        router.viewController = controller
        //
        controller?.post = posts
        interactor.postId = posts?.id
        //
        interactor.output = presenter
        controller?.output = presenter
        
        return controller!
    }
}
