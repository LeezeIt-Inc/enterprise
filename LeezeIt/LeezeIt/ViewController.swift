//
//  ViewController.swift
//  LeezeIt
//
//  Created by Riffat Khan on 8/24/22.
//

import UIKit

class ViewController: UIViewController {

    
    
    @IBAction func nextS(_ sender: Any) {
       // let vc = storyboard?.instantiateViewController(withIdentifier: "VerificationViewController") as VerificationViewController
        let storyBoard = UIStoryboard(name: "VerificationViewController", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "VerificationViewController") as! VerificationViewController
        present(vc, animated: true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

