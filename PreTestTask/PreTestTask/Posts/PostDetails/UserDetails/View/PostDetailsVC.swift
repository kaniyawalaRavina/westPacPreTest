//
//  PostDetailsVC.swift
//  PreTestTask
//
//  Created by Riya Kaniyawala on 30/05/21.
//

import UIKit

class PostDetailsVC: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Dependencies
    var output : PostDetailsViewOutput!
    
    var post: Post?
    var user: User?
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Details"
        self.navigationController?.navigationBar.prefersLargeTitles = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        output.viewIsReady()
    }

}

//MARK:- Table View delegate
extension PostDetailsVC : UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        PostDeailsSection.allCases.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == PostDeailsSection.PostDetails.rawValue {
            return PostDeailsSection.sectionTitle(.PostDetails)()
        } else {
            return PostDeailsSection.sectionTitle(.UserDetails)()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == PostDeailsSection.PostDetails.rawValue {
            return 1
        } else {
            return Usercell.allCases.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == PostDeailsSection.PostDetails.rawValue {
            let cell = tableView.dequeueReusableCell(withIdentifier: "PostDetailCell", for: indexPath)
            cell.textLabel?.text = post?.title
            cell.detailTextLabel?.text = post?.body
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "UserDetailCell", for: indexPath)
            switch Usercell(rawValue: indexPath.row) {
            case .name:
                cell.textLabel?.text = Usercell.userCellTitle(.name)()
                cell.detailTextLabel?.text = user?.name
            case .username:
                cell.textLabel?.text = Usercell.userCellTitle(.username)()
                cell.detailTextLabel?.text = user?.username
            case .email:
                cell.textLabel?.text = Usercell.userCellTitle(.email)()
                cell.detailTextLabel?.text = user?.email
            case .address:
                cell.textLabel?.text = Usercell.userCellTitle(.address)()
                let add = "\(user?.address?.suite ?? "") \(user?.address?.street ?? ""), \(user?.address?.city ?? ""), \(user?.address?.zipcode ?? "")"
                cell.detailTextLabel?.text = add
            case .phone:
                cell.textLabel?.text = Usercell.userCellTitle(.phone)()
                cell.detailTextLabel?.text = user?.phone
            case .website:
                cell.textLabel?.text = Usercell.userCellTitle(.website)()
                cell.detailTextLabel?.text = user?.website
            case .companyname:
                cell.textLabel?.text = Usercell.userCellTitle(.companyname)()
                cell.detailTextLabel?.text = user?.company?.name
            default:
                break
            }
            return cell
        }
    }
}

//MARK:- PostDetailsViewInput
extension PostDetailsVC : PostDetailsViewInput {
    func update(user: User?) {
        self.user = user
        tableView.reloadData()
    }
 }
