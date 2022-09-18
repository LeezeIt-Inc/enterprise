//
//  ViewController.swift
//  LeezeIt
//
//  Created by Riffat Khan on 8/24/22.
//

import UIKit



class LogInSignUpViewController: UIViewController {
    
    let parentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        stackView.spacing = 190
        return stackView
    }()
    
    let leezeitImageStackView:  UIStackView = {
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
    
    var leezeitImage: UIImageView = {
        let leezeitImage =  UIImageView(image: .init(named: "LeezeitImage"))
        leezeitImage.contentMode = .scaleToFill
        leezeitImage.clipsToBounds = true
        return leezeitImage
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addViewsInView()
    } 

    @objc func logIn(_ sender: UIButton) {
        let storyBoard = UIStoryboard(name:StoryBoardsID.PhoneNumberStoryBoard.rawValue, bundle: nil)
        let nextvc = storyBoard.instantiateViewController(withIdentifier: StoryBoardsID.PhoneNumberStoryBoard.rawValue) as! PhoneNumberViewController
       present(nextvc, animated: true)
    }
    
    @objc func signUp(_ sender: UIButton) {
        let storyBoard = UIStoryboard(name:StoryBoardsID.SignUpStoryBoard.rawValue, bundle: nil)
        let nextvc = storyBoard.instantiateViewController(withIdentifier: StoryBoardsID.SignUpStoryBoard.rawValue) as? SignUpViewController
       present(nextvc!, animated: true)
    }
}

extension LogInSignUpViewController {
 
    func parentStackViewConstraint() {
        parentStackView.translatesAutoresizingMaskIntoConstraints = false
        parentStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 170).isActive = true
        parentStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0).isActive = true
        parentStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0).isActive = true
        parentStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10).isActive = true
        //      adding views In StackView.
        addViewsInParentStackView()
    }
    
    func imageStackViewConstraint() {
        leezeitImageStackView.translatesAutoresizingMaskIntoConstraints = false
        leezeitImageStackView.centerXAnchor.constraint(equalTo: parentStackView.centerXAnchor).isActive = true
        leezeitImageStackView.topAnchor.constraint(equalTo: parentStackView.bottomAnchor, constant: -10).isActive = true
        leezeitImageStackView.addArrangedSubview(leezeitImage)
        leezeitImage.translatesAutoresizingMaskIntoConstraints = false
        leezeitImage.heightAnchor.constraint(equalTo: parentStackView.widthAnchor, multiplier: 0.4).isActive = true
    }
    
    func buttonStackViewConstraint() {
        buttonStackView.translatesAutoresizingMaskIntoConstraints = false
        buttonStackView.leadingAnchor.constraint(equalTo: parentStackView.leadingAnchor, constant: 35).isActive = true
        buttonStackView.trailingAnchor.constraint(equalTo: parentStackView.trailingAnchor, constant: -35).isActive = true
        buttonStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,constant: -130).isActive = true
        addButtonsToStackView()
    }
   
    func addViewsInParentStackView() {
        parentStackView.addArrangedSubview(leezeitImageStackView)
        imageStackViewConstraint()
        parentStackView.addArrangedSubview(buttonStackView)
        buttonStackViewConstraint()
    }
    
    func addViewsInView() {
        view.addSubview(parentStackView)
        parentStackViewConstraint()
    }
    
    func addButtonsToStackView() {
        let numOfButtons = 2
        
        for i in 1...numOfButtons {
            
            let button = CreateButton()
            
            if i == 1 {
                button.setTitle("Log In", for: .normal)
                button.addTarget(self, action: #selector(logIn(_:)), for: .touchUpInside)
                buttonStackView.addArrangedSubview(button)
            } else {
                button.setTitle("Sign Up", for: .normal)
                button.addTarget(self, action: #selector(signUp(_:)), for: .touchUpInside)
                buttonStackView.addArrangedSubview(button)
            }
        }
    }
}
