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
    
    static let instance  = purchaseManager()
    
}
