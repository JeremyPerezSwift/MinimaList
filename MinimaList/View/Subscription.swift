//
//  Subscription.swift
//  MinimaList
//
//  Created by Jérémy Perez on 13/01/2022.
//

import SwiftUI
import StoreKit

struct Subscription: View {
    @StateObject var storeManager = InAppExtension()
    
    var body: some View {
        ZStack {
            VStack {
                ScrollView {
                    HStack {
                        Text("Go Premium")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                    }
                    
                    VStack {
                        HStack {
                            Image(systemName: "checkmark")
                                .font(.body)
                            
                            Text("All color themes")
                                .font(.body)
                            
                            Spacer(minLength: 0)
                        }
                        
                        HStack {
                            Image(systemName: "checkmark")
                                .font(.body)
                            
                            Text("All icon themes")
                                .font(.body)
                            
                            Spacer(minLength: 0)
                        }
                        .padding(.top)
                        
                        HStack {
                            Image(systemName: "checkmark")
                                .font(.body)
                            
                            Text("Create more than 5 lists")
                                .font(.body)
                            
                            Spacer(minLength: 0)
                        }
                        .padding(.top)
                        
                        HStack {
                            Image(systemName: "checkmark")
                                .font(.body)
                            
                            Text("Data transfert with iCloud")
                                .font(.body)
                            
                            Spacer(minLength: 0)
                        }
                        .padding(.top)
                    }
                    .padding(.vertical)
                    
                    if storeManager.skProducts.count == 2 {
                        
                        HStack {
                            Button {
                                let current = storeManager.subscribePerMonth
                                
                                let payment = SKPayment(product: current)
                                SKPaymentQueue.default().add(payment)
                            } label: {
                                VStack {
                                    Text(storeManager.subscribePerMonth.localizedTitle)
                                        .font(.body)
                                        .bold()
                                        .padding(.top, 10)
                                        .padding(.bottom, 1)
                                    
                                    Text("\(storeManager.getPriceLocal(sKProduct: storeManager.subscribePerMonth)) / month")
                                        .font(.body)
                                        .padding(.bottom, 10)
        //                                .padding(.top, 1)
                                }
                                .frame(width: UIScreen.main.bounds.width / 1.1)
                                .neumorphicEffect(fillColor: Color("MercuryList"), cornerRdius: 10)
                                .padding(.vertical)
                            }

                        }
                        
                        
                        HStack {
                            Button {
                                let current = storeManager.subscribePerAnnualy
                                
                                let payment = SKPayment(product: current)
                                SKPaymentQueue.default().add(payment)
                            } label: {
                                VStack {
                                    Text(storeManager.subscribePerAnnualy.localizedTitle)
                                        .font(.body)
                                        .bold()
                                        .padding(.top, 10)
                                        .padding(.bottom, 1)
                                    
                                    Text("\(storeManager.getPriceLocal(sKProduct: storeManager.subscribePerAnnualy)) / year")
                                        .font(.body)
                                        .padding(.bottom, 10)
        //                                .padding(.top, 1)
                                }
                                .frame(width: UIScreen.main.bounds.width / 1.1)
                                .neumorphicEffect(fillColor: Color("BlackList"), cornerRdius: 10)
                                .padding(.vertical)
                                .foregroundColor(.white)
                            }

                        }
                        
                    }
                    
                }
            }
            .padding()
            .background(Color("MercuryList"))
        }
        .onAppear {
            storeManager.getList()
        }
    }
}

struct Subscription_Previews: PreviewProvider {
    static var previews: some View {
        Subscription()
    }
}
