//
//  Company.swift
//  PreTestTask
//
//  Created by Riya Kaniyawala on 30/05/21.
//

import Foundation
import ObjectMapper

class Company: Mappable {
    
    var bs: String?
    var catchPhrase: String?
    var name: String?
    
    required init?(map: Map) {
        mapping(map: map)
    }

    func mapping(map: Map) {
    bs <- map["bs"]
    catchPhrase <- map["catchPhrase"]
    name <- map["name"]
    }
    
}
