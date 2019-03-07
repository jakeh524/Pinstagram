//
//  ViewController.swift
//  PInstagram
//
//  Created by Jake Herron on 2/27/19.
//  Copyright © 2019 Jake Herron. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    var postView = PostView()
    
    var swipeLeftRecognizer = UISwipeGestureRecognizer()
    var swipeRightRecognizer = UISwipeGestureRecognizer()
    var swipeUpRecognizer = UISwipeGestureRecognizer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(postView)
        postView.addGestureRecognizer(swipeLeftRecognizer)
        postView.addGestureRecognizer(swipeRightRecognizer)
        view.addGestureRecognizer(swipeUpRecognizer)
        
        swipeLeftRecognizer.direction = .left
        swipeRightRecognizer.direction = .right
        swipeUpRecognizer.direction = .up
        
        swipeLeftRecognizer.addTarget(self, action: #selector(handleLeft))
        swipeRightRecognizer.addTarget(self, action: #selector(handleRight))
        swipeUpRecognizer.addTarget(self, action: #selector(handleUp))
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        let padding:CGFloat = 20
        postView.frame.origin.x = padding
        postView.frame.origin.y = padding + view.safeAreaInsets.top
        postView.frame.size.width = view.frame.width - padding * 2
        postView.frame.size.height = view.frame.height - padding * 2 - view.safeAreaInsets.top - view.safeAreaInsets.bottom
    }
    
    @objc func handleLeft(recognizer: UIGestureRecognizer) {
        let oldFrame = postView.frame
        
        swipeLeftRecognizer.isEnabled = false
        swipeRightRecognizer.isEnabled = false
        
        UIView.animate(withDuration: 0.35, delay: 0.0, options: .curveEaseOut, animations: {
            self.postView.frame.origin.x = -self.postView.frame.width - 30
        }) { (_) in
            self.postView.frame = oldFrame
            self.postView.alpha = 0
            UIView.animate(withDuration: 0.25, delay: 0, options: .curveEaseInOut, animations: {
                self.postView.alpha = 1
            }, completion: { (_) in
                self.swipeLeftRecognizer.isEnabled = true
                self.swipeRightRecognizer.isEnabled = true
            })
        }
    }
    
    @objc func handleRight(recognizer: UIGestureRecognizer) {
        let oldFrame = postView.frame
        
        swipeLeftRecognizer.isEnabled = false
        swipeRightRecognizer.isEnabled = false
        
        UIView.animate(withDuration: 0.35, delay: 0.0, options: .curveEaseOut, animations: {
            self.postView.frame.origin.x = self.view.frame.width + 30
        }) { (_) in
            self.postView.frame = oldFrame
            self.postView.alpha = 0
            UIView.animate(withDuration: 0.25, delay: 0, options: .curveEaseInOut, animations: {
                self.postView.alpha = 1
            }, completion: { (_) in
                self.swipeLeftRecognizer.isEnabled = true
                self.swipeRightRecognizer.isEnabled = true
            })
        }
    }
    
    @objc func handleUp(recognizer: UIGestureRecognizer) {
        present(ProfileTableViewController(), animated: true, completion: nil)
    }


}

