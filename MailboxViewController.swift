//
//  MailboxViewController.swift
//  MailboxDemo
//
//  Created by Jason Fain on 9/29/15.
//  Copyright © 2015 Jason Fain. All rights reserved.
//

import UIKit

class MailboxViewController: UIViewController, UIGestureRecognizerDelegate {
    
    
    @IBOutlet weak var mailNewImageView: UIImageView!
    
    @IBOutlet weak var mailScreenScrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mailScreenScrollView.contentSize = CGSize(width: 320, height: 1435)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    var originalPosition: CGPoint!
    
    @IBAction func onPan(sender: UIPanGestureRecognizer) {
        sender.locationInView(view)
        
        let location = sender.locationInView(view)
        let translation = sender.translationInView(view)
        let velocity = sender.velocityInView(view)
        
        // NSLog("location: \(location.x):\(location.y)")
        //  NSLog("translation: \(translation.x):\(translation.y)")
        
        if sender.state == UIGestureRecognizerState.Began {
            print("started")
            originalPosition = mailNewImageView.center
        } else if sender.state == UIGestureRecognizerState.Changed {
            print("moving")
            mailNewImageView.center.x = originalPosition.x + translation.x
          //  mailNewImageView.center.y = originalPosition.y + translation.y
        } else if sender.state == UIGestureRecognizerState.Ended {
            print("ended")
            
            UIView.animateWithDuration(1, delay: 0, usingSpringWithDamping: 0.1, initialSpringVelocity: 0, options: [], animations: { () -> Void in
                self.mailNewImageView.transform = CGAffineTransformMakeScale(1,1)
                if velocity.x > 0 {
                    self.mailNewImageView.center.x = 210
                } else {
                    self.mailNewImageView.center.x = 100
                }
                }, completion: { (completed) -> Void in
            })
            
            //  @IBAction func onTap(sender: UITapGestureRecognizer) {
            //    print("tapped")
        }
    }
}
