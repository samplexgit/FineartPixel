//
//  CategoryViewController.swift
//  FineartPixel
//
//  Created by Shilp_m on 4/19/17.
//  Copyright © 2017 DryRun. All rights reserved.
//

import UIKit

class CategoryViewController: UIViewController,UICollectionViewDataSource, UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
    @IBOutlet weak var catCollectionView: UICollectionView!
    var heightInPixels:CGFloat?
    var widthInPixels:CGFloat?
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

//        // Do any additional setup after loading the view.
//        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
//        let width = UIScreen.main.bounds.width
//        layout.sectionInset = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
//        layout.itemSize = CGSize(width: width / 2, height: width / 2)
//        layout.minimumInteritemSpacing = 0
//        layout.minimumLineSpacing = 0
//        catCollectionView!.collectionViewLayout = layout
        
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
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let heightInPoints = categoryImage[indexPath.row].size.height
//        heightInPixels = heightInPoints * categoryImage[indexPath.row].scale
//        
//        let widthInPoints = categoryImage[indexPath.row].size.width
//        widthInPixels = widthInPoints * categoryImage[indexPath.row].scale
//        if widthInPixels != nil {
//          return CGSize(width:150, height:heightInPixels!) //(width,hight)
//        }
//        else {
//            return CGSize(width:100,height:100)
//        }
//    }
    
    
    
    @IBAction func onClickBack(_ sender: Any) {
        let back = self.storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        self.present(back, animated: true, completion: nil)
    }

    

}
