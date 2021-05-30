//
//  PostIO.swift
//  PreTestTask
//
//  Created by Riya Kaniyawala on 30/05/21.
//

import UIKit

//MARK: - Presenter -> View
protocol PostViewInput : AnyObject {
    func update(posts: [Post?])
}

//MARK: - View ->Presenter
protocol PostViewOutput {
    func viewIsReady()
    func didTouchPost(post: Post?)
}
