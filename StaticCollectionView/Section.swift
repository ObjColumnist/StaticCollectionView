//
//  Section.swift
//  StaticCollectionView
//
//  Created by Spencer MacDonald on 16/05/2015.
//  Copyright (c) 2015 Square Bracket Software. All rights reserved.
//

import UIKit

open class Section: Node {
    open var items: [Item] = []
    
    open var insets: UIEdgeInsets?
    
    open var minimumLineSpacing: CGFloat?
    open var minimumInteritemSpacing: CGFloat?
    
    open var headerReferenceSize: CGSize?
    open var footerReferenceSize: CGSize?
    
    open var numberOfItems: Int {
        return items.count
    }
    
    open subscript(index: Int) -> Item {
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
    
    open func add(_ item: Item) {
        items.append(item)
    }
    
    open func add(_ object: AnyObject) {
        items.append(Item(object: object))
    }
    
    open func remove(_ item: Item) {
        if let index = index(for: item) {
            items.remove(at: index)
        }
    }
    
    open func remove(_ object: AnyObject) {
        if let index = index(for: object) {
            items.remove(at: index)
        }
    }
    
    open func index(for item: Item) -> Int? {
        return items.index(of: item)
    }
    
    open func index(for object: AnyObject) -> Int? {
        for (index, _) in items.enumerated() {
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
    
    open func contains(_ item: Item) -> Bool {
        return items.contains(item)
    }
    
    open func contains(_ object: AnyObject) -> Bool {
        if let _ = index(for: object) {
            return true
        } else {
            return false
        }
    }
}
