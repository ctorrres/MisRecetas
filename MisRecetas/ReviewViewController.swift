//
//  ReviewViewController.swift
//  MisRecetas
//
//  Created by Usuario on 03/07/17.
//  Copyright © 2017 Rafael Torres. All rights reserved.
//

import UIKit

class ReviewViewController: UIViewController {
    
    
    @IBOutlet var backgraundImageView: UIImageView!
    
    @IBOutlet var ratingStackView: UIStackView!
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        let blurEffect = UIBlurEffect(style: .dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        backgraundImageView.addSubview(blurEffectView)
        
        ratingStackView.transform = CGAffineTransform(scaleX: 0.0, y: 0.0)
 
        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        UIView.animate(withDuration: 0.5, delay: 0.0, options: [], animations: {
            self.ratingStackView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        }, completion: nil)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func ratingSelected(_ sender: Any) {
    }
    
    
    
}
