//
//  OrangeButton.swift
//  LoginWith3DArt
//
//  Created by Enotus on 02/05/2018.
//  Copyright © 2018 enotus. All rights reserved.
//

import UIKit

@IBDesignable
class OrangeButton: UIButton {

    private let scaleFactor:CGFloat = 0.997
    
    override var isHighlighted: Bool {
        didSet {
            UIView.animate(withDuration: 0.3, delay: 0, options: .curveLinear, animations: {
                //                self.backgroundColor = self.isHighlighted ? UIColor.price : UIColor.accent
                self.titleLabel?.alpha = self.isHighlighted ? 0.85 : 1.0
                self.layer.shadowOpacity = self.isHighlighted ? 0.0 : 1.0
                self.transform = self.isHighlighted ? CGAffineTransform(scaleX: self.scaleFactor, y: self.scaleFactor) : CGAffineTransform.identity
                
            }, completion: nil)
        }
    }
    
    private func setupStyle() {
        backgroundColor = UIColor(red: 1.0, green: 125.0 / 255.0, blue: 3.0 / 255.0, alpha: 1.0)
        layer.cornerRadius = 12
        layer.shadowColor = UIColor(red: 98.0 / 255.0, green: 112.0 / 255.0, blue: 139.0 / 255.0, alpha: 0.2).cgColor
        layer.shadowOpacity = 1.0
        layer.shadowOffset = CGSize(width: 0, height: 4)
        layer.shadowRadius = 8.0
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupStyle()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupStyle()
    }

}
