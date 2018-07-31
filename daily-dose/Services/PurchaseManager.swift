//
//  PurchaseManager.swift
//  daily-dose
//
//  Created by Stephen Reyes on 7/29/18.
//  Copyright © 2018 Stephen Reyes. All rights reserved.
//

import Foundation
import StoreKit

class PurchaseManager: NSObject, SKProductsRequestDelegate, SKPaymentTransactionObserver {
    
    let IAP_REMOVE_ADS = "com.email.daily.dose.remove.ads"
    
    static let instance  = purchaseManager()
    
    var productsRequest: SKProductsRequest!
    var products = [SKProduct]()
    
    // the itunes store will not be able to test your products if there is nothing to fetch them with... thus the function that follows exmplifies what is needed to work with a simple product request.
    func fetchProducts(){
        let productIDs = NSSet(object: IAP_REMOVE_ADS) as! Set<String>
        productsRequest = SKProductsRequest(productIdentifiers: productIDs)
        productsRequest.delegate = self
        productsRequest.start()
    }
    
    func productsRequest(_ request: SKProductsRequest, didReceive response: SKProductsResponse) {
        if response.products.count > 0 {
            print(response.products.debugDescription)
            products = response.products
        }
    }
    
    func paymentQueue(_ queue: SKPaymentQueue, shouldAddStorePayment payment: SKPayment, for product: SKProduct) -> Bool {
        <#code#>
    }
    
}
