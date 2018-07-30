//
//  ViewController.swift
//  daily-dose
//
//  Created by Stephen Reyes on 7/25/18.
//  Copyright © 2018 Stephen Reyes. All rights reserved.
//

import UIKit
// this error will go away with a paid developer account 
import GoogleMobileAds




class ViewController: UIViewController {

    @IBOutlet weak var bannerView: GADBannerView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bannerView.adUnitID = "ca-app-pub-3940256099942544/2934735716"
        bannerView.rootViewController = self
        bannerView.load(GADRequest())
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

