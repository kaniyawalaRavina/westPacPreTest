//
//  User.swift
//  PreTestTask
//
//  Created by Riya Kaniyawala on 30/05/21.
//

import Foundation
import ObjectMapper

class User: Mappable {
    
    var address: Address?
    var company: Company?
    var email: String?
    var id: Int?
    var name: String?
    var phone: String?
    var username: String?
    var website: String?
    
    required init?(map: Map) {
        mapping(map: map)
    }

    func mapping(map: Map) {
    address <- map["address"]
    company <- map["company"]
    email <- map["email"]
    id <- map["id"]
    name <- map["name"]
    phone <- map["phone"]
    username <- map["username"]
    website <- map["website"]
    }
    
}
