//
//  Address.swift
//  PreTestTask
//
//  Created by Riya Kaniyawala on 30/05/21.
//

import Foundation
import ObjectMapper

class Address: Mappable {
    
    var city: String?
    var geo: Geo?
    var street: String?
    var suite: String?
    var zipcode: String?
    
    required init?(map: Map) {
        mapping(map: map)
    }

    func mapping(map: Map) {
    city <- map["city"]
    geo <- map["geo"]
    street <- map["street"]
    suite <- map["suite"]
    zipcode <- map["zipcode"]
    }
    
}
