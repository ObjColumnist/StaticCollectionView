//
//  DataSource.swift
//  StaticCollectionView
//
//  Created by Spencer MacDonald on 16/05/2015.
//  Copyright (c) 2015 Square Bracket Software. All rights reserved.
//

import UIKit

public class DataSource {
    public var sections: [Section] = []
    public var collectionView: UICollectionView?
    
    public var numberOfSections: Int {
        get {
            return sections.count
        }
    }
    
    public var numberOfItems: Int {
        get {
            return sections.reduce(0, combine: {$0 + $1.numberOfItems})
        }
    }
    
    public var selectedItems: [Item] {
        get {
            var selectedItems: [Item] = []
            
            if let selectedIndexPaths = collectionView?.indexPathsForSelectedItems() {
                for indexPath in selectedIndexPaths{
                    selectedItems.append(itemAtIndexPath(indexPath))
                }
            }
            
            return selectedItems
        }
    }
    
    public subscript(index: Int) -> Section {
        get {
            return sections[index]
        }
        set(newValue) {
            sections[index] = newValue
        }
    }
    
    public subscript(indexPath: NSIndexPath) -> Item {
        get {
            return sections[indexPath.section].items[indexPath.item]
        }
        set(newValue) {
            sections[indexPath.section].items[indexPath.item] = newValue
        }
    }
    
    public init() {
        
    }
    
    public func sectionAtIndex(index: Int) -> Section {
        return sections[index]
    }
    
    public func itemAtIndexPath(indexPath: NSIndexPath) -> Item {
        return sections[indexPath.section].items[indexPath.row]
    }
    
    public func objectAtIndexPath(indexPath: NSIndexPath) -> AnyObject? {
        return sections[indexPath.section].items[indexPath.row].object
    }
}
