//
//  ViewController.swift
//  Calculator2
//
//  Created by Alex on 11/22/17.
//  Copyright © 2017 Azat. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var Label: UILabel!
    
    var firstDigit = true
    var dotIsSet = false
    var operation = "="
    var dot: String = "."
    var digit: Double = 0
    var operand: Double = 0
    
    var showValue: Double {
        get {
            return NumberFormatter().number(from: Label.text!)!.doubleValue
        }
        set {
            Label.text = String(format: "%2.3f", newValue)
            firstDigit = true
            operation = "="
        }
    }
    
    @IBAction func digitButtons(_ sender: UIButton) {
        let digit = sender.currentTitle!
        if firstDigit {
            if dotIsSet {
                Label.text = Label.text! + dot
                dotIsSet = false
            } else {
                Label.text = digit
            }
            firstDigit = false
        } else {
            if dotIsSet {
                Label.text = Label.text! + dot
                dotIsSet = false
            } else {
                Label.text = Label.text! + digit
            }
        }
    /*
        Label.text = firstDigit ? digit : Label.text! + digit
        firstDigit = false
    */
    }
    
    @IBAction func Cancel(_ sender: Any) {
        showValue = 0
    }
    
    
    @IBAction func Calculate(_ sender: Any) {
        switch operation {
        case "+":
            showValue += operand
        case "-":
            showValue = operand - showValue
        case "/":
            showValue = operand / showValue
        case "*":
            showValue *= operand
        default:
            break
        }
    }
    
    
    @IBAction func Operations(_ sender: UIButton) {
        operation = sender.currentTitle!
        operand = showValue
        firstDigit = true
    }
    
    
    @IBAction func setDot(_ sender: UIButton) {
        dotIsSet = true
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

