//
//  Subscription.swift
//  MinimaList
//
//  Created by Jérémy Perez on 13/01/2022.
//

import SwiftUI

struct Subscription: View {
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
                    
                    HStack {
                        VStack {
                            Text("Subscribe")
                                .font(.body)
                                .bold()
                                .padding(.top, 10)
                                .padding(.bottom, 1)
                            
                            Text("1,25€ / month (15€ / year)")
                                .font(.body)
                                .padding(.bottom, 10)
//                                .padding(.top, 1)
                        }
                    }
                    .frame(width: UIScreen.main.bounds.width / 1.1)
                    .neumorphicEffect(fillColor: Color("MercuryList"), cornerRdius: 10)
                    .padding(.vertical)
                    
                    HStack {
                        VStack {
                            Text("Subscribe annualy")
                                .font(.body)
                                .bold()
                                .padding(.top, 10)
                                .padding(.bottom, 1)
                            
                            Text("11€ / year")
                                .font(.body)
                                .padding(.bottom, 10)
//                                .padding(.top, 1)
                        }
                    }
                    .frame(width: UIScreen.main.bounds.width / 1.1)
                    .neumorphicEffect(fillColor: Color("BlackList"), cornerRdius: 10)
                    .padding(.vertical)
                    .foregroundColor(.white)
                    
                }
            }
            .padding()
            .background(Color("MercuryList"))
        }
    }
}

struct Subscription_Previews: PreviewProvider {
    static var previews: some View {
        Subscription()
    }
}
