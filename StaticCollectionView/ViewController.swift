//
//  ViewController.swift
//  StaticCollectionView
//
//  Created by Spencer MacDonald on 16/05/2015.
//  Copyright (c) 2015 Square Bracket Software. All rights reserved.
//

import UIKit

open class ViewController: UICollectionViewController {

    open let dataSource = DataSource()
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        dataSource.collectionView = collectionView
        reloadDataSource()
    }
    
    open func reloadDataSource() {
        
    }

    // MARK: UICollectionViewDataSource

    open override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return dataSource.numberOfSections
    }

    open override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.sections[section].numberOfItems
    }

    open override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = dataSource.item(at: indexPath)
        
        return item.dequeueCellHandler!(item, collectionView, indexPath)
    }

    // MARK: UICollectionViewDelegate

    open override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let item = dataSource.item(at: indexPath)
        
        if let didSelectHandler = item.didSelectHandler {
            return didSelectHandler(item, collectionView, indexPath)
        }
    }
    
    open override func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let item = dataSource.item(at: indexPath)
        
        if let didDeselectHandler = item.didDeselectHandler {
            return didDeselectHandler(item, collectionView, indexPath)
        }
    }
}
