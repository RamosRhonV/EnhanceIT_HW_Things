//
//  ViewController.swift
//  Feb18_SimpleCalculator
//
//  Created by Consultant on 2/18/22.
//

import UIKit

class ViewController: UIViewController {
    
    // the num shown before the calculation state
    var waitingNum = 0.0
    
    // the num shown after engaging calculation state
    var calcNum = 0.0
    
    // the num indicating type of calculation
    var calcOperation = 0
    
    // checks whether shown number already
    // has a decimal point
    var hasDecimal = false
    
    // boolean checks whether there is a calculation
    // occuring
    var isCalculating = false

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // function accepts Any
    @IBAction func numberButtons(_ sender: Any) {
        
        // holds the tag of the button pressed
        let senderTag = sender as AnyObject
        
        // ensures that the tag is not 19
        // 19 is the tag number of the decimal button
        if senderTag.tag != 19 {
            
            // checks if calculator is in the calculating state
            // this allows continuous calculation
            if isCalculating == true {
                
                // shows result of calculation
                showResult.text = String(senderTag.tag - 1)
                
                // number is now the number button pressed
                waitingNum = Double(showResult.text!)!
                
                // stops calculation state
                isCalculating = false
                
                // ensures next number will send digits
                // into the decimal places
                hasDecimal = false
            }
            
            // changes the shown number based on
            // number button pressed
            else {
                showResult.text = showResult.text! + String(senderTag.tag - 1)
                waitingNum = Double(showResult.text!)!
            }
        }
        
        // adds the decimal point to shown number
        // ensures that the decimal is only added once to a number
        if senderTag.tag == 19 && hasDecimal == false {
            showResult.text!.append(".")
            hasDecimal = true
        }
    }
    
    // function accepts Any
    @IBAction func calcButtons(_ sender: Any) {
        
        // holds the tag number of a button
        let senderTag = sender as AnyObject

        // checks whether the shown number is nil, the button pressed is not A/C, and the button pressed is not the equal sign
        if showResult.text != "" && senderTag.tag != 11 && senderTag.tag != 16 {
            
            // number the waiting number will be
            // calculated by
            calcNum = Double(showResult.text!)!
            
            // division
            if senderTag.tag == 12 {
                showResult.text = "/"
            }
            
            // multiplication
            if senderTag.tag == 13 {
                showResult.text = "x"
            }
            
            // subtraction
            if senderTag.tag == 14 {
                showResult.text = "-"
            }
            
            // addition
            if senderTag.tag == 15 {
                showResult.text = "+"
            }
            
            // changes number to positive or negative
            if senderTag.tag == 17 {
                calcNum *= -1
                showResult.text = String(calcNum)
            }
            
            // turns number into percent form
            if senderTag.tag == 18 {
                calcNum /= 100.0
                showResult.text = String(calcNum)
            }

            // holds the calculation tag number
            calcOperation = senderTag.tag
            
            // changes calculator state to calculating
            isCalculating = true
        }
        
        // checks if the equal button is pressed
        else if senderTag.tag == 16 {
            
            // division result
            if calcOperation == 12 {
                showResult.text = String(calcNum / waitingNum)
            }
            
            // multiplication result
            else if calcOperation == 13 {
                showResult.text = String(calcNum * waitingNum)
            }
            
            // subtraction result
            else if calcOperation == 14 {
                showResult.text = String(calcNum - waitingNum)
            }
            
            // addition result
            else if calcOperation == 15 {
                showResult.text = String(calcNum + waitingNum)
            }
            
            // result calculations inherently have decimal places
            // ensures that resulting numbers cannot have another decimal point
            hasDecimal = true
        }
        
        // checks if "all clear button is pressed
        // resets all values to default values
        // effectively restarts calculator
        else if senderTag.tag == 11 {
            showResult.text = "0"
            waitingNum = 0.0
            calcNum = 0.0
            calcOperation = 0
            hasDecimal = false
        }
    }
    
    // shows the number or resulting calculation
    @IBOutlet weak var showResult: UILabel!
}

