//
//  ViewController.swift
//  99RedBalloons
//
//  Created by Gemma Shearer on 02/06/2015.
//  Copyright (c) 2015 GemmaShearer. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //I need to append all of these to an array and then create a loop which will display a ran
    
    @IBOutlet weak var balloonImageView: UIImageView!
    @IBOutlet weak var numberLabel: UILabel!
    
    // this is the array
    var allBalloons:[Balloon] = []
    
    var currentIndex = 0

    
    //creating the global var for current index that will be used to get a random image view

    
    override func viewDidLoad() {
        
        // firstBalloon is what will show on the screen before the button is pressed
        var firstBalloon = Balloon()
        firstBalloon.number = 0
        firstBalloon.image = UIImage(named: "BerlinTVTower.jpg")
        
        //this code acually makes it show - it's now hard coded to show the berlin tower with no balloons when it loads. But nothing is randomised yet and I don't have an array yet.
        
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
        
        //appending all the balloons to the array
         allBalloons += [secondBalloon, thirdBalloon, fourthBalloon, fithBalloon]
        //I've not appended the berlin tv tower to the array, I may do later
        
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func nextBalloonButtonPressed(sender: AnyObject) {
        //generating a random image - this bit works I just now need to write a function that generates random number and assigns it to each image view
        //I AM SO SHOCKED THAT THIS WORKED!!!!!!!!!!!!
        var randomIndex:Int
        do {
            randomIndex = Int(arc4random_uniform(UInt32(allBalloons.count)))
        } while currentIndex == randomIndex
        
        currentIndex = randomIndex
        let selectedBalloon = allBalloons[randomIndex]
        
        UIView.transitionWithView(self.view, duration: 2, options: UIViewAnimationOptions.TransitionCrossDissolve, animations: {
            self.balloonImageView.image = selectedBalloon.image
            self.numberLabel.text = "\(selectedBalloon.balloonNumber()) balloons"
        
            }, completion: {(finished: Bool) -> () in
                
        })
        
    }
}

