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
    
    //all my dices
    var dice : UInt32 = 0
    var dice_time : UInt32 = 0
    var dice_name_first : UInt32 = 0
    var dice_name_second : UInt32 = 0

    @IBOutlet weak var lblTimer: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //timers
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
        lblTimer.text = "\(TimerCounter)"
    }//Timer
    
    //timer function
    func asteroTimer()
    {
        astroCounter++
        //Name Of Main Astro
        var name_first_astro: String = ""
        dice_name_first = arc4random_uniform(4) + 1
        if dice_name_first == 1
        {
            name_first_astro = "aestroid_brown"
        }
        
        else if dice_name_first == 2
        {
            name_first_astro = "aestroid_dark"
        }
        
        else if dice_name_first == 3
        {
            name_first_astro = "aestroid_gray"
        }
        
        else if dice_name_first == 4
        {
            name_first_astro = "aestroid_gay_2"
        }
        // end of name of main astro
        
        //Name Of Second Astro
        var name_second_astro: String = ""
        dice_name_second = arc4random_uniform(4) + 1
        if dice_name_second == 1
        {
            name_second_astro = "aestroid_brown"
        }
            
        else if dice_name_second == 2
        {
            name_second_astro = "aestroid_dark"
        }
            
        else if dice_name_second == 3
        {
            name_second_astro = "aestroid_gray"
        }
            
        else if dice_name_second == 4
        {
            name_second_astro = "aestroid_gay_2"
        }
        // end of name of second astro
        
        //drop and create astros
        dice_time = arc4random_uniform(2) + 1
        if dice_time == 1
        {
            if astroCounter % 2 == 0
            {
                var frame_second : CGRect = CGRectMake(133, 30, 95, 95)
                dice = arc4random_uniform(3) + 1
            
                if dice == 1
                {
                    frame_second = CGRectMake(1, -90, 95, 95)
                }//if
            
                else if dice == 2
                {
                    frame_second = CGRectMake(123, -90, 95, 95)
                }//else if
            
                else if dice == 3
                {
                    frame_second = CGRectMake(230, -90, 95, 95)
                }//else if
            
                let iv_second_astro : UIImageView = UIImageView(frame: frame_second)
                iv_second_astro.image = UIImage(named: name_second_astro)
                iv_second_astro.tag = 11
                self.view.addSubview(iv_second_astro)
                UIView.animateWithDuration(2.0, animations: {iv_second_astro.frame.origin.y = 600})
            }//if
        }//if
        
        else if dice_time == 2
        {
            if astroCounter % 3 == 0
            {
                var frame_second : CGRect = CGRectMake(133, 30, 95, 95)
                dice = arc4random_uniform(3) + 1
                
                if dice == 1
                {
                    frame_second = CGRectMake(1, -90, 95, 95)
                }//if
                    
                else if dice == 2
                {
                    frame_second = CGRectMake(123, -90, 95, 95)
                }//else if
                    
                else if dice == 3
                {
                    frame_second = CGRectMake(230, -90, 95, 95)
                }//else if
                
                let iv_second_astro : UIImageView = UIImageView(frame: frame_second)
                iv_second_astro.image = UIImage(named: name_second_astro)
                iv_second_astro.tag = 11
                self.view.addSubview(iv_second_astro)
                UIView.animateWithDuration(2.0, animations: {iv_second_astro.frame.origin.y = 600})
            }//if
        }//else if
        
        var frame : CGRect = CGRectMake(133, 30, 95, 95)
        if self.view.viewWithTag(1)?.frame.origin.x == 3
        {
            frame = CGRectMake(1, -90, 95, 95)
        }//if
        
        else if self.view.viewWithTag(1)?.frame.origin.x == 133
        {
            frame = CGRectMake(123, -90, 95, 95)
        }//else if
                
        else if self.view.viewWithTag(1)?.frame.origin.x == 263
        {
            frame = CGRectMake(230, -90, 95, 95)
        }//else if
        
        let ivAstro : UIImageView = UIImageView(frame: frame)
        ivAstro.image = UIImage(named: name_first_astro)
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

