//
//  ViewController.swift
//  CountSample-Swift2
//
//  Created by ShinokiRyosei on 2016/09/18.
//  Copyright © 2016年 ShinokiRyosei. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var label: UILabel!
    
    var number: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func plus(sender: UIButton) {
        number = number + 1
        label.text = String(number)
        
        changeColor(number)
    }
    
    @IBAction func minus() {
        number--
        label.text = String(number)
        
        changeColor(number)
    }
    
    @IBAction func times() {
        number = number * 2
        label.text = String(number)
        
        changeColor(number)
    }
    
    @IBAction func divide() {
        number = number / 2
        label.text = String(number)
        
        changeColor(number)
    }
    
    @IBAction func clear() {
        number = 0
        label.text = String(number)
        
        changeColor(number)
    }
    
    func changeColor(number: Int) {
        if number >= 10 {
            label.textColor = UIColor.redColor()
        }else if number <= -10 {
            label.textColor = UIColor.blueColor()
        }else {
            label.textColor = UIColor.blackColor()
        }
    }
}

