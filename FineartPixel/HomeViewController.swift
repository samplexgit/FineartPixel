//
//  HomeViewController.swift
//  FineartPixel
//
//  Created by Shilp_m on 4/19/17.
//  Copyright © 2017 DryRun. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController,UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    
    @IBOutlet weak  var newCollectionView: UICollectionView!

   
    
    var categoryImage: [UIImage] = [
        UIImage(named: "images")!,
        UIImage(named: "images-1")!,
        UIImage(named: "images-2")!,
        UIImage(named: "images-3")!,
        UIImage(named: "images-4")!,
        UIImage(named: "images-5")!,
        UIImage(named: "images-6")!
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        categoryCollectionView.delegate = self
        categoryCollectionView.dataSource = self
        newCollectionView.delegate = self
        newCollectionView.delegate = self
        
        newCollectionView.collectionViewLayout.invalidateLayout()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if(collectionView == categoryCollectionView){
           return categoryImage.count
        }
        else
        {
           return categoryImage.count
        }
        
    }
    
    // make a cell for each cell index path
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if(collectionView == categoryCollectionView)
        {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellCat", for: indexPath as IndexPath) as! CategoryCollectionViewCell
            
            // Use the outlet in our custom class to get a reference to the UILabel in the cell
            //cell.myLabel.text = self.items[indexPath.item]
            //cell.backgroundColor = UIColor.cyan // make cell more visible in our example project
            cell.imgCategory.image = categoryImage[indexPath.row]
            
            return cell

        }
        else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellNew", for: indexPath as IndexPath) as! NewCollectionCollectionViewCell
            
            // Use the outlet in our custom class to get a reference to the UILabel in the cell
            //cell.myLabel.text = self.items[indexPath.item]
            //cell.backgroundColor = UIColor.cyan // make cell more visible in our example project
            cell.imgNew.image = categoryImage[indexPath.row]
            return cell

        }
        
        
    }
    
    // MARK: - UICollectionViewDelegate protocol
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // handle tap events
        print("You selected cell #\(indexPath.item)!")
        
        if(collectionView == categoryCollectionView)
        {
                      
            let next = self.storyboard?.instantiateViewController(withIdentifier: "CategoryViewController") as! CategoryViewController
            self.present(next, animated: true, completion: nil)
      
        }
        else {
            
         let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
         let categoryViewController = storyBoard.instantiateViewController(withIdentifier: "CategoryViewController") as! CategoryViewController
         self.present(categoryViewController, animated:true, completion:nil)
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onClickViewAll(_ sender: Any) {
        
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
