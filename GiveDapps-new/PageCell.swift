//
//  PageCell.swift
//  GiveDapps-new
//
//  Created by Hanjoon Choe on 4/8/17.
//  Copyright © 2017 Hanjoon Choe. All rights reserved.
//

import UIKit
import LBTAComponents

class PageCell: UICollectionViewCell {
    
    
    var page: Page? {
        
        didSet {
            
            guard let page = page else {
                
                return
            }
            
            imageView.image = UIImage(named: page.imageName)
            
            let color2 = UIColor(white: 0.3, alpha: 1)
            let color1 = UIColor(red: 251/255, green: 173/255, blue: 61/255, alpha: 1)
            
            let attributedText = NSMutableAttributedString(string: page.title, attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 15, weight: UIFontWeightMedium),NSForegroundColorAttributeName: color1])
            
            
            
            attributedText.append(NSAttributedString(string: "\n\n\(page.message)", attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 10),NSForegroundColorAttributeName:color2]))
            
            
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.alignment = .center
            
            let length = attributedText.string.characters.count
            
            attributedText.addAttribute(NSParagraphStyleAttributeName, value: paragraphStyle, range: NSRange(location: 0, length: length))
            
            textView.attributedText = attributedText
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        
    }
    
    lazy var textView: UITextView = {
        
        let tv = UITextView()
        tv.text = "Sample"
        tv.isEditable = false
        tv.contentInset = UIEdgeInsets(top: 24, left: 0, bottom: 0, right: 0)
        return tv
    }()
    
    lazy var imageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "intro2")
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    
    lazy var lineSeparatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0.9, alpha: 1)
        return view
    }()
    

    
    func setupViews() {
        
        
        addSubview(imageView)
        addSubview(textView)
        addSubview(lineSeparatorView)
        imageView.anchor(self.topAnchor, left: self.leftAnchor, bottom: textView.topAnchor, right: self.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant:0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
        
        textView.anchor(nil, left: self.leftAnchor, bottom: self.bottomAnchor, right: self.rightAnchor)
        lineSeparatorView.anchor(nil, left: self.leftAnchor, bottom: textView.topAnchor, right: self.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        lineSeparatorView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        
        //textView.anchorWithReturnAnchors(nil, left: self.leftAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, topConstant: 0, leftConstant: 16, bottomConstant: 0, rightConstant: 16, widthConstant: 0, heightConstant: 0)
        textView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.3).isActive = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
