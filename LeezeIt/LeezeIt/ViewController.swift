//
//  ViewController.swift
//  LeezeIt
//
//  Created by Riffat Khan on 8/24/22.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func gotoNextScreen() {
        
        let storyboard = UIStoryboard.init(name: "CreateAccount", bundle: nil)
        let nextVc = storyboard.instantiateViewController(withIdentifier: "CreateAccountViewController") as! CreateAccountViewController
        present(nextVc, animated: true)
    }
}

