//
//  DatasourceController.swift
//  GiveDapps-new
//
//  Created by Hanjoon Choe on 4/15/17.
//  Copyright © 2017 Hanjoon Choe. All rights reserved.
//

import UIKit
import LBTAComponents



class UserFooter: DatasourceCell {
    
    override func setupViews() {
        super.setupViews()
        backgroundColor = .green
    }
}


class UserHeader: DatasourceCell {
    
    override func setupViews() {
        super.setupViews()
        backgroundColor = .blue
    }
}


class UserCell: DatasourceCell {
    
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

class HomeDataSource: Datasource {
    
    let words = ["user1","user2","user3"]
    
    override func footerClasses() -> [DatasourceCell.Type]? {
        return [UserFooter.self]
    }
    
    override func headerClasses() -> [DatasourceCell.Type]? {
        return [UserHeader.self]
    }
    

    override func cellClasses() -> [DatasourceCell.Type] {
        return [UserCell.self]
    }
    
    
    override func item(_ indexPath: IndexPath) -> Any? {
        return words[indexPath.item]
    }
    
    
    
    override func numberOfItems(_ section: Int) -> Int {
        return words.count
    }
    
    
}

class datasourceController: DatasourceController {
    

    override func viewDidLoad() {
        
        super.viewDidLoad()
        let homeDatasource = HomeDataSource()
        self.datasource = homeDatasource
        
        
    }
    
   func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width:  view.frame.width, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 50)
    }

    
    
}
