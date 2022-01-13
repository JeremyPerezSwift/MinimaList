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

    func getList() {
//        SKPaymentQueue.default().add(self)

        let productRequest = SKProductsRequest(productIdentifiers: IN_APP_LIST)
//        self.request = productRequest
        productRequest.delegate = self
        productRequest.start()
        print("DEBUG: skProducts 0")
    }

    func productsRequest(_ request: SKProductsRequest, didReceive response: SKProductsResponse) {
//        self.products = response.products.sorted(by: { $0.localizedTitle > $1.localizedTitle })
        print("DEBUG: skProducts")
        DispatchQueue.main.async {
            self.skProducts = response.products
            print("DEBUG: skProducts \(self.skProducts[0].productIdentifier)")
        }
        
        for invalidIdentifier in response.invalidProductIdentifiers {
            print("DEBUG: skProducts invalidIdentifier \(invalidIdentifier)")
        }

    }
    
    func request(_ request: SKRequest, didFailWithError error: Error) {
        print("DEBUG: skProducts error \(error)")
    }
    
}
