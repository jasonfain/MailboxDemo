//
//  MailboxViewController.swift
//  MailboxDemo
//
//  Created by Jason Fain on 9/29/15.
//  Copyright © 2015 Jason Fain. All rights reserved.
//

import UIKit

class MailboxViewController: UIViewController, UIGestureRecognizerDelegate {
    
    @IBOutlet weak var mailAllView: UIView!
    
    @IBOutlet weak var mailNewImageView: UIImageView!
    
    @IBOutlet weak var mailScreenScrollView: UIScrollView!
    
    
    @IBOutlet weak var archiveImageView: UIImageView!
    @IBOutlet weak var deleteImageView: UIImageView!
    @IBOutlet weak var listImageView: UIImageView!
    @IBOutlet weak var laterImageView: UIImageView!
    
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
        
        //   let velocity = sender.velocityInView(view)
        // NSLog("location: \(location.x):\(location.y)")
        //  NSLog("translation: \(translation.x):\(translation.y)")
        
        
        
        if sender.state == UIGestureRecognizerState.Began {
            originalPosition = mailNewImageView.center
            if translation.x > 0 {
                listImageView.alpha = 0
                deleteImageView.alpha = 1
                laterImageView.alpha = 0
                archiveImageView.alpha = 1
                
            } else if translation.x < 0 {
                
                laterImageView.alpha = 1
                archiveImageView.alpha = 0
                listImageView.alpha = 1
                deleteImageView.alpha = 0
            }
            print("started")
            
            
            
            
        } else if sender.state == UIGestureRecognizerState.Changed {
            print("moving")
            
            if translation.x > 260 {
                deleteImageView.center.x = translation.x - deleteImageView.bounds.width/2
                deleteImageView.alpha = 1
                mailAllView.backgroundColor = UIColor.redColor()
                archiveImageView.alpha = 0
                
            }
                
            else if translation.x > 60 {
//     archiveImageView.center.x =originalPosition.x + translation.x - 80
                
            archiveImageView.center.x = translation.x - archiveImageView.bounds.width/2
                archiveImageView.alpha = 1
                deleteImageView.alpha = 0
        
                mailAllView.backgroundColor = UIColor.greenColor()
                
            } else if translation.x < -260 {
                
                listImageView.center.x = translation.x + listImageView.bounds.width/2 +
                    // self.view.bounds.width
                320
                listImageView.alpha = 1
                laterImageView.alpha = 0
                mailAllView.backgroundColor = UIColor.brownColor()
                

            
            } else if translation.x < -60 {
                    
                laterImageView.center.x = translation.x + laterImageView.bounds.width/2 +
                    // self.view.bounds.width
                 320
                    laterImageView.alpha = 1
                listImageView.alpha = 0
                mailAllView.backgroundColor = UIColor.yellowColor()
                
            }
            
            mailNewImageView.center.x = originalPosition.x + translation.x
            
            // mailNewImageView.center.y = originalPosition.y + translation.y
            
            
        } else if sender.state == UIGestureRecognizerState.Ended {
            print("ended")
            
            UIView.animateWithDuration(1, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: [], animations: { () -> Void in
                // animate code
                
                self.mailNewImageView.center.x = 160
                
                self.mailAllView.backgroundColor = UIColor.lightGrayColor()
                
                
                
                
                }, completion: { (completed) -> Void in
                    //complete
                    
                    self.listImageView.alpha = 1
                    self.deleteImageView.alpha = 1
                    self.laterImageView.alpha = 1
                    self.archiveImageView.alpha = 1
                    
                    self.mailAllView.backgroundColor = UIColor.lightGrayColor()
                    
                    
            })
            
            
           
                
            }
            
            
            
        }
    }
    
    //  @IBAction func onTap(sender: UITapGestureRecognizer) {
    //    print("tapped")



