//
//  PopUpView.swift
//  Unsplash
//
//  Created by Wildan - Kurio on 9/7/15.
//  Copyright © 2015 Kellinreaver. All rights reserved.
//

import UIKit

protocol PopUpViewDelegate {
    func closePopUpView(finish:Bool)
}

class PopUpView:UIView {
    var delegate:PopUpViewDelegate?
    var view: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        xibSetup()
    }
    
    func xibSetup() {
        view = loadViewFromNib()
        view.frame = bounds
        addSubview(view)
    }
    
    func loadViewFromNib() -> UIView {
        
        let bundle = NSBundle(forClass: self.dynamicType)
        let nib = UINib(nibName: "PopUpView", bundle: bundle)
        let view = nib.instantiateWithOwner(self, options: nil)[0] as! UIView
        
        return view
    }
    
    @IBAction func closeDidTap(sender: AnyObject) {
        delegate?.closePopUpView(true)
    }
    
}
