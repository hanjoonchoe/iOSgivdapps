//
//  LaunchScreenViewController.swift
//  GiveDapps-new
//
//  Created by Hanjoon Choe on 4/11/17.
//  Copyright © 2017 Hanjoon Choe. All rights reserved.
//

import UIKit

class LaunchScreenViewController: UIViewController {
    
    let mainImageView: UIImageView = {
        let image = UIImage(named: "backgroundimg")
        let imageView = UIImageView(image: image)
        return imageView
    }()
    
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

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(mainImageView)
        view.addSubview(logoImageView)
        view.addSubview(literallogoImageView)
        
       mainImageView.anchor(view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
        logoImageView.anchor(view.centerYAnchor, left: nil, bottom: nil, right: nil, topConstant: -200, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 200, heightConstant: 200)
        logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        literallogoImageView.anchor(logoImageView.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 10, leftConstant: 40, bottomConstant: 0, rightConstant: 40, widthConstant: 200, heightConstant: 50)
    }
}
