//
//  LoginViewController.swift
//  LoginWith3DArt
//
//  Created by Enotus on 02/05/2018.
//  Copyright © 2018 enotus. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    
    //MARK: - Outlets
    @IBOutlet weak var loginContainer: UIView!
    @IBOutlet weak var loginContainerTop: NSLayoutConstraint!
    @IBOutlet weak var background: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func resetLoginPosition() {
        _ = UIViewPropertyAnimator(duration: 0.5, dampingRatio: 0.8) {
            self.loginContainerTop.constant = 48
            self.background.alpha = 0.8
            self.view.layoutIfNeeded()
            }.startAnimation()
    }
    
    @IBAction func dragginLogin(_ sender: UIPanGestureRecognizer) {
        
        sender.maximumNumberOfTouches = 1
        let loginPosition = loginContainerTop.constant
        let velocity = sender.velocity(in: self.view).y
        let backgroundAlpha = ((UIScreen.main.bounds.height - loginPosition) / (UIScreen.main.bounds.height - 48)) - 0.2
        
        switch sender.state {
        case .changed:
            let factor = loginPosition < 48 ? loginPosition / 48 : 1
            let senderPositionY = sender.translation(in: self.view).y
            
            UIView.animate(withDuration: 0.02) {
                self.loginContainerTop.constant += senderPositionY * factor
                self.background.alpha = backgroundAlpha
            }
            
        case .ended:
            loginPosition > (UIScreen.main.bounds.height * 0.3) || velocity > 1400
                ? dismiss(animated: true, completion: nil)
                : resetLoginPosition()
            
        default:
            break
        }
        
        sender.setTranslation(CGPoint.zero, in: self.view)
    }

}
