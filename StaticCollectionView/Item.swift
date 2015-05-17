//
//  Item.swift
//  StaticCollectionView
//
//  Created by Spencer MacDonald on 16/05/2015.
//  Copyright (c) 2015 Square Bracket Software. All rights reserved.
//

import UIKit

public class Item: Node {
    public var size: CGSize?
    
    public var sizeHandler: ((Item, UICollectionView, UICollectionViewLayout, NSIndexPath) -> CGSize)?

    public var didSelectHandler: ((Item, UICollectionView, NSIndexPath) -> Void)?
    public var didDeselectHandler: ((Item, UICollectionView, NSIndexPath) -> Void)?
    
    public var dequeueCellHandler: ((Item, UICollectionView, NSIndexPath) -> UICollectionViewCell)?
    
    public convenience init(object: AnyObject?){
        self.init()
        self.object = object
    }
}
