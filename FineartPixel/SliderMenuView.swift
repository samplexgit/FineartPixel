//
//  SliderMenuView.swift
//  FineartPixel
//
//  Created by Shilp_m on 4/21/17.
//  Copyright © 2017 DryRun. All rights reserved.
//

import UIKit

class SliderMenuView: UIView {

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        if self.subviews.count == 0 {
            setUpView()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }
    
    /**
     Setup View
     
     */
    func setUpView(){
        if let view = (UINib(nibName: String(describing: SliderMenuView.self), bundle: nil)).instantiate(withOwner: self, options: nil).first as? SliderMenuView {
            view.frame = bounds
            view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            addSubview(view)
        }
        
    }

}
