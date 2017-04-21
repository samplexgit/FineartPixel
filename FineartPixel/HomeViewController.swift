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
    @IBOutlet weak var viewSlide: UIView!
    var toggleState = 1
   
    
    var categoryImage: [UIImage] = [
        UIImage(named: "images")!,
        UIImage(named: "images-1")!,
        UIImage(named: "images-2")!,
        UIImage(named: "images-3")!,
        UIImage(named: "images-4")!,
        UIImage(named: "images-5")!,
        UIImage(named: "images-6")!
    ]
    
    var categoryNames: [String] = ["Abstart","Animals","Logos","Badges","Flowers","Abstract","Nature" ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        categoryCollectionView.delegate = self
        categoryCollectionView.dataSource = self
        newCollectionView.delegate = self
        newCollectionView.delegate = self
        
        viewSlide.isHidden = true
        viewSlide.layer.shadowColor = UIColor.black.cgColor
        viewSlide.layer.shadowOpacity = 1
        viewSlide.layer.shadowOffset = CGSize.zero
        viewSlide.layer.shadowRadius = 10
        newCollectionView.collectionViewLayout.invalidateLayout()
        viewSlide.backgroundColor = UIColor(white: 1, alpha: 0.5)
       
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
            
           
            cell.imgCategory.image = categoryImage[indexPath.row]
            cell.lblCategory.text = categoryNames[indexPath.row]
            return cell

        }
        else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellNew", for: indexPath as IndexPath) as! NewCollectionCollectionViewCell
            
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
    
    
    @IBAction func onClickMenu(_ sender: Any) {
        if toggleState == 1 {
          if self.view.frame.origin.x == 0 {
            toggleState = 2
            UIView.animate(withDuration: 0.5, delay: 0.0, options: UIViewAnimationOptions.curveEaseOut, animations: {
                self.view.frame.origin.x += 200
                self.viewSlide.frame = CGRect(x: -200, y: self.viewSlide.frame.origin.y, width: self.viewSlide.frame.size.width, height: self.viewSlide.frame.size.height)
                self.viewSlide.isHidden = false
                self.view.layoutIfNeeded()
            },completion: nil)
            
          }
        }
        else {
           toggleState = 1
            if self.view.frame.origin.x != 0{
                toggleState = 2
                UIView.animate(withDuration: 0.5, delay: 0.0, options: UIViewAnimationOptions.curveEaseOut, animations: {
                    self.view.frame.origin.x -= 200
                    self.viewSlide.frame = CGRect(x: 0, y: self.viewSlide.frame.origin.y, width: self.viewSlide.frame.size.width, height: self.viewSlide.frame.size.height)
                    self.viewSlide.isHidden = true
                    self.view.layoutIfNeeded()
                },completion: nil)
            }
 
        }
    }

    

}

extension UIView {
    class func fromNib<T : UIView>() -> T {
        return Bundle.main.loadNibNamed(String(describing: T.self), owner: nil, options: nil)![0] as! T
    }
}
