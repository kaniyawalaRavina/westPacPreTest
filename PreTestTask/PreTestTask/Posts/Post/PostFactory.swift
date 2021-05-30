//
//  PostFactory.swift
//  PreTestTask
//
//  Created by Riya Kaniyawala on 30/05/21.
//

import UIKit

struct PostFactory {
    
    private static let _shared = PostFactory()
    
    static var shared : PostFactory {
        return _shared
    }
    
    //
    let storyboardId = "Post"
    let initialControllerId = "PostVC"
    
    func createModule() -> UIViewController {
        
        let storyboard = UIStoryboard(name: storyboardId, bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: initialControllerId) as? PostVC
        //
        let presenter   = PostPresenter()
        let router      = PostRouter()
        let interactor  = PostInteractor()
        //
        presenter.view      = controller
        presenter.interactor = interactor
        presenter.router    = router
        //
        router.viewController = controller
        //
        interactor.output = presenter
        controller?.output = presenter
        
        return controller!
    }
}
