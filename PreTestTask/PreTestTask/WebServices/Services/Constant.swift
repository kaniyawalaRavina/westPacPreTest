//
//  Constant.swift
//  PreTestTask
//
//  Created by Riya Kaniyawala on 30/05/21.
//


import Foundation

enum PostDeailsSection : Int , CaseIterable{
    case PostDetails
    case UserDetails
    
    func sectionTitle() -> String{
        switch self {
        case .PostDetails:
            return "Post Detail"
        case .UserDetails:
            return "User Detail"
        }
    }
}
enum CommentsDeailsSection : Int , CaseIterable{
    case PostCommentsDetails
    case CommentsDetails
    
    func sectionTitle() -> String {
        switch self {
        case .PostCommentsDetails:
            return "Post Detail"
        case .CommentsDetails:
            return "Comments Detail"
        }
    }
}
enum Usercell: Int, CaseIterable {
    case name
    case username
    case email
    case address
    case phone
    case website
    case companyname
    
    func userCellTitle() -> String {
        switch self {
        case .name:
            return "Name"
        case .username:
            return "Username"
        case .email:
            return "Email"
        case .address:
            return "Address"
        case .phone:
            return "Phone"
        case .website:
            return "Website"
        case .companyname:
            return "Compant Name"
        }
    }
}

