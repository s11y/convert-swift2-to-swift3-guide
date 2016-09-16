## UITableViewの変更点

# iOS Frameworkの変更点
Delegateメソッド、DataSourceメソッド、その他メソッドの変更点をかんたんにまとめます。
Frameworkの変更点すべてを列挙するわけではなく、よく使うメソッドの変更点だけを列挙しています。

## Delegateメソッド
### Swift3、新iOS Framework
```swift
optional public func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]?

optional public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
```

### Swift2、旧iOS Framework
```swift

```

## DataSourceメソッド
### Swift3、新iOS Framework
```swift
public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int

public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
```

### Swift2、旧iOS Framework

## その他メソッド
### Swift3、新iOS Framework
```swift
open func register(_ nib: UINib?, forCellReuseIdentifier identifier: String)
```

### Swift2、旧iOS Framework
```swift

```
