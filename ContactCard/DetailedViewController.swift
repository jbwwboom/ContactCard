//
//  DetailedViewController.swift
//  ContactCard
//
//  Created by Jop on 08/10/2018.
//  Copyright © 2018 Justin van den Boomen. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class DetailedViewController: UIViewController {
    
    var user : User?
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //FILL TEXTS
        
        if let user = user{
            self.nameLabel.text = "\(user.title!) \(user.first!) \(user.last!)"
            self.ageLabel.text = "\(user.gender!) \(user.age!)"
            self.emailLabel.text = user.email!
            
            let url = user.imageUrl
            
            Alamofire.request(url!).responseImage{
                response in
                self.imageView.image = response.result.value
            }
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
