//
//  PurchaseManager.swift
//  daily-dose
//
//  Created by Stephen Reyes on 7/29/18.
//  Copyright © 2018 Stephen Reyes. All rights reserved.
//

import Foundation
import StoreKit


typealias CompletionHandler = (_ success: Bool) -> ()

class PurchaseManager: NSObject, SKProductsRequestDelegate, SKPaymentTransactionObserver {
    
    let IAP_REMOVE_ADS = "com.email.daily.dose.remove.ads"
    
    static let instance  = purchaseManager()
    
    var productsRequest: SKProductsRequest!
    var products = [SKProduct]()
    var transactionComplete: CompletionHandler?
    
    // the itunes store will not be able to test your products if there is nothing to fetch them with... thus the function that follows exmplifies what is needed to work with a simple product request.
    
    func fetchProducts(){
        let productIDs = NSSet(object: IAP_REMOVE_ADS) as! Set<String>
        productsRequest = SKProductsRequest(productIdentifiers: productIDs)
        productsRequest.delegate = self
        productsRequest.start()
    }
    
    func purchaseRemoveAds(onComplete: @escaping CompletionHandler){
        if SKPaymentQueue.canMakePayments() && products.count > 0 {
            transactionComplete = onComplete
            let removeAdsProduct = products[0]
            let payment = SKPayment(product: removeAdsProduct)
            SKPaymentQueue.default().add(self)
            SKPaymentQueue.default().add(payment)
        } else {
            onComplete(false)
        }
    }
    
    func productsRequest(_ request: SKProductsRequest, didReceive response: SKProductsResponse) {
        if response.products.count > 0 {
            print(response.products.debugDescription)
            products = response.products
        }
    }
    
    func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
        for transation in transactions {
            switch transation.transactionState{
            case .purchased:
            SKPaymentQueue.default().finishTransaction(transation)
            if transation.payment.productIdentifier == IAP_REMOVE_ADS {
                UserDefaults.standard.set(true, forKey: IAP_REMOVE_ADS)
                transactionComplete?(true)
            }
                    break
            case .failed:
                SKPaymentQueue.default().finishTransaction(transation)
                 transactionComplete?(false)
                    break
            case .restored:
                SKPaymentQueue.default().finishTransaction(transation)
                 transactionComplete?(true)
            default:
                 transactionComplete?(false)
                break
                
            }
        }
    }
    
}
