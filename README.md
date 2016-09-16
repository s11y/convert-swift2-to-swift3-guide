# Swift2 -> Swift3 guide

## 概要
本プロジェクトは、iOS 10、Xcode8が正式リリースされたことで、Swift3又は新しいiOS Frameworkへの対応を迫られるなかで、Swift3、特にiOS Frameworkの変更点をまとめ、、初学者でもXcode8やSwift3での開発がスムーズにできるようにするためのプロジェクトです。

## AppDelegate
AppDelegateの最初の状態がSwift3で以下のように変わります。

### コード
```Swift3: AppDelegate.swift
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool { return true }

    func applicationWillResignActive(_ application: UIApplication) { }

    func applicationDidEnterBackground(_ application: UIApplication) { }

    func applicationWillEnterForeground(_ application: UIApplication) { }

    func applicationDidBecomeActive(_ application: UIApplication) { }

    func applicationWillTerminate(_ application: UIApplication) { }
}
```

Swift2までは以下の通りでした。
```swift2: AppDelegate.swift
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool { return true }

    func applicationWillResignActive(application: UIApplication) { }

    func applicationDidEnterBackground(application: UIApplication) { }

    func applicationWillEnterForeground(application: UIApplication) { }

    func applicationDidBecomeActive(application: UIApplication) { }

    func applicationWillTerminate(application: UIApplication) { }
}
```

### 変更点
- メソッドの第一引数の外部引数名にアンダーバー(_)追加
- ```application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool```の第二引数が、```didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?```に変更

### 理由
Swift3では、第一引数でも外部引数名に、```_ ```を設定しない場合、呼び出し時に第一引数を書くことが必須になります。

例、
```Swift3
// 定義時
func hoge(num: Int) {　}

// 呼び出し時
self.hoge(num: 0)
```

## UITableView
UITableViewにおける変更点としては、UITableViewDelegate、UITableViewDataSource、registerNibのメソッドの変更点が一番大きいと思います。

### コード

Swift3では、以下のようなコードに変更されました。

```Swift:ViewController.swift
import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var table: UITableView!

    let stringArr: [String] = ["test", "test", "test"]

    override func viewDidLoad() {
        super.viewDidLoad()
        table.delegate = self
        table.dataSource = self

        table.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "Cell")
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: TableViewCell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! TableViewCell

        cell.label.text = stringArr[indexPath.row]

        return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stringArr.count
    }
}
```

Swift2では、以下のようなコードでした。

```swift:ViewController.swift
import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var table: UITableView!

    let stringArr: [String] = ["test", "test", "test"]

    override func viewDidLoad() {
        super.viewDidLoad()
        table.delegate = self
        table.dataSource = self

        table.registerNib(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "Cell")
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stringArr.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: TableViewCell = tableView.dequeueReusableCellWithIdentifier("Cell") as! TableViewCell

        cell.label.text = stringArr[indexPath.row]

        return cell
    }
}
```

### 変更点
- cellの数を決めるdataSourceメソッドが、```tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell```から```tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell```に変更になりました。
- 軽微な変更ではありますが、```tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int```の第一引数に外部引数名として、```_```が追加されました。
- ```registerNib```のメソッド名も、```register```に変更になりました。同様に、```dequeueReusableCellWithIdentifier```というメソッド名も、```dequeueReusableCell(withIdentifier:)```になりました。

### 理由
- Swift3では、NSIndexPathではなく、IndexPathという構造体に変更になりました。
