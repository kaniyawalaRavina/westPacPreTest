//
//  Geo.swift
//  PreTestTask
//
//  Created by Riya Kaniyawala on 30/05/21.
//

import Foundation
import ObjectMapper

class Geo: Mappable {
    
    var lat: String?
    var lng: String?
    
    required init?(map: Map) {
        mapping(map: map)
    }

    func mapping(map: Map) {
    lat <- map["lat"]
    lng <- map["lng"]
    }
    
}
