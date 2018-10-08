//
//  UserManagerDelegate.swift
//  ContactCard
//
//  Created by Jop on 08/10/2018.
//  Copyright © 2018 Justin van den Boomen. All rights reserved.
//

import Foundation

protocol UserManagerDelegate{
    func didReceiveNewUser(user : User)
}
