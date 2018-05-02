//
//  MainViewController.swift
//  LoginWith3DArt
//
//  Created by Enotus on 02/05/2018.
//  Copyright © 2018 enotus. All rights reserved.
//

import UIKit
import QuartzCore
import SceneKit

class MainViewController: UIViewController {
    
    let presentLoginTransition = PresentLogin()
    @IBOutlet weak var scnView: SCNView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // create a new scene
        let scene = SCNScene(named: "art.scnassets/carrot.scn")!
    
        // set the scene to the view
        scnView.scene = scene
        
        // set up antialiasing
        scnView.antialiasingMode = .multisampling2X
        scnView.isJitteringEnabled = true //the best antialiasing mode for STATIC image
        
        // configure the view
        scnView.backgroundColor = UIColor.clear
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let toViewController = segue.destination as? LoginViewController {
            toViewController.transitioningDelegate = self.presentLoginTransition
        }
    }

}
