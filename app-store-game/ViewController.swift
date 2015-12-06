//
//  ViewController.swift
//  app-store-game
//
//  Created by ori mizrachi on 12/4/15.
//  Copyright © 2015 B-Up!. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var astroTimer : NSTimer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //timer
        //astroTimer = NSTimer.scheduledTimerWithTimeInterval(2.5, target: self, selector: "asteroTimer", userInfo: nil, repeats: true)

        //swipes
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: Selector("handleSwipes:"))
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: Selector("handleSwipes:"))
        leftSwipe.direction = .Left
        rightSwipe.direction = .Right
        view.addGestureRecognizer(leftSwipe)
        view.addGestureRecognizer(rightSwipe)
        
        //create rocket
        let ivRocket : UIImageView = UIImageView(frame: CGRectMake(133, 465, 60, 80))
        ivRocket.image = UIImage(named: "purerocket")
        ivRocket.tag = 1
        self.view.addSubview(ivRocket)
    }
    
    func handleSwipes(sender: UISwipeGestureRecognizer) {
        
        if (sender.direction == .Left)
        {
            UIView.animateWithDuration(0.5, animations: {self.view.viewWithTag(1)?.frame = CGRectMake((self.view.viewWithTag(1)?.frame.origin.x)! - 130, (self.view.viewWithTag(1)?.frame.origin.y)!, (self.view.viewWithTag(1)?.frame.size.width)!, (self.view.viewWithTag(1)?.frame.size.height)!)})
        }
        
        if (sender.direction == .Right)
        {
            UIView.animateWithDuration(0.5, animations: {self.view.viewWithTag(1)?.frame = CGRectMake((self.view.viewWithTag(1)?.frame.origin.x)! + 130, (self.view.viewWithTag(1)?.frame.origin.y)!, (self.view.viewWithTag(1)?.frame.size.width)!, (self.view.viewWithTag(1)?.frame.size.height)!)})
        }
    }
}

