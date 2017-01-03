//
//  ViewController.swift
//  ScrollViewApplication
//
//  Created by Prasanth Ramineni on 1/2/17.
//  Copyright © 2017 Prasanth Ramineni. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {

    /* UI Scroll View */
    @IBOutlet weak var scrollView: UIScrollView!
    /* Array for Images in ScrollView */
    var images = [UIImageView]()
    /* UI Image View */
    var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /* Add Right and Left Gesture Recognizers to swipe images outside UI Scroll View*/
        let right = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.handleSwipes(_:)))
        let left = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.handleSwipes(_:)))
        
        right.direction = .right
        left.direction = .left
        
        view.addGestureRecognizer(right)
        view.addGestureRecognizer(left)
        
        scrollView.delegate = self
    }
    
    /* Scroll View Width is only available after the View Appears on the Screen */
    override func viewDidAppear(_ animated: Bool) {
        
        var contentWidth: CGFloat = 0.0
        let scrollViewWidth: CGFloat = scrollView.frame.size.width
        
        //scrollView.backgroundColor = UIColor.darkGray
        for id in 0...2 {
            let image = UIImage(named: "icon\(id).png")
            imageView = UIImageView(image: image)
            images.append(imageView)
            
            var newX: CGFloat = 0.0
            
            newX = scrollViewWidth / 2 + scrollViewWidth * CGFloat(id)
            
            contentWidth += newX
            
            scrollView.addSubview(imageView) // Add ImageView as SubVuew
            
            imageView.frame = CGRect(x: newX - 75, y: (scrollView.frame.size.height / 2) - 75, width: 150, height: 150) // Set the Location of ImageView Inside Subview
        }
        
        scrollView.clipsToBounds = false // Shows the Next/Previous Image On the Edge of the Screen
        scrollView.contentSize = CGSize(width: contentWidth, height: view.frame.size.height) // Set the Content size of Scroll View
    }
    
    /* Function to Handle Left Swipe and Right Swipe outside ScrollView - Pending */
    func handleSwipes(_ sender: UISwipeGestureRecognizer) {
        if (sender.direction == .right) {
            print("Right")
        } else if (sender.direction == .left) {
            print("Left")
        }
    }
    
}

