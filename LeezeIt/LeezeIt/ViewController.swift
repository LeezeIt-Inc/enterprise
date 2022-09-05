//
//  ViewController.swift
//  LeezeIt
//
//  Created by Riffat Khan on 8/24/22.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func goToPhoneScreen(_ sender: Any) {
       let storyboard = UIStoryboard(name: "PhoneNumberViewController", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier:  "PhoneNumberViewController") as! PhoneNumberViewController
     present(vc, animated: true)
    }
 
}
