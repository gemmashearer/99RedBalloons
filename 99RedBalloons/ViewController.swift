//
//  ViewController.swift
//  99RedBalloons
//
//  Created by Gemma Shearer on 02/06/2015.
//  Copyright (c) 2015 GemmaShearer. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var balloonImageView: UIImageView!
    @IBOutlet weak var numberLabel: UILabel!
    
    // this is the array - the array is called allBalloons and contains Balloon
    var allBalloons:[Balloon] = []
    // making currentIndex a global variable so it can be accessed later
    var currentIndex = 0

    
    //creating the global var for current index that will be used to get a random image view

    
    override func viewDidLoad() {
        
        // firstBalloon is what will show on the screen before the button is pressed
        var firstBalloon = Balloon()
        firstBalloon.number = 0
        firstBalloon.image = UIImage(named: "BerlinTVTower.jpg")
        
        self.balloonImageView.image = firstBalloon.image
        self.numberLabel.text = "\(firstBalloon.number) Balloons"
        
        
        //creating more instances of balloons -  I need to sort the random number function out
        
        var secondBalloon = Balloon()
        secondBalloon.number = 0
        secondBalloon.image = UIImage(named: "RedBalloon1.jpg")
        
        var thirdBalloon = Balloon()
        thirdBalloon.number = 0
        thirdBalloon.image = UIImage(named: "RedBalloon2.jpg")
        
        var fourthBalloon = Balloon()
        fourthBalloon.number = 0
        fourthBalloon.image = UIImage(named: "RedBalloon3.jpg")
        
        var fithBalloon = Balloon()
        fithBalloon.number = 0
        fithBalloon.image = UIImage(named: "RedBalloon4.jpg")
        
        //createBalloons is the function loops through 0 - 99 and gets a random balloon image
        self.createBalloons()
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func nextBalloonButtonPressed(sender: AnyObject) {
        
        //each time the button is pressed it will add 1 to the current index so that we move through the switch statement
        
        //this links balloon to the index of the array
        let balloon = allBalloons[currentIndex]
        numberLabel.text = "\(balloon.number) balloon"
        balloonImageView.image = balloon.image
        //this initiates the progression through the loop
        currentIndex += 1
        
    }
        func createBalloons () {
            //the for loop generates a random number and the switch statement shows differnt images. The image that displays depends on what the current index is
            for var balloonCount = 0; balloonCount <= 99; ++balloonCount {
                var balloon = Balloon()
                //makes the index the number property
                balloon.number = balloonCount
                let randomNumber = Int(arc4random_uniform(UInt32(4)))
                switch randomNumber {
                case 1:
                    balloon.image = UIImage(named: "RedBalloon1.jpg")
                case 2:
                    balloon.image = UIImage(named: "RedBalloon2.jpg")
                case 3:
                    balloon.image = UIImage(named: "RedBalloon3.jpg")
                default: balloon.image = UIImage(named: "RedBalloon4.jpg")
                }
                self.allBalloons.append(balloon)
            }
    }
}

//how could I have done this using a case statement? each display of the image would have needed to be a case and somehow have the random number attached to it
