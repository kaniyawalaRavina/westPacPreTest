//
//  CommentsDetailsViewController.swift
//  PreTestTask
//
//  Created by Riya Kaniyawala on 09/06/21.
//

import UIKit

class CommentsDetailsViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var searchTextField: UITextField!
    // MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Dependencies
    var output : CommentsDetailsViewOutput!
    
    var post: Post?
    var comments: [Comments?] = []
    var filterComments: [Comments?] = []
    var isSearching: Bool = false
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Comments Details"
        self.navigationController?.navigationBar.prefersLargeTitles = false
        searchTextField.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        output.viewIsReady()
    }
   
    @IBAction func searchTextDidChange(_ sender: Any) {
        if searchTextField.text != "" {
            isSearching = true
        } else {
            isSearching = false
        }
        filterComments = searchTextField.text?.isEmpty ?? true ? comments : comments.filter{ $0?.name?.range(of: searchTextField.text ?? "", options: .caseInsensitive) != nil }
        print("comments count: \(filterComments.count)")
        tableView.reloadData()
    }
}

//MARK:- Table View delegate
extension CommentsDetailsViewController : UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        CommentsDeailsSection.allCases.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == CommentsDeailsSection.PostCommentsDetails.rawValue {
            return CommentsDeailsSection.sectionTitle(.PostCommentsDetails)()
        } else {
            return CommentsDeailsSection.sectionTitle(.CommentsDetails)()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == CommentsDeailsSection.PostCommentsDetails.rawValue {
            return 1
        } else {
            if isSearching {
                return filterComments.count
            } else {
            return comments.count
            }
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == CommentsDeailsSection.PostCommentsDetails.rawValue {
            let cell = tableView.dequeueReusableCell(withIdentifier: "PostForCommentDetailCell", for: indexPath)
            cell.textLabel?.text = post?.title
            cell.detailTextLabel?.text = post?.body
            return cell
        } else {
            var indexedComment: Comments?
            if isSearching {
                indexedComment = filterComments[indexPath.row]
                
            } else {
                indexedComment = comments[indexPath.row]
            }
            if let cell = tableView.dequeueReusableCell(withIdentifier: "CommentsDetailCell", for: indexPath) as? CommentsDetailTableViewCell {
                cell.commentsLabel.text = indexedComment?.body
                cell.nameLabel.text = indexedComment?.name
                return cell
            }
        }
        fatalError()
    }
}

//MARK:- PostDetailsViewInput
extension CommentsDetailsViewController : CommentsDetailsViewInput {
    func update(comments: [Comments?]) {
        self.comments = comments
        tableView.reloadData()
    }
}
