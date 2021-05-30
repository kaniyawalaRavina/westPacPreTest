//
//  PostInteractorIO.swift
//  PreTestTask
//
//  Created by Riya Kaniyawala on 30/05/21.
//

import UIKit

//MARK: - Interactor -> Presenter
protocol PostInteractorOutput: AnyObject {
    
}

//MARK: - Presenter -> Interactor
protocol PostInteractorInupt {
    func loadPosts(success: @escaping (([Post?])) -> Void, failure: @escaping (String?) -> ())
}
