//
//  SecondViewController.swift
//  Mar15_AllAboutTests
//
//  Created by Consultant on 3/15/22.
//

import Foundation
import UIKit

class SecondViewController: UIViewController {
    
    
    @IBOutlet weak var ResultLabel: UILabel!
    @IBOutlet weak var FibTextField: UITextField!
    @IBOutlet weak var CalculateFibButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    var userInput:String {
        return (FibTextField.text)!
    }
    
    var fibNum:Int {
        return Int(userInput)!
    }
    
    @IBAction func calculateFibNum(_ sender: Any) {
        guard fibNum > 0 else { return }
        var fibN = [0, 1]
        
        for i in 2...fibNum {
            fibN.append(i)
            fibN[i] = fibN[i - 1] + fibN[i - 2]
        }
        
        ResultLabel.text = "\(fibN)"
    }
}
