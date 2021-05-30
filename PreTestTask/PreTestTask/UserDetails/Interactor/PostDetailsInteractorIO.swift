//
//  PostDetailsInteractorIO.swift
//  PreTestTask
//
//  Created by Riya Kaniyawala on 30/05/21.
//

import UIKit

//MARK: - Interactor -> Presenter
protocol PostDetailsInteractorOutput: AnyObject {
    
}

//MARK: - Presenter -> Interactor
protocol PostDetailsInteractorInupt {
    func getUser(success: @escaping ((User?)) -> Void, failure: @escaping (String?) -> ())
}
