//
//  PostDetailsIO.swift
//  PreTestTask
//
//  Created by Riya Kaniyawala on 30/05/21.
//

import UIKit

//MARK: - Presenter -> View
protocol PostDetailsViewInput : AnyObject {
    func update(user: User?)
}

//MARK: - View ->Presenter
protocol PostDetailsViewOutput {
    func viewIsReady()
}
