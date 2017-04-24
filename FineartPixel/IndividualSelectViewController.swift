//
//  IndividualSelectViewController.swift
//  FineartPixel
//
//  Created by Shilp_m on 4/19/17.
//  Copyright © 2017 DryRun. All rights reserved.
//

import UIKit

class IndividualSelectViewController: UIViewController {

    @IBOutlet weak var imgView: UIImageView!
    var imageItem = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
       imgView.image = imageItem

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onClickBack(_ sender: Any) {
        let back = self.storyboard?.instantiateViewController(withIdentifier: "CategoryViewController") as! CategoryViewController
        self.present(back, animated: true, completion: nil)
    }
    
    
    @IBAction func onClickDownload(_ sender: Any) {
        let defaults = UserDefaults.standard
        let myString = defaults.value(forKey: "savedString") as? String
        if myString != "" && myString != nil {
            print(myString)
        }
        else {
         let back = self.storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
         self.present(back, animated: true, completion: nil)
        }

    }

}
