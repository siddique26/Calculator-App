//
//  ViewController.swift
//  Calculator
//
//  Created by Siddique on 09/12/17.
//  Copyright © 2017 Siddique. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var new = true
    @IBOutlet weak var display: UILabel!
    @IBOutlet var round: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for a in round{
            a.layer.cornerRadius = a.bounds.size.width/2
        }
       
        // Do any additional setup after loading the view, typically from a nib.
    }

    func addDigit(number: String){
        var textDisplay = display.text!
            if new{
            textDisplay = ""
            new = false
            }
        textDisplay = textDisplay + number
        display.text = textDisplay
    }
    
    @IBAction func touch(_ sender: UIButton) {
       let digit = sender.currentTitle
        addDigit(number: digit!)
    }
  
    
    
}

