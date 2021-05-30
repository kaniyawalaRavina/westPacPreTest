//
//  Post.swift
//  PreTestTask
//
//  Created by Riya Kaniyawala on 30/05/21.
//

import Foundation
import ObjectMapper

class Post: Mappable {
    
    var body: String?
    var id: Int?
    var title: String?
    var userId: Int?
    
    required init?(map: Map) {
        mapping(map: map)
    }
    
    func mapping(map: Map) {
    body <- map["body"]
    id <- map["id"]
    title <- map["title"]
    userId <- map["userId"]
    }
    
}
