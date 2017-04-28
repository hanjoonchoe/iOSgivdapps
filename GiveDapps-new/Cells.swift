//
//  Cells.swift
//  GiveDapps-new
//
//  Created by Hanjoon Choe on 4/15/17.
//  Copyright © 2017 Hanjoon Choe. All rights reserved.
//

import LBTAComponents

class userFooter: DatasourceCell {
    
    override func setupViews() {
        super.setupViews()
        backgroundColor = .green
    }
}


class userHeader: DatasourceCell {
    
    override func setupViews() {
        super.setupViews()
        backgroundColor = .blue
    }
}


class userCell: DatasourceCell {
    
    override var datasourceItem: Any? {
        didSet{
            
            nameLabel.text = datasourceItem as? String
            
        }
    }
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "hahahahaha"
        return label
    }()
    
    override func setupViews() {
        backgroundColor = .yellow
        
        addSubview(nameLabel)
        nameLabel.anchor(topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
    }
}
