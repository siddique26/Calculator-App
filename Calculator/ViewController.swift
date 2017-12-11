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
    var previousNumber: String = "0.0"
    var currentNumber: String = "0.0"
    var storedOperator: String? = ""
    var operatorInitialValue: Bool = true
    var answer = 0.0
    var result = 0.0
    @IBOutlet weak var display: UILabel!
    @IBOutlet var round: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for a in round{
            a.layer.cornerRadius = a.bounds.size.width/2
        }
        
        // Do any additional setup after loading the view, typically from a nib.
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
    }
    @IBAction func numericButtons(_ sender: UIButton) {
        let number = sender.currentTitle
        storeOperand(number!)
    }
    @IBAction func operators(_ sender: UIButton) {
            let sign = sender.currentTitle
        if currentNumber != "0" {
            storedOperator = sign
            operatorInitialValue = false
        }
    }

    @IBAction func equal(_ sender: UIButton) {
        computeValue()
    }
    //Storing operands
    func storeOperand(_ element: String){
        if storedOperator == ""{
            if currentNumber == "0"{
                currentNumber = element
            }else{
                currentNumber += element
            }
        }else{
            previousNumber = currentNumber
            currentNumber = "0"
            if currentNumber == "0"{
                currentNumber = element
            }else{
                currentNumber += element
            }
        }
    }
    //Calculating the result from entered operator and operands
    func computeValue(){
        let value1 = (previousNumber as NSString).doubleValue
        let value2 = (currentNumber as NSString).doubleValue
        if let sign = storedOperator{
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
//            currentNumber = String(result)
        }
        previousNumber = "0"
        storedOperator = "0"
        answer = result
        displayResult(answer)
    }
   //Displaying the result
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
    //Resetting the values
    @IBAction func clear(_ sender: UIButton) {
        display.text = "0"
        new = true
        previousNumber = "0"
        currentNumber = "0"
        answer = 0.0
        storedOperator = ""
        operatorInitialValue = true
    }
}

