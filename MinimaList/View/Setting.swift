//
//  Setting.swift
//  MinimaList
//
//  Created by Jérémy Perez on 05/01/2022.
//

import SwiftUI

struct Setting: View {
    @ObservedObject var themeColor: ThemesColors
    
    @State var isShowPopUp = false
    
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                HStack {
                    HStack {
                        Text("Setting")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                        
                        Spacer(minLength: 0)
                    }
                    .foregroundColor(.black)
                    .padding(.top, 10)
                    .padding()
                    .padding(.horizontal, 10)
                    
                    Spacer()
                }
                
                ScrollView {
                    
                    HStack {
                        Button(action: {
                            
                        }) {
                            Image(systemName: "crown")
                                .font(.body)
                                .foregroundColor(.white)
                                .frame(width: 45, height: 45)
                                .padding()
                            
                            Spacer()
                            
                            Text("Service premium")
                            
                            Spacer()
                            Spacer()
                                
                        }
                        .frame(width: UIScreen.main.bounds.width / 1.1, height: 50)
                        .foregroundColor(.white)
                        .neumorphicEffect(fillColor: themeColor.color, cornerRdius: 10)
                        
                    }
                    .padding(.vertical)
                    
                    VStack {
                        HStack {
                            Button(action: {
                                isShowPopUp.toggle()
                            }) {
                                Image(systemName: "paintbrush")
                                    .font(.body)
                                    .foregroundColor(.black)
                                    .frame(width: 45, height: 45)
                                
                                Text("Couleur du thèmes")
                                    .font(.system(size: 15))
                                
                                Spacer()
                                
                                Image(systemName: "arrow.right")
                                    .font(.body)
                                    .foregroundColor(.black)
                                    .frame(width: 45, height: 45)
                                    .padding()
                                    
                            }
                            .frame(width: UIScreen.main.bounds.width / 1.1, height: 50)
                            .foregroundColor(.black)
                            
                        }
                        
                        Divider()
                            .padding(.horizontal)
                        
                        HStack {
                            Button(action: {
                                
                            }) {
                                Image(systemName: "square")
                                    .font(.body)
                                    .foregroundColor(.black)
                                    .frame(width: 45, height: 45)
                                
                                Text("Icône de l'application")
                                    .font(.system(size: 15))
                                
                                Spacer()
                                
                                Image(systemName: "arrow.right")
                                    .font(.body)
                                    .foregroundColor(.black)
                                    .frame(width: 45, height: 45)
                                    .padding()
                                    
                            }
                            .frame(width: UIScreen.main.bounds.width / 1.1, height: 50)
                            .foregroundColor(.black)
                            
                            
                            
                        }
                    }
                    .neumorphicEffect(fillColor: Color("MercuryList"), cornerRdius: 10)
//                    .padding(.vertical)
                    .padding()
                    .padding(.top, 0)
                    
                    VStack {
                        HStack {
                            Button(action: {
                                
                            }) {
                                Image(systemName: "paperplane")
                                    .font(.body)
                                    .foregroundColor(.black)
                                    .frame(width: 45, height: 45)
                                
                                Text("Partager le lien de MinimaList")
                                    .font(.system(size: 15))
                                
                                Spacer()
                                
                                Image(systemName: "arrow.right")
                                    .font(.body)
                                    .foregroundColor(.black)
                                    .frame(width: 45, height: 45)
                                    .padding()
                                    
                            }
                            .frame(width: UIScreen.main.bounds.width / 1.1, height: 50)
                            .foregroundColor(.black)
                            
                        }
                        
                        Divider()
                            .padding(.horizontal)
                        
                        HStack {
                            Button(action: {
                                
                            }) {
                                Image(systemName: "circle.hexagongrid")
                                    .font(.body)
                                    .foregroundColor(.black)
                                    .frame(width: 45, height: 45)
                                
                                Text("Rapport des bogues")
                                    .font(.system(size: 15))
                                
                                Spacer()
                                
                                Image(systemName: "arrow.right")
                                    .font(.body)
                                    .foregroundColor(.black)
                                    .frame(width: 45, height: 45)
                                    .padding()
                                    
                            }
                            .frame(width: UIScreen.main.bounds.width / 1.1, height: 50)
                            .foregroundColor(.black)
                            
                        }
                        
                        Divider()
                            .padding(.horizontal)
                        
                        HStack {
                            Button(action: {
                                
                            }) {
                                Image(systemName: "wand.and.stars")
                                    .font(.body)
                                    .foregroundColor(.black)
                                    .frame(width: 45, height: 45)
                                
                                Text("Revue su l'AppStore")
                                    .font(.system(size: 15))
                                
                                Spacer()
                                
                                Image(systemName: "arrow.right")
                                    .font(.body)
                                    .foregroundColor(.black)
                                    .frame(width: 45, height: 45)
                                    .padding()
                                    
                            }
                            .frame(width: UIScreen.main.bounds.width / 1.1, height: 50)
                            .foregroundColor(.black)
                            
                        }

                    }
                    .neumorphicEffect(fillColor: Color("MercuryList"), cornerRdius: 10)
//                    .padding(.vertical)
                    .padding()
                    .padding(.top, 0)
                }
                
                
                
                Spacer()
                
            }
        }
        .background(Color("MercuryList"))
        .sheet(isPresented: $isShowPopUp) {
            
        } content: {
            ThemesView(themeColor: themeColor)
        }
    
    }
}

struct Setting_Previews: PreviewProvider {
    static var previews: some View {
        Setting(themeColor: ThemesColors())
    }
}
