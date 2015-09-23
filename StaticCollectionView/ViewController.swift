//
//  ViewController.swift
//  StaticCollectionView
//
//  Created by Spencer MacDonald on 16/05/2015.
//  Copyright (c) 2015 Square Bracket Software. All rights reserved.
//

import UIKit

public class ViewController: UICollectionViewController {

    public let dataSource = DataSource()
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        dataSource.collectionView = collectionView
        reloadDataSource()
    }
    
    public func reloadDataSource() {
        
    }

    // MARK: UICollectionViewDataSource

    public override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return dataSource.numberOfSections
    }

    public override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.sections[section].numberOfItems
    }

    public override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let item = dataSource.itemAtIndexPath(indexPath)
        
        return item.dequeueCellHandler!(item, collectionView, indexPath)
    }

    // MARK: UICollectionViewDelegate

    public override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let item = dataSource.itemAtIndexPath(indexPath)
        
        if let didSelectHandler = item.didSelectHandler {
            return didSelectHandler(item, collectionView, indexPath)
        }
    }
    
    public override func collectionView(collectionView: UICollectionView, didDeselectItemAtIndexPath indexPath: NSIndexPath) {
        let item = dataSource.itemAtIndexPath(indexPath)
        
        if let didDeselectHandler = item.didDeselectHandler {
            return didDeselectHandler(item, collectionView, indexPath)
        }
    }
}
