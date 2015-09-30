//
//  MailboxViewController.swift
//  MailboxDemo
//
//  Created by Jason Fain on 9/29/15.
//  Copyright © 2015 Jason Fain. All rights reserved.
//

import UIKit

class MailboxViewController: UIViewController {

    @IBOutlet weak var mailNewViewController: UIView!
    
    @IBOutlet weak var mailScreenScrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mailScreenScrollView.contentSize = CGSize(width: 320, height: 1202)
        
          var panGestureRecognizer = UIPanGestureRecognizer(target: self, action: "onCustomPan:")
        
        
        // Attach it to a view of your choice. If it's a UIImageView, remember to enable user interaction
        view.addGestureRecognizer(panGestureRecognizer)
    }
        
        func onCustomPan(panGestureRecognizer: UIPanGestureRecognizer) {
            var point = panGestureRecognizer.locationInView(view)
            var velocity = panGestureRecognizer.velocityInView(view)
            
            if panGestureRecognizer.state == UIGestureRecognizerState.Began {
                print("Gesture began at: \(point)")
                
            } else if panGestureRecognizer.state == UIGestureRecognizerState.Changed {
                print("Gesture changed at: \(point)")
                
            } else if panGestureRecognizer.state == UIGestureRecognizerState.Ended {
                print("Gesture ended at: \(point)")
            }
        }

        
        // Do any additional setup after loading the view.
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
