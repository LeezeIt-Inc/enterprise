//
//  SecondViewController.swift
//  LeezeIt
//
//  Created by Riffat Khan on 9/17/22.
//

import UIKit

class SecondViewController: UIViewController {
    @IBOutlet weak var nextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nextButton.layer.cornerRadius = 10
        nextButton.backgroundColor = .systemMint
       
    }
    
    @IBAction func nxtButton(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "Storyboard", bundle: nil)
        
 let nextvc = storyBoard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
       present(nextvc, animated: true)
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
