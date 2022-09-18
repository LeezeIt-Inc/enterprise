//
//  SecondViewController.swift
//  LeezeIt
//
//  Created by Riffat Khan on 9/17/22.
//

import UIKit

class SecondTutorialViewController: UIViewController {
    @IBOutlet weak var nextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNextButton()
        
    }
    
    @IBAction func nxtButton(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "Storyboard", bundle: nil)
        let nextvc = storyBoard.instantiateViewController(withIdentifier: "ViewController") as! signInSignUpViewController
        present(nextvc, animated: true)
        
    }
    
    func configureNextButton() {
        nextButton.layer.cornerRadius = 10
        nextButton.backgroundColor = .systemMint
    }
}
