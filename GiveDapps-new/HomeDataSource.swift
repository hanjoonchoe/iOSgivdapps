//
//  HomeDatasource.swift
//  GiveDapps-new
//
//  Created by Hanjoon Choe on 4/15/17.
//  Copyright © 2017 Hanjoon Choe. All rights reserved.
//

import LBTAComponents


class homeDataSource: Datasource {
    
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
