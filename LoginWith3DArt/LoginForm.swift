//
//  LoginForm.swift
//  LoginWith3DArt
//
//  Created by Enotus on 02/05/2018.
//  Copyright © 2018 enotus. All rights reserved.
//

import UIKit

@IBDesignable
class LoginForm: UIView {
    
    private func setupStyle() {
//        backgroundColor = UIColor(red: 1.0, green: 125.0 / 255.0, blue: 3.0 / 255.0, alpha: 1.0)
        layer.cornerRadius = 12
        layer.borderWidth = 0.5
//        layer.borderColor = UIColor.lightGray.cgColor
        layer.borderColor = UIColor(white: 0.8, alpha: 1).cgColor
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
