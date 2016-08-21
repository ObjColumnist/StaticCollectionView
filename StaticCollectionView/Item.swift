//
//  Item.swift
//  StaticCollectionView
//
//  Created by Spencer MacDonald on 16/05/2015.
//  Copyright (c) 2015 Square Bracket Software. All rights reserved.
//

import UIKit

open class Item: Node {
    open var size: CGSize?
    
    open var sizeHandler: ((Item, UICollectionView, UICollectionViewLayout, IndexPath) -> CGSize)?

    open var didSelectHandler: ((Item, UICollectionView, IndexPath) -> Void)?
    open var didDeselectHandler: ((Item, UICollectionView, IndexPath) -> Void)?
    
    open var dequeueCellHandler: ((Item, UICollectionView, IndexPath) -> UICollectionViewCell)?
    
    public convenience init(object: AnyObject?){
        self.init()
        self.object = object
    }
}
