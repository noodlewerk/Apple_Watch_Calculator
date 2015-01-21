//
//  InterfaceController.swift
//  Calc WatchKit Extension
//
//  Created by Jonas Treub on 01/12/14.
//  Copyright (c) 2014 Noodlewerk. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController
{
    var currentValue: String = "0"
    var command: Command?
    var calculationExecuted = false
    
    @IBOutlet weak var displayLabel: WKInterfaceLabel!
    
    
    
    func numberPressed(value: Int)
    {
        let newValue = "\(value)"
        
        if currentValue == "0" || calculationExecuted
        {
            calculationExecuted = false
            currentValue = newValue
        }
        else
        {
            currentValue += newValue
        }
        
        displayLabel.setText(currentValue)
    }
    
    func setDisplayValue(value: Double)
    {
        if value % 1 == 0
        {
            // our value is an integer
            currentValue = "\(Int(value))"
        }
        else
        {
            // our value is a float
            currentValue = "\(value)"
        }
        
        displayLabel.setText(currentValue)
    }
    
    func commandTapped(type: CommandType)
    {
        calculationExecuted = false
        if command != nil
        {
            command!.type = type
        }
        else
        {
            command = Command(type: type, leftValue: (currentValue as NSString).doubleValue)
            currentValue = "0"
        }
    }
    
    @IBAction func answerTapped()
    {
        if command != nil
        {
            let answer = command!.executeWithNewValue((currentValue as NSString).doubleValue)
            setDisplayValue(answer)
            command = nil
            calculationExecuted = true
        }
    }
    
    
    @IBAction func clearTapped()
    {
        command = nil
        currentValue = "0"
        displayLabel.setText(currentValue)
    }
    
    @IBAction func decimalTapped()
    {
        if currentValue.rangeOfString(".") == nil
        {
            currentValue += "."
            displayLabel.setText(currentValue)
        }
    }
    
    //MARK: number buttons
    
    @IBAction func button0tapped()
    {
        numberPressed(0)
    }
    
    @IBAction func button1Tapped()
    {
        numberPressed(1)
    }
    
    @IBAction func button2Tapped()
    {
        numberPressed(2)
    }
    
    @IBAction func button3Tapped()
    {
        numberPressed(3)
    }
    
    @IBAction func button4Tapped()
    {
        numberPressed(4)
    }
    
    @IBAction func button5Tapped()
    {
        numberPressed(5)
    }
    
    @IBAction func button6Tapped()
    {
        numberPressed(6)
    }
    
    @IBAction func button7Tapped()
    {
        numberPressed(7)
    }
    
    @IBAction func button8Tapped()
    {
        numberPressed(8)
    }
    
    @IBAction func button9Tapped()
    {
        numberPressed(9)
    }
    
    //MARK: command buttons
    
    @IBAction func addTapped()
    {
        commandTapped(.Add)
    }
    
    @IBAction func subtractTapped()
    {
        commandTapped(.Subtract)
    }
    
    @IBAction func multiplyTapped()
    {
        commandTapped(.Multiply)
    }
    
    @IBAction func divideTapped()
    {
        commandTapped(.Divide)
    }
    
}
