//
//  Post.swift
//  DeeveHealth
//
//  Created by Shakti Pratap Singh on 05/07/17.
//  Copyright © 2017 Shakti Pratap Singh. All rights reserved.
//

import Foundation
class Post{
    var message:String!
    var time:String!
    var comments:[String:User]!
    var likes:[User]!
    var owner:User!
    init(message:String,time:String,owner:User) {
        self.message=message
        self.owner=owner
        self.time=time
        self.comments=[:]
        self.likes=[]
    }
}
