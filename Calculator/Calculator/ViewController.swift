//
//  ViewController.swift
//  Calculator
//
//  Created by Lê Viết Mẫn on 6/2/15.
//  Copyright (c) 2015 Lê Viết Mẫn. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var display: UILabel!

    var userIsInAMiddleOfTypingANumber: Bool = false

    @IBAction func appendDigit(sender: UIButton) {
        let digit = sender.currentTitle!
        
        if display.text!.rangeOfString(".") != nil && digit == "." {
            return
        }
        
        if userIsInAMiddleOfTypingANumber {
            display.text = display.text! + digit
        } else
        {
            display.text = (digit == "." ? display.text! + digit : digit)
            userIsInAMiddleOfTypingANumber = true
        }
    }
    
    var operandStack: Array<Double> = []
    
    func performTwoOperand(operation: (Double, Double) -> Double){
        if operandStack.count >= 2 {
            displayValue = operation(operandStack.removeLast(), operandStack.removeLast())
            enter()
        }
    }
    
    func performOneOperand(operation: (Double) -> Double){
        if operandStack.count >= 1 {
            displayValue = operation(operandStack.removeLast())
            enter()
        }
    }
    
    @IBAction func operate(sender: UIButton) {
        let operation = sender.currentTitle!
        if userIsInAMiddleOfTypingANumber{
            enter()
        }
        switch operation{
        case "✕": performTwoOperand { $0 * $1 }
        case "÷": performTwoOperand { $1 / $0 }
        case "+": performTwoOperand { $0 + $1 }
        case "-": performTwoOperand { $1 - $0 }
        case "√": performOneOperand { sqrt($0) }
        default: break
        }
    }
    
    @IBAction func enter() {
        userIsInAMiddleOfTypingANumber = false
        operandStack.append(displayValue)
    }
    
    var displayValue: Double{
        get{
            return NSNumberFormatter().numberFromString(display.text!)!.doubleValue
        }
        set{
            display.text = "\(newValue)"
            userIsInAMiddleOfTypingANumber = false
        }
    }
}

