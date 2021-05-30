//
//  PostDetailsFactory.swift
//  PreTestTask
//
//  Created by Riya Kaniyawala on 30/05/21.
//

import UIKit

struct PostDetailsFactory {
    
    private static let _shared = PostDetailsFactory()
    
    static var shared : PostDetailsFactory {
        return _shared
    }
    
    let storyboardId = "PostDetails"
    let initialControllerId = "PostDetailsVC"
    
    func createModule(post : Post?) -> UIViewController {
        
        let storyboard = UIStoryboard(name: storyboardId, bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: initialControllerId) as? PostDetailsVC
        //
        let presenter   = PostDetailsPresenter()
        let router      = PostDetailsRouter()
        let interactor  = PostDetailsInteractor()
        //
        presenter.view      = controller
        presenter.interactor = interactor
        presenter.router    = router
        //
        router.viewController = controller
        //
        controller?.post = post
        interactor.userid = post?.userId
        //
        interactor.output = presenter
        controller?.output = presenter
        
        return controller!
    }
}
