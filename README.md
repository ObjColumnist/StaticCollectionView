# StaticCollectionView

[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)

`StaticCollectionView` provides a simple API that allows you too quickly build up Static Collection Views, while still giving you the ability to dynamically add or remove items.

StaticCollectionView has 3 core types `DataSource`, `Section` and `Item`.

A typical implementation would involve adding a `dataSource` property to your view controller:

```swift
let dataSource: StaticCollectionView.DataSource = StaticCollectionView.DataSource()
```

Then setting up your Static Collection View in `viewDidLoad`:

```swift
let buttonItem = StaticCollectionView.Item()

buttonItem.dequeueCellHandler = {(row, collectionView, indexPath) -> UICollectionViewCell in
  let collectionViewCell = collectionView.dequeueReusableCellWithReuseIdentifier("UICollectionViewCell", forIndexPath: indexPath) as! UICollectionViewCell
  return collectionViewCell
}

buttonItem.didSelectHandler = { [weak self] (row, collectionView, indexPath) -> Void in
    self?.buttonItemPressed(nil)
}

let buttonSection = StaticCollectionView.Section(items: [buttonItem])

dataSource.sections = [buttonSection]
```

Then simply set up your `UICollectionViewDataSource` to use the `dataSource` property to get its data:

```swift
func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
    return dataSource.numberOfSections
}

func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return dataSource.sections[section].numberOfItems
}

func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {    
    let item = dataSource.itemAtIndexPath(indexPath)
    return item.dequeueCellHandler!(item, collectionView, indexPath)    
}
```

If you have setup any `didSelectHandler` then you will also need to implement the appropriate `UICollectionViewDelegate` method:

```swift
func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
    let item = dataSource.itemAtIndexPath(indexPath)
    
    if let didSelectHandler = row.didSelectHandler {
        didSelectHandler(item, collectionView, indexPath)
    }
}
```

Thats all there is to it, `DataSource`, `Section` and `Item` also have additional properties and methods to help with building static table views:

## DataSource

```swift
public var sections: [Section]

public var numberOfSections: Int
public var numberOfItems: Int
public var selectedItems: [Item]

public subscript(index: Int) -> Section
public subscript(indexPath: NSIndexPath) -> Item

public func sectionAtIndex(index: Int) -> Section

public func itemAtIndexPath(indexPath: NSIndexPath) -> Item
public func objectAtIndexPath(indexPath: NSIndexPath) -> AnyObject?
```

## Section

```swift
public var items: [Item]

public var insets: UIEdgeInsets?

public var minimumLineSpacing: CGFloat?
public var minimumInteritemSpacing: CGFloat?

public var headerReferenceSize: CGSize?
public var footerReferenceSize: CGSize?

public var numberOfItems: Int

public subscript(index: Int) -> Item

public convenience init(items: [Item])
public convenience init(objects: [AnyObject])

public func addItem(item: Item)
public func addObject(object: AnyObject)

public func removeItem(item: Item)
public func removeObject(object: AnyObject)

public func indexForItem(item: Item) -> Int?
public func indexForObject(object: AnyObject) -> Int?

public func containsItem(item: Item) -> Bool
public func containsObject(object: AnyObject) -> Bool
```

## Item

```swift
public var size: CGSize?

public var sizeHandler: ((Item, UICollectionView, UICollectionViewLayout, NSIndexPath) -> CGSize)?

public var didSelectHandler: ((Item, UICollectionView, NSIndexPath) -> Void)?
public var didDeselectHandler: ((Item, UICollectionView, NSIndexPath) -> Void)?

public var dequeueCellHandler: ((Item, UICollectionView, NSIndexPath) -> UICollectionViewCell)?

public convenience init(object: AnyObject?)
```


## Installation

### Carthage

1. Add the following to your *Cartfile*:
  `github "ObjColumnist/StaticCollectionView"`
2. Run `carthage update`
3. Add the framework as described in [Carthage Readme](https://github.com/Carthage/Carthage#adding-frameworks-to-an-application)

