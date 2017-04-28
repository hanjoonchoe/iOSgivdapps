//
//  SignUpViewController.swift
//  GiveDapps-new
//
//  Created by Hanjoon Choe on 4/11/17.
//  Copyright © 2017 Hanjoon Choe. All rights reserved.
//

import UIKit
import LBTAComponents

class SignUpViewController: UIViewController {
    
    let logoImageView: UIImageView = {
        let image = UIImage(named: "logo")
        let imageView = UIImageView(image: image)
        return imageView
    }()
    
    let literallogoImageView: UIImageView = {
        let image = UIImage(named: "literal-logo")
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let mainImageView: UIImageView = {
        let image = UIImage(named: "backgroundimg")
        let imageView = UIImageView(image: image)
        return imageView
    }()

    
    
    let SignUpButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor(red: 251/255, green: 173/255, blue: 61/255, alpha: 1)
        button.setTitle("Sign Up", for: .normal)
        button.setTitleColor(.white, for: .normal)
        
        return button
    }()
    
    let FacebookButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor(red: 59/255, green: 89/255, blue: 152/255, alpha: 1)
        button.setTitleColor(.white, for: .normal)
        button.setTitle("Sign Up with Facebook", for: .normal)
        
        return button
    }()
    
    let SkipButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Skip", for: .normal)
        button.setTitleColor(UIColor(red: 251/255, green: 173/255, blue: 61/255, alpha: 1), for: .normal)
        
        return button
    }()
    
    let Skiplabel: UILabel = {
        let label = UILabel()
        label.text = "Already Have an Account - "
        label.textColor = .white
        label.textAlignment = .center
        label.numberOfLines = 1
        label.font = UIFont(name: label.font.fontName, size: 14)
        return label
    }()
    
    func  observeKeyboardNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardShow), name: .UIKeyboardWillShow, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardHide), name: .UIKeyboardWillHide, object: nil)
    }
    
    func keyboardHide() {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            
            self.view.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
            
        }, completion: nil)
        
    }
    func keyboardShow() {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            
            self.view.frame = CGRect(x: 0, y: -130, width: self.view.frame.width, height: self.view.frame.height)
            
        }, completion: nil)
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        observeKeyboardNotifications()
        
        view.addSubview(mainImageView)
        view.addSubview(logoImageView)
        view.addSubview(literallogoImageView)
        view.addSubview(SignUpButton)
        view.addSubview(FacebookButton)
        view.addSubview(SkipButton)
        view.addSubview(Skiplabel)
        
        mainImageView.anchor(view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
        logoImageView.anchor(view.centerYAnchor, left: nil, bottom: nil, right: nil, topConstant: -250, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 150, heightConstant: 150)
        logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        literallogoImageView.anchor(logoImageView.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 8, leftConstant: 40, bottomConstant: 0, rightConstant: 40, widthConstant: 200, heightConstant: 50)
        
        SignUpButton.anchor(literallogoImageView.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 100, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 50)
        FacebookButton.anchor(SignUpButton.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 8, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 50)
        SkipButton.anchor(FacebookButton.bottomAnchor, left: view.leftAnchor, bottom: nil, right: Skiplabel.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 10, heightConstant: 0)
        Skiplabel.anchor(FacebookButton.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 10, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
    }
}
