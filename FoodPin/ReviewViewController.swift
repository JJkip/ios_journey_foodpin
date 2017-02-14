//
//  ReviewViewController.swift
//  FoodPin
//
//  Created by Joseph Langat on 14/02/2017.
//  Copyright © 2017 mobidev. All rights reserved.
//

import UIKit

class ReviewViewController: UIViewController {
    
    @IBOutlet var backgroundImageView: UIImageView!
    @IBOutlet var containerView: UIView!
    @IBOutlet var restaurantImageView: UIImageView!
    @IBOutlet var closeButton: UIButton!
    
    var restaurant:Restaurant?
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        backgroundImageView.addSubview(blurEffectView)
        
        
        //Zoom Animation Starting Point
//        containerView.transform = CGAffineTransform.init(scaleX: 0, y: 0)
        
        //Slide-Down Animation Starting Point
//        containerView.transform = CGAffineTransform.init(translationX: 0, y: -1000)
        
        //Combining Slide-Down Animation With Zoom Animation
        let scaleTransform = CGAffineTransform.init(scaleX: 0, y: 0)
        let translateTransform = CGAffineTransform.init(translationX: 0, y: -1000)
        let combineTransform = scaleTransform.concatenating(translateTransform)
        
        containerView.transform = combineTransform
        closeButton.transform = CGAffineTransform.init(translationX: 1000, y: 0)
        
        if let restaurant = restaurant { restaurantImageView.image = UIImage(named: restaurant.image)
        }
        
    }
    override func viewDidAppear(_ animated: Bool) {
        
        //Zoom Animation & Slide-Down
        UIView.animate(withDuration: 0.3, animations: {
            self.containerView.transform = CGAffineTransform.identity
        })
        
        //Spring Animation
//        UIView.animate(withDuration: 0.4, delay: 0.0, usingSpringWithDamping: 0.3, initialSpringVelocity: 0.2, options: .curveEaseInOut, animations: {
//            self.containerView.transform = CGAffineTransform.identity
//            
//        }, completion: nil)
        
        UIView.animate(withDuration: 0.5, delay: 0.5, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.3, options: .curveEaseInOut, animations: {
            
            self.closeButton.transform = CGAffineTransform.identity
            
        }, completion: nil)

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
