//
//  DataSource.swift
//  StaticCollectionView
//
//  Created by Spencer MacDonald on 16/05/2015.
//  Copyright (c) 2015 Square Bracket Software. All rights reserved.
//

import UIKit

open class DataSource {
    open var sections: [Section] = []
    open var collectionView: UICollectionView?
    
    open var numberOfSections: Int {
        return sections.count
    }
    
    open var numberOfItems: Int {
        return sections.reduce(0, {$0 + $1.numberOfItems})
    }
    
    open var selectedItems: [Item] {
        var selectedItems: [Item] = []
        
        if let selectedIndexPaths = collectionView?.indexPathsForSelectedItems {
            for indexPath in selectedIndexPaths{
                selectedItems.append(item(at: indexPath))
            }
        }
        
        return selectedItems
    }
    
    open subscript(index: Int) -> Section {
        get {
            return sections[index]
        }
        set(newValue) {
            sections[index] = newValue
        }
    }
    
    open subscript(indexPath: IndexPath) -> Item {
        get {
            return sections[(indexPath as NSIndexPath).section].items[(indexPath as NSIndexPath).item]
        }
        set(newValue) {
            sections[(indexPath as NSIndexPath).section].items[(indexPath as NSIndexPath).item] = newValue
        }
    }
    
    public init() {
        
    }
    
    open func section(at index: Int) -> Section {
        return sections[index]
    }
    
    open func item(at indexPath: IndexPath) -> Item {
        return sections[(indexPath as NSIndexPath).section].items[(indexPath as NSIndexPath).row]
    }
    
    open func object(at indexPath: IndexPath) -> AnyObject? {
        return sections[(indexPath as NSIndexPath).section].items[(indexPath as NSIndexPath).row].object
    }
}
