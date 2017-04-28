//
//  ResetViewController.swift
//  GiveDapps-new
//
//  Created by Hanjoon Choe on 4/9/17.
//  Copyright © 2017 Hanjoon Choe. All rights reserved.
//

import UIKit
import LBTAComponents

class ResetViewController: UIViewController {
    
    
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

    
    let ResetLabel: UILabel = {
        
        let tb = UILabel()
        tb.text = "Reset Password"
        tb.textColor = .white
        tb.textAlignment = .center
        tb.font = UIFont(name: tb.font.fontName, size: 500)
        tb.font = UIFont.boldSystemFont(ofSize: 30.0)
        return tb
    }()
    
    let RestInstructionLabel: UILabel = {
        
        let tb = UILabel()
        tb.text = "You will recieve an email with a link to reset your password. Follow the steps to complete the password reset."
        tb.textColor = .white
        tb.textAlignment = .center
        tb.font = UIFont(name: tb.font.fontName, size: 14)
        tb.numberOfLines = 3
        //tb.font = UIFont.boldSystemFont(ofSize: .0)
        return tb
    }()
    
    let emailTextField: leftPaddedTextField = {
        let textField = leftPaddedTextField()
        textField.placeholder = "Enter email"
        textField.backgroundColor = UIColor(white: 1, alpha: 1)
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.borderWidth = 1
        textField.keyboardType = .emailAddress
        textField.textColor = UIColor(white: 0.3, alpha: 1)
        return textField
    }()
    
    let ResetPassWordButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor(red: 251/255, green: 173/255, blue: 61/255, alpha: 1)
        button.setTitle("Log in", for: .normal)
        button.setTitleColor(.white, for: .normal)
        return button
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
        view.addSubview(ResetLabel)
        view.addSubview(emailTextField)
        view.addSubview(ResetPassWordButton)
        view.addSubview(RestInstructionLabel)
        
        
        mainImageView.anchor(view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
        logoImageView.anchor(view.centerYAnchor, left: nil, bottom: nil, right: nil, topConstant: -250, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 150, heightConstant: 150)
        logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        literallogoImageView.anchor(logoImageView.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 8, leftConstant: 40, bottomConstant: 0, rightConstant: 40, widthConstant: 200, heightConstant: 50)
        ResetLabel.anchor(literallogoImageView.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 100, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        emailTextField.anchor(ResetLabel.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 8, leftConstant: 32, bottomConstant: 0, rightConstant: 32, widthConstant: 0, heightConstant: 40)
        ResetPassWordButton.anchor(emailTextField.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 8, leftConstant: 32, bottomConstant: 0, rightConstant: 32, widthConstant: 0, heightConstant: 40)
        RestInstructionLabel.anchor(ResetPassWordButton.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 8, leftConstant: 32, bottomConstant: 0, rightConstant: 32, widthConstant: 0, heightConstant: 70)
        
    }
    
    class leftPaddedTextField: UITextField {
        
        override func textRect(forBounds bounds: CGRect) -> CGRect {
            return CGRect(x: bounds.origin.x + 10, y: bounds.origin.y, width: bounds.width + 10, height: bounds.height)
        }
    }
}



