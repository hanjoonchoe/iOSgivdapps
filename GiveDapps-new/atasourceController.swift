//
//  Cells.swift
//  GiveDapps-new
//
//  Created by Hanjoon Choe on 4/15/17.
//  Copyright © 2017 Hanjoon Choe. All rights reserved.
//

import LBTAComponents



class atasourceController: DatasourceController {
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        let homeDatasource = homeDataSource()
        self.datasource = homeDatasource
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width:  view.frame.width, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 50)
    }
    
    
    
}
