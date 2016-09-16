## UITableViewの変更点

# iOS Frameworkの変更点
Delegateメソッド、DataSourceメソッド、その他メソッドの変更点をかんたんにまとめます。
Frameworkの変更点すべてを列挙するわけではなく、よく使うメソッドの変更点だけを列挙しています。

## Delegateメソッド
### Swift3、新iOS Framework
```swift
// option 。cellをスワイプした際にどのようなボタンを表示するか、またそのボタンの処理。
optional public func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]?

// option。 cellをタップした際に行われる処理。
optional public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
```

### Swift2、旧iOS Framework
```swift

```

## DataSourceメソッド
### Swift3、新iOS Framework
```swift
// 必須。返すcellの数を決めるメソッド。
public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int

// 必須。返すcellを決めるメソッド。
public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
```

### Swift2、旧iOS Framework

## その他メソッド
### Swift3、新iOS Framework
```swift
// TableViewで返すcellのxibを指定するメソッド。
open func register(_ nib: UINib?, forCellReuseIdentifier identifier: String)

// tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCellで返すcellを指定するメソッド。
open func dequeueReusableCell(withIdentifier identifier: String) -> UITableViewCell?

// TableViewにcellを差し込むメソッド。
open func insertRows(at indexPaths: [IndexPath], with animation: UITableViewRowAnimation)

// TableViewからcellを削除するメソッド
open func deleteRows(at indexPaths: [IndexPath], with animation: UITableViewRowAnimation)
```

### Swift2、旧iOS Framework
```swift

```
