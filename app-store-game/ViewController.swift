//
//  ViewController.swift
//  app-store-game
//
//  Created by ori mizrachi on 12/4/15.
//  Copyright © 2015 B-Up!. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // timer stuff
    var astroTimer : NSTimer!
    var astroCounter : Double = 0
    var normalTimer : NSTimer!
    var TimerCounter = 0


    @IBOutlet weak var lblHp: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //timer
        astroTimer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: "asteroTimer", userInfo: nil, repeats: true)
        normalTimer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: "Timer", userInfo: nil, repeats: true)

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
    }//viewdidload
    
    func Timer()
    {
        TimerCounter++
        lblHp.text = "\(TimerCounter)"
    }//Timer
    
    //timer function
    func asteroTimer()
    {
        astroCounter+=1.7

                var frame : CGRect = CGRectMake(133, 30, 95, 95)
                if self.view.viewWithTag(1)?.frame.origin.x == 3
                {
                    frame = CGRectMake(1, -90, 95, 95)
                }//else if
        
                else if self.view.viewWithTag(1)?.frame.origin.x == 133
                {
                    frame = CGRectMake(123, -90, 95, 95)
                }//else if
                    
                else if self.view.viewWithTag(1)?.frame.origin.x == 263
                {
                    frame = CGRectMake(230, -90, 95, 95)
                }//else if
        
                let ivAstro : UIImageView = UIImageView(frame: frame)
                ivAstro.image = UIImage(named: "aestroid_brown")
                ivAstro.tag = 10
                self.view.addSubview(ivAstro)
                UIView.animateWithDuration(2.0, animations: {ivAstro.frame.origin.y = 600})
    }//asteroTimer
    
    //swipe function
    func handleSwipes(sender: UISwipeGestureRecognizer) {
        if (sender.direction == .Left)
        {
            UIView.animateWithDuration(0.5, animations: {self.view.viewWithTag(1)?.frame = CGRectMake((self.view.viewWithTag(1)?.frame.origin.x)! - 130, (self.view.viewWithTag(1)?.frame.origin.y)!, (self.view.viewWithTag(1)?.frame.size.width)!, (self.view.viewWithTag(1)?.frame.size.height)!)})
        }//if left
        
        if (sender.direction == .Right)
        {
            UIView.animateWithDuration(0.5, animations: {self.view.viewWithTag(1)?.frame = CGRectMake((self.view.viewWithTag(1)?.frame.origin.x)! + 130, (self.view.viewWithTag(1)?.frame.origin.y)!, (self.view.viewWithTag(1)?.frame.size.width)!, (self.view.viewWithTag(1)?.frame.size.height)!)})
        }//if right
    }//handleswipes
}//class

