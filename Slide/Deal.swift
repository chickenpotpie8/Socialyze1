//
//  Deal.swift
//  Slide
//
//  Created by Bibek on 7/8/17.
//  Copyright © 2017 Salem Khan. All rights reserved.
//

import Foundation
import ObjectMapper

class Deal: Mappable{
    var detail:String?
    var expiry:String?
    var mimimumFriends: Int?
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        detail <- map["dealDetail"]
        expiry <- map["expiryDate"]
        mimimumFriends <- map["mimimumFriends"]
    }
}

class PlaceDeal: Mappable {
    var count:Int?
    var users:[String:Any]?
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        count <- map["useCount"]
        users <- map["users"]
    }
}
