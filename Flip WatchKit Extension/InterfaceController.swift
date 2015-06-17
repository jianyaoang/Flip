//
//  InterfaceController.swift
//  Flip WatchKit Extension
//
//  Created by VLT Labs on 6/16/15.
//  Copyright (c) 2015 Jay Ang. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    @IBOutlet weak var coinImage: WKInterfaceImage!
    @IBOutlet weak var headsOrTailsLabel: WKInterfaceLabel!
    @IBOutlet weak var flipButton: WKInterfaceButton!
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    @IBAction func onFlipButtonPressed() {
        
        self.headsOrTailsLabel.setText("Heads or Tails?")
        
        let imageRange = NSRange(location: 1, length: 11)
        
        self.coinImage.setImageNamed("frame")
        self.coinImage.startAnimatingWithImagesInRange(imageRange, duration: 0.5, repeatCount: 2)
        
        var flipCoinTimer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "flipCoinCompleted", userInfo: nil, repeats: false)
    }
    
    func flipCoinCompleted() {
        //either 0 or 1
        arc4random_uniform(2)
        
        if arc4random_uniform(2) == 0 {
            
            self.headsOrTailsLabel.setText("Heads")
            self.coinImage.setImageNamed("frame11")
            
        } else {
            
            self.headsOrTailsLabel.setText("Tails")
            self.coinImage.setImageNamed("frame7")
        }
    }
}
