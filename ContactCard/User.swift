//
//  User.swift
//  ContactCard
//
//  Created by Jop on 08/10/2018.
//  Copyright © 2018 Justin van den Boomen. All rights reserved.
//

import Foundation


class User{
    var title: String?
    var first: String?
    var last: String?
    var imageUrl: String?
    var username: String?
    var gender: String?
    var email: String?
    var age: Int?
    
    
    required init(title: String, first: String, last: String,
                  imageUrl: String, username: String, gender: String, email: String, age: Int){
        self.title = title
        self.first = first
        self.last = last
        self.imageUrl = imageUrl
        self.username = username
        self.gender = gender
        self.email = email
        self.age = age
    }
}
