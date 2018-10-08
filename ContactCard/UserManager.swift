//
//  UserManager.swift
//  ContactCard
//
//  Created by Jop on 08/10/2018.
//  Copyright © 2018 Justin van den Boomen. All rights reserved.
//

import Foundation
import Alamofire

class UserManager{
    
    let url = "https://randomuser.me/api?results=100"
    
    var delegate : UserManagerDelegate?
    
    let headers : [String:String] = [:]
    let params : [String:String] = [:]
    
    func getUsers(){
        Alamofire.request(url, method: .get, parameters: params, headers: headers).responseJSON{
            response in
            switch response.result {
            case .success:
                var json = response.result.value as! [String:Any]
                let array = json["results"] as! [Any]
                
                for i in 0..<array.count {
                    let object = array[i] as! [String:Any]
                    
                    let name = object["name"] as! [String:Any]
                    let title = name["title"] as! String
                    let first = name["first"] as! String
                    let last = name["last"] as! String
                    
                    let picture = object["picture"] as! [String:Any]
                    let imageUrl = picture["large"] as! String
                    
                    let login = object["login"] as! [String:Any]
                    let username = login["username"] as! String
                    
                    let gender = object["gender"] as! String
                    let email = object["email"] as! String
                    
                    let dob = object["dob"] as! [String:Any]
                    let age = dob["age"] as! Int
                    let user = User(title: title, first: first, last: last, imageUrl: imageUrl, username: username, gender: gender, email: email, age: age)
                    self.delegate?.didReceiveNewUser(user: user)
                }
                print("no error")
            case .failure(let error):
                print(error)
            }
        }
    }
    
}
