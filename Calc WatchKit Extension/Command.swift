//
//  Command.swift
//  Calc
//
//  Created by Jonas Treub on 10/12/14.
//  Copyright (c) 2014 Noodlewerk. All rights reserved.
//

import UIKit

enum CommandType
{
    case Divide
    case Multiply
    case Subtract
    case Add
}

class Command: NSObject
{
    var type: CommandType
    let leftValue: Double
    
    init(type: CommandType, leftValue: Double)
    {
        self.type = type
        self.leftValue = leftValue
        super.init()
    }
    
    func executeWithNewValue(newValue: Double) -> Double
    {
        var result = leftValue
        
        switch type
        {
        case .Divide: result /= newValue
        case .Multiply: result *= newValue
        case .Subtract: result -= newValue
        case .Add: result += newValue
        }
        
        return result
    }
}
