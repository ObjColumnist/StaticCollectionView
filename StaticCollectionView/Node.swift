//
//  Node.swift
//  StaticCollectionView
//
//  Created by Spencer MacDonald on 16/05/2015.
//  Copyright (c) 2015 Square Bracket Software. All rights reserved.
//

import UIKit

open class Node: Equatable {
    open var object: AnyObject?
    
    public init(){
        
    }
}

public func ==(lhs: Node, rhs: Node) -> Bool {
    return true
}
