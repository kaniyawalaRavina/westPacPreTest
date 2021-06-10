//
//  CommentsDetailsInteractorOutput.swift
//  PreTestTask
//
//  Created by Riya Kaniyawala on 09/06/21.
//

import Foundation

//MARK: - Interactor -> Presenter
protocol CommentsDetailsInteractorOutput: AnyObject {
    
}

//MARK: - Presenter -> Interactor
protocol CommentsDetailsInteractorInupt {
    func getComments(success: @escaping (([Comments?])) -> Void, failure: @escaping (String?) -> ())
}
