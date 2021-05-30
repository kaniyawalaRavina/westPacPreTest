//
//  PostVC.swift
//  PreTestTask
//
//  Created by Riya Kaniyawala on 30/05/21.
//

import UIKit

class PostVC: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var postTableView: UITableView!
    
    // MARK: - Dependencies
    var output : PostViewOutput!

    var posts: [Post?] = []
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Post"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.prefersLargeTitles = true
        output.viewIsReady()
    }
}

//MARK:- TableView Delegate
extension PostVC : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath)
        cell.textLabel?.text = posts[indexPath.row]?.title
        cell.textLabel?.numberOfLines = 0
        cell.detailTextLabel?.text = posts[indexPath.row]?.body
        cell.detailTextLabel?.numberOfLines = 0
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        output.didTouchPost(post: posts[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}

//MARK:- PostViewInput
extension PostVC : PostViewInput {
    
    func update(posts: [Post?]) {
        self.posts = posts
        postTableView.reloadData()
    }

}
