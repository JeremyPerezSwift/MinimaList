//
//  InAppExtension.swift
//  MinimaList
//
//  Created by Jérémy Perez on 13/01/2022.
//

import SwiftUI
import StoreKit

class InAppExtension: NSObject, ObservableObject, SKProductsRequestDelegate {
    
    @Published var skProducts = [SKProduct]()
    var request = SKProductsRequest()
    
    @Published var subscribePerMonth = SKProduct()
    @Published var subscribePerAnnualy = SKProduct()

    func getList() {

        let productRequest = SKProductsRequest(productIdentifiers: IN_APP_LIST)
//        self.request = productRequest
        productRequest.delegate = self
        productRequest.start()
        print("DEBUG: skProducts 0")
    }
    
    func getTitleSubscribeMonth() {
        if skProducts.count == 2 {
            if skProducts[0].productIdentifier == "SubscripbePerMonth" {
                subscribePerMonth = skProducts[0]
            } else if skProducts[1].productIdentifier == "SubscripbePerMonth" {
                subscribePerMonth = skProducts[1]
            }
        } else {
            
        }
    }
    
    func getTitleSubscribeAnnualy() {
        if skProducts.count == 2 {
            if skProducts[0].productIdentifier == "SubscribePerAnnualy" {
                subscribePerAnnualy = skProducts[0]
            } else if skProducts[1].productIdentifier == "SubscribePerAnnualy" {
                subscribePerAnnualy = skProducts[1]
            }
        } else {
            
        }
    }
    
    func getPriceLocal(sKProduct: SKProduct) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currencyAccounting
        let pre = Locale.preferredLanguages[0]
        formatter.locale = Locale(identifier: pre)
//        formatter.locale = subscribePerAnnualy.priceLocale
        
        guard let stringPrice = formatter.string(from: sKProduct.price) else { return "" }
        
        print("DEBUG: stringPrice \(stringPrice) \(sKProduct.priceLocale) \(pre)")
        
        return stringPrice
    }

    func productsRequest(_ request: SKProductsRequest, didReceive response: SKProductsResponse) {
//        self.products = response.products.sorted(by: { $0.localizedTitle > $1.localizedTitle })
        print("DEBUG: skProducts")
        DispatchQueue.main.async {
            self.skProducts = response.products
            
            self.getTitleSubscribeMonth()
            self.getTitleSubscribeAnnualy()
        }
        
        for invalidIdentifier in response.invalidProductIdentifiers {
            print("DEBUG: skProducts invalidIdentifier \(invalidIdentifier)")
        }

    }
    
    func request(_ request: SKRequest, didFailWithError error: Error) {
        print("DEBUG: skProducts error \(error)")
    }
    
}

extension InAppExtension: SKPaymentTransactionObserver {
    
    func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
        for transaction in transactions {
            let state = transaction.transactionState
            
            switch state {
                
                case .purchasing:
                    print("DEBUG: Subscription paymentQueue purchasing InAppExtension")
                    break
                case .purchased:
                    print("DEBUG: Subscription paymentQueue Acheté InAppExtension")
                    SKPaymentQueue.default().finishTransaction(transaction)
                    
                    
                    break
                case .failed:
                    print("DEBUG: Subscription paymentQueue Failed InAppExtension")
                    break
                case .restored:
                print("DEBUG: Subscription paymentQueue restored InAppExtension")
                SKPaymentQueue.default().finishTransaction(transaction)
                    break
                case .deferred:
                    print("DEBUG: Subscription paymentQueue deferred")
                    break
                @unknown default:
                    print("DEBUG: Subscription paymentQueue Fattal Error")
                    break
            }
            
        }
    }
    
}
