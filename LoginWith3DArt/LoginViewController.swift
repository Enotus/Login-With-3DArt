//
//  LoginViewController.swift
//  LoginWith3DArt
//
//  Created by Enotus on 02/05/2018.
//  Copyright © 2018 enotus. All rights reserved.
//

import UIKit
import QuartzCore
import SceneKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    //MARK: - Outlets
    @IBOutlet weak var loginContainer: UIView!
    @IBOutlet weak var loginContainerTop: NSLayoutConstraint!
    @IBOutlet weak var background: UIView!
    @IBOutlet weak var emailTextField: UITextField!
    
    //SceneView Protperties
    @IBOutlet weak var scnView: SCNView!
    var bodyPlayer = SCNAnimationPlayer()
    var handlePlayer = SCNAnimationPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailTextField.becomeFirstResponder()
        setupSceneView()
        
        scnView.alpha = 0.0
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        UIView.animate(withDuration: 0.5, delay: 0.0, options: .curveEaseIn, animations: {
            self.scnView.alpha = 1.0
        }, completion: nil)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.scnView.play(nil)
    }

    func resetLoginPosition() {
        _ = UIViewPropertyAnimator(duration: 0.5, dampingRatio: 0.8) {
            self.loginContainerTop.constant = 48
            self.background.alpha = 0.8
            self.view.layoutIfNeeded()
            }.startAnimation()
    }
    
    func setupSceneView() {
        // create a new scene
        let scene = SCNScene(named: "art.scnassets/lock.scn")!
        
        // set the scene to the view
        scnView.scene = scene
        
        // set up antialiasing
        scnView.antialiasingMode = .multisampling2X
        scnView.isJitteringEnabled = true //the best antialiasing mode for STATIC image
        
        // configure the view
        scnView.backgroundColor = UIColor.clear
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
            if loginPosition > (UIScreen.main.bounds.height * 0.3) || velocity > 1400 {
                emailTextField.resignFirstResponder()
                dismiss(animated: true, completion: nil)
            } else {
                resetLoginPosition()
            }
            
        default:
            break
        }
        
        sender.setTranslation(CGPoint.zero, in: self.view)
    }

}
