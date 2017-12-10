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
    var calculate = Number()
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
        calculate.push(digit!)
        cal()
        calculate.pop()
    }
    @IBAction func Calculation(_ sender: UIButton) {
        var double: Double
        var int: Int
        if calculate.addSub != 0.0{
            double = calculate.addSub
            int = Int(calculate.addSub)
        }else{
            double = calculate.muldiv
            int = Int(calculate.addSub)
        }
        let result = double - (Double(int) * 1.00)
        if result == 0.00{
            display.text = String(int)
        }else{
        display.text = String(double)
        }
    }
    @IBAction func clear(_ sender: UIButton) {
        display.text = "0"
        new = true
        calculate.addSub = 0.0
        calculate.heap = 0.0
        calculate.muldiv = 0.0
        calculate.operation = ""
    }
    
    func cal(){
        switch calculate.operation{
        case "+":
            calculate.addSub += calculate.heap
            break
        case "-":
            calculate.addSub += calculate.heap
            break
        case "*":
            calculate.muldiv += calculate.heap
            break
        case "/":
            calculate.muldiv += calculate.heap
            break
        case ".":
            calculate.items.append(".")
        default:
            break
        }
    }
    
    
    
}

