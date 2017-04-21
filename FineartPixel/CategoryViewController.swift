//
//  CategoryViewController.swift
//  FineartPixel
//
//  Created by Shilp_m on 4/19/17.
//  Copyright © 2017 DryRun. All rights reserved.
//

import UIKit

class CategoryViewController: UIViewController,UICollectionViewDataSource, UICollectionViewDelegate {
    @IBOutlet weak var catCollectionView: UICollectionView!
    var categoryImage: [UIImage] = [
        UIImage(named: "images")!,
        
        UIImage(named: "images-1")!,
        UIImage(named: "images-2")!,
        UIImage(named: "images-3")!,
        UIImage(named: "images-4")!,
        UIImage(named: "images-5")!,
        UIImage(named: "images-6")!,
        UIImage(named: "images")!,
        UIImage(named: "images-1")!,
        UIImage(named: "images-2")!,
        UIImage(named: "images-3")!,
        UIImage(named: "images-4")!,
        UIImage(named: "images-5")!,
        UIImage(named: "images-6")!,
        UIImage(named: "images")!,
        UIImage(named: "images-1")!,
        UIImage(named: "images-2")!,
        UIImage(named: "images-3")!,
        UIImage(named: "images-4")!,
        UIImage(named: "images-5")!,
        UIImage(named: "images-6")!
    ]
    var rows = Int()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categoryImage.count
    
    }
    
    // make a cell for each cell index path
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
       
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "viewCell", for: indexPath as IndexPath) as! ViewCollectionViewCell
        
            cell.imgView.image = categoryImage[indexPath.row]
        
            return cell
            
   }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // handle tap events
        print("You selected cell #\(indexPath.item)!")
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let individualSelectViewController = storyBoard.instantiateViewController(withIdentifier: "IndividualSelectViewController") as! IndividualSelectViewController
        individualSelectViewController.imageItem = categoryImage[indexPath.row]
        self.present(individualSelectViewController, animated:true, completion:nil)
        
    }
    
    
    
    @IBAction func onClickBack(_ sender: Any) {
        let back = self.storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        self.present(back, animated: true, completion: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
