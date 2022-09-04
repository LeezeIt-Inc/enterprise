//
//  ViewController.swift
//  LeezeIt
//
//  Created by Riffat Khan on 8/24/22.
//

import UIKit



class ViewController: UIViewController {
    
    let parentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        stackView.spacing = 190
        return stackView
    }()
    
    let logoImageStackView:  UIStackView = {
        let stackView = UIStackView()
        return stackView
        
    }()
    
    let buttonStackView:  UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        stackView.spacing = 30
        return stackView
    }()
    
    var logoImage: UIImageView = {
        let lztImage =  UIImageView(image: .init(named: "L"))
        lztImage.contentMode                               = .scaleToFill
        lztImage.clipsToBounds                             = true
        return lztImage
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(parentStackView)
        parentStackViewConst()
        
    } 
    


    
    @objc  func logIn(_ sender: UIButton) {
        print("LogIn Button Tapped")
        
    }
    
    @objc  func signUP(_ sender: UIButton) {
        print("signUp Button Tapped")
        
    }
}


extension ViewController {
 
    func parentStackViewConst() {
        
        parentStackView.translatesAutoresizingMaskIntoConstraints                                                           = false
        parentStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 170).isActive           = true
        parentStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0).isActive     = true
        parentStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0).isActive   = true
        parentStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10).isActive     = true
        //      adding views In StackView.
        addViewsInParentStackView()
        
    }
    
    func imageStackViewConst() {
        logoImageStackView.translatesAutoresizingMaskIntoConstraints                                               = false
        logoImageStackView.centerXAnchor.constraint(equalTo: parentStackView.centerXAnchor).isActive               = true
        logoImageStackView.topAnchor.constraint(equalTo: parentStackView.bottomAnchor, constant: -10).isActive     = true
        logoImageStackView.addArrangedSubview(logoImage)
        
        logoImage.translatesAutoresizingMaskIntoConstraints                                               = false
        logoImage.heightAnchor.constraint(equalTo: parentStackView.widthAnchor, multiplier: 0.4).isActive = true
    }
    
    func buttonStackViewConst() {
        buttonStackView.translatesAutoresizingMaskIntoConstraints                                                          = false
        buttonStackView.leadingAnchor.constraint(equalTo: parentStackView.leadingAnchor, constant: 35).isActive            = true
        buttonStackView.trailingAnchor.constraint(equalTo: parentStackView.trailingAnchor, constant: -35).isActive         = true
        buttonStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,constant: -130).isActive    = true

        addButtonsToStackView()
    }
   
    func addViewsInParentStackView() {
        parentStackView.addArrangedSubview(logoImageStackView)
        imageStackViewConst()
        parentStackView.addArrangedSubview(buttonStackView)
        buttonStackViewConst()
    }
    
    func addButtonsToStackView() {
        let numOfButtons = 2
        
        for i in 1...numOfButtons {
            
            let button = SurveyButton()
            
            if i == 1 {
                button.setTitle("Log In", for: .normal)
                button.addTarget(self, action: #selector(logIn(_:)), for: .touchUpInside)
                buttonStackView.addArrangedSubview(button)
            } else {
                button.setTitle("Sign Up", for: .normal)
                button.addTarget(self, action: #selector(signUP(_:)), for: .touchUpInside)
                buttonStackView.addArrangedSubview(button)
            }
        }
    }
}













