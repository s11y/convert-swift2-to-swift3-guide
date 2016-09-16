//
//  ViewController.swift
//  CountSample
//
//  Created by ShinokiRyosei on 2016/09/16.
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
    
    @IBAction func plus(sender: UIButton) {
        number += 1
        label.text = String(number)
        
        changeColor(number: number)
    }
    
    @IBAction func minus() {
        number -= 1
        label.text = String(number)
        
        changeColor(number: number)
    }
    
    @IBAction func times() {
        number = number * 2
        label.text = String(number)
        
        changeColor(number: number)
    }
    
    @IBAction func divide() {
        number = number / 2
        label.text = String(number)
        
        changeColor(number: number)
    }
    
    @IBAction func clear() {
        number = 0
        label.text = String(number)
        
        changeColor(number: number)
    }
    
    func changeColor(number: Int)  {
        if number >= 10 {
            label.textColor = UIColor.red
        }else if number <= -10 {
            label.textColor = UIColor.blue
        }else {
            label.textColor = UIColor.black
        }
    }
}

