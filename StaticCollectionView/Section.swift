//
//  Section.swift
//  StaticCollectionView
//
//  Created by Spencer MacDonald on 16/05/2015.
//  Copyright (c) 2015 Square Bracket Software. All rights reserved.
//

import UIKit

public class Section: Node {
    public var items: [Item] = []
    
    public var insets: UIEdgeInsets?
    
    public var minimumLineSpacing: CGFloat?
    public var minimumInteritemSpacing: CGFloat?
    
    public var headerReferenceSize: CGSize?
    public var footerReferenceSize: CGSize?
    
    public var numberOfItems: Int {
        get {
           return count(items)
        }
    }
    
    public subscript(index: Int) -> Item {
        get {
            return items[index]
        }
        set(newValue) {
            items[index] = newValue
        }
    }
    
    public convenience init(items: [Item]) {
        self.init()
        self.items = items
    }
    
    public convenience init(objects: [AnyObject]) {
        self.init()
        self.items = objects.map({ Item(object: $0) })
    }
    
    public func addItem(item: Item) {
        items.append(item)
    }
    
    public func addObject(object: AnyObject) {
        items.append(Item(object: object))
    }
    
    public func removeItem(item: Item) {
        if let index = indexForItem(item) {
            items.removeAtIndex(index)
        }
    }
    
    public func removeObject(object: AnyObject) {
        if let index = indexForObject(object) {
            items.removeAtIndex(index)
        }
    }
    
    public func indexForItem(item: Item) -> Int? {
        return find(items, item)
    }
    
    public func indexForObject(object: AnyObject) -> Int? {
        for (index, item) in enumerate(items) {
            if let object = object as? NSObject {
                for item in items{
                    if let itemObject = item.object as? NSObject {
                        if object == itemObject {
                            return index
                        }
                    }
                }
            }
        }
        return nil
    }
    
    public func containsItem(item: Item) -> Bool {
        return contains(items, item)
    }
    
    public func containsObject(object: AnyObject) -> Bool {
        if let index = indexForObject(object) {
            return true
        }
        else {
            return false
        }
    }
}
