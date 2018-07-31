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

    
    // outlets
    @IBOutlet weak var removeAdsBtn: UIButton!
    @IBOutlet weak var bannerView: GADBannerView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if UserDefaults.standard.bool(forKey: PurchaseManager.instance.IAP_REMOVE_ADS) {
            
        removeAdsBtn.removeFromSuperview()
        bannerView.removeFromSuperView()
            
        } else {
            bannerView.adUnitID = "ca-app-pub-3940256099942544/2934735716"
            bannerView.rootViewController = self
            bannerView.load(GADRequest())

        }
    }
    
    //actions
    
    @IBAction func removeAdsPressed(_ sender: Any) {
    //show an activity spinner
        PurchaseManager.instance.purchaseRemoveAds {
            success in
    // remove spinner
            if success  {
                self.bannerView.removeFromSuperView()
                self.removeAdsBtn.removeFromSuperview()
            } else {
                //show message to the user on while failure occured.
             }
           }
        }
    }


