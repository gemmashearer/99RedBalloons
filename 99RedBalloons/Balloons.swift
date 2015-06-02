//
//  Balloons.swift
//  99RedBalloons
//
//  Created by Gemma Shearer on 02/06/2015.
//  Copyright (c) 2015 GemmaShearer. All rights reserved.
//

import Foundation
import UIKit

//these are the properties that need to be displayed

struct Balloon {
    var number = 0
    var image = UIImage(named: "")
    
// function to generate a random number
    
    func balloonNumber() -> Int{
    let randomNumber = Int(arc4random_uniform(UInt32(99)))
    return randomNumber
    }
}

//how the hell am I going to randomise what image gets displayed??????