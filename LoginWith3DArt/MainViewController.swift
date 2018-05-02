//
//  MainViewController.swift
//  LoginWith3DArt
//
//  Created by Enotus on 02/05/2018.
//  Copyright © 2018 enotus. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    let presentLoginTransition = PresentLogin()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
