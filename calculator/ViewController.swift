//
//  ViewController.swift
//  calculator
//
//  Created by Kimiko Motoyama on 2017/03/04.
//  Copyright © 2017 Kimiko Motoyama. All rights reserved.
//

import UIKit

enum Operator {
    case undefined
    case addition
    case subtraction
    case multiplication
    case division
}

class ViewController: UIViewController {
    var firstValue = 0
    var secondValue = 0
    var currentOperator = Operator.undefined
    
    @IBOutlet weak var label: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func numberButtonTapped(_ sender: UIButton) {
        let value = Int(sender.currentTitle!)!
        if currentOperator == .undefined {
            firstValue = firstValue * 10 + value
            label.text = "\(firstValue)"
        } else {
            secondValue = secondValue * 10 + value
            label.text = "\(secondValue)"
        }
    }

    @IBAction func operatorButtonTapped(_ sender: UIButton) {
        switch sender.currentTitle! {
            case "+":
                currentOperator = .addition
            case "-":
                currentOperator = .subtraction
            case "÷":
                currentOperator = .division
            case "x":
                currentOperator = .multiplication
            default:
                currentOperator = .undefined
        }
    }
    
    @IBAction func equalButtonTapped(_ sender: UIButton) {
        var total = 0
        switch currentOperator {
        case .addition:
            total = firstValue + secondValue
        case .subtraction:
            total = firstValue - secondValue
        case .multiplication:
            total = firstValue * secondValue
        case .division:
            total = firstValue / secondValue
        case .undefined:
            total = firstValue
        }
        label.text = "\(total)"
        firstValue = 0
        secondValue = 0
        currentOperator = .undefined
    }
    
    @IBAction func allClearbuttonTapped(_ sender: UIButton) {
        firstValue = 0
        secondValue = 0
        currentOperator = .undefined
        label.text = "0"
    }
}

