# StaticCollectionView

[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)

`StaticCollectionView` provides a simple API that allows you too quickly build up Static Collection Views, while still giving you the ability to dynamically add or remove items.

`StaticCollectionView` has 3 core types `DataSource`, `Section` and `Item`.

A typical implementation would involve adding a `dataSource` property to your view controller:

```swift
let dataSource: StaticCollectionView.DataSource = StaticCollectionView.DataSource()
```

Then setting up your Static Collection View in `viewDidLoad`:

```swift
let buttonItem = StaticCollectionView.Item()

buttonItem.dequeueCellHandler = {(row, collectionView, indexPath) -> UICollectionViewCell in
  let collectionViewCell = collectionView.dequeueReusableCellWith(withIdentifier: "UICollectionViewCell", for: indexPath) as! UICollectionViewCell
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
func numberOfSections(in collectionView: UICollectionView) -> Int {
    return dataSource.numberOfSections
}

func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return dataSource.sections[section].numberOfItems
}

func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {    
    let item = dataSource.item(at: indexPath)
    return item.dequeueCellHandler!(item, collectionView, indexPath)    
}
```

If you have setup any `didSelectHandler` then you will also need to implement the appropriate `UICollectionViewDelegate` method:

```swift
func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    let item = dataSource.item(at: indexPath)
    
    if let didSelectHandler = row.didSelectHandler {
        didSelectHandler(item, collectionView, indexPath)
    }
}
```

Thats all there is to it, `DataSource`, `Section` and `Item` also have additional properties and methods to help with building Static Collection Views.

## Installation

### Carthage

1. Add the following to your *Cartfile*:
  `github "ObjColumnist/StaticCollectionView"`
2. Run `carthage update`
3. Add the framework as described in [Carthage Readme](https://github.com/Carthage/Carthage#adding-frameworks-to-an-application)

