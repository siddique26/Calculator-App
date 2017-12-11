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
    var previousNumber: Double = 0.0
    var currentNumber: Double = 0.0
    var storedOperator: String? = ""
    var operatorInitialValue: Bool = true
    var answer = 0.0
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
    @IBAction func numericButtons(_ sender: UIButton) {
        let number = sender.currentTitle
        storeOperand(Double(number!)!)
    }
    @IBAction func operators(_ sender: UIButton) {
            let sign = sender.currentTitle
        if currentNumber != 0.0 {
            storedOperator = sign
            operatorInitialValue = false
        }
    }

    @IBAction func equal(_ sender: UIButton) {
        computeValue()
    }
    func storeOperand(_ element: Double){
        if storedOperator == ""{
            if currentNumber == 0.0{
                currentNumber = element
            }else{
                currentNumber += element
            }
        }else{
            previousNumber = currentNumber
            currentNumber = 0.0
            
            if currentNumber == 0.0{
                currentNumber = element
            }else{
                currentNumber += element
            }
        }
    }
    func computeValue(){
        let value1 = previousNumber
        let value2 = currentNumber
        if let sign = storedOperator{
            var result = 0.0
            switch sign{
            case "+":
                result = value1 + value2
                break
            case "-":
                result = value1 - value2
                break
            case "*":
                result = value1 * value2
                break
            case "/":
                result = value1 / value2
                break
            case "%":
                result = value1.truncatingRemainder(dividingBy: value2)
                break
            default:
            break
            }
            currentNumber = result
        }
        previousNumber = 0.0
        storedOperator = "0"
        answer = currentNumber
        displayResult(answer)
    }
   
    func displayResult(_ item: Double){
        let double: Double = item
        let int: Int = Int(item)
        let finalAnswer = double - (Double(int) * 1.00)
        if finalAnswer == 0.00{
            display.text = String(int)
        }else{
            display.text = String(double)
        }
    }

    @IBAction func clear(_ sender: UIButton) {
        display.text = "0"
        new = true
        previousNumber = 0.0
        currentNumber = 0.0
        answer = 0.0
        storedOperator = ""
        operatorInitialValue = true
    }
}

