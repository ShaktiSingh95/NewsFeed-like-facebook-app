//
//  User.swift
//  DeeveHealth
//
//  Created by Shakti Pratap Singh on 05/07/17.
//  Copyright © 2017 Shakti Pratap Singh. All rights reserved.
//

import Foundation
class User: Hashable{
    var name:String!
    var userId:String!
    var profileImageLink:String!
    init(name:String,profileImageLink:String) {
        self.name=name
        self.profileImageLink=profileImageLink
        self.userId="12CC"
    }
    var hashValue: Int {
        return name.hashValue ^ userId.hashValue &* 16777619
    }
    static func == (lhs: User, rhs: User) -> Bool {
        return lhs.name == rhs.name && lhs.userId == rhs.userId
    }}
