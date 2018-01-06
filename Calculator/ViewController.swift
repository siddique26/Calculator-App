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
    var currentValue: String = ""
    var operand = [String]()
    var operators = [String]()
    var answer = 0.0
    @IBOutlet weak var display: UILabel!
    @IBOutlet var round: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for a in round{
            a.layer.cornerRadius = a.bounds.size.width/2
        }
    }
    //Showing numbers in display
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
        storeOperand(digit!)
    }

    @IBAction func equal(_ sender: UIButton) {
        if currentValue.contains("+"){
            answer = Double(currentValue.components(separatedBy: "+").flatMap{ Int($0)}.reduce(0){ $0 +   $1})
        }else if currentValue.contains("-"){
            answer = Double(currentValue.components(separatedBy: "-").flatMap{ Int($0)}.reduce(0,{-($0)-$1}))
        }else if currentValue.contains("*"){
            answer = Double(currentValue.components(separatedBy: "*").flatMap{ Int($0)}.reduce(1, {
                $0 * $1
            }))
        }else if currentValue.contains("/"){
            let numberArray = currentValue.components(separatedBy: "/")
            let a  = numberArray[0]
            let b  = numberArray[1]
            let operand1 = Double(a)
            let operand2 = Double(b)
             answer = operand1! / operand2!
        }
        else if currentValue.contains("%"){
            let numberArray = currentValue.components(separatedBy: "%")
            let a  = numberArray[0]
            let b  = numberArray[1]
            let operand1 = Double(a)
            let operand2 = Double(b)
            answer = operand1! / operand2!
        }
        displayResult(answer)
    }
   
    //Storing operands
    func storeOperand(_ element: String){
        
            if currentValue == ""{
                currentValue = element
            }else{
                currentValue += element
            }

    }
   
   //Displaying the result
    func displayResult(_ item: Double){
        let double: Double = item
        let int: Int = Int(item)
        let finalAnswer = double - (Double(int) * 1.00)
        if finalAnswer == 0.00{
            display.text = String(int)
        }else{
        display.text = String(item)
            }
    }
    //Resetting the values
    @IBAction func clear(_ sender: UIButton) {
        display.text = "0"
        new = true
        currentValue = ""
        answer = 0.0
    }
}

