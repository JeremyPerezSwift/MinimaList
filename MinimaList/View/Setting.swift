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
    @State var isShowPopUpThemeIcons = false
    
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
                            
                            Text("Premium service")
                            
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
                                
                                Text("Theme colors")
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
                                isShowPopUpThemeIcons.toggle()
                            }) {
                                Image(systemName: "square")
                                    .font(.body)
                                    .foregroundColor(.black)
                                    .frame(width: 45, height: 45)
                                
                                Text("App icon")
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
                                
                                Text("Share MinimaList's link")
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
                                
                                Text("Update report")
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
                                
                                Text("Review on the AppStore")
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
                    
                    Text("Version 0.8.0")
                        .font(.system(size: 13))
                        .padding()
                        .foregroundColor(Color.gray)
                }
                
                
                
                Spacer()
                
            }
        }
        .background(Color("MercuryList"))
        .sheet(isPresented: $isShowPopUp) {
            
        } content: {
            ThemesView(themeColor: themeColor)
        }
        .sheet(isPresented: $isShowPopUpThemeIcons) {
            
        } content: {
//            ThemesIconesView().environmentObject(IconThemeViewModel())
            ThemesIconesView2(themeColor: themeColor)
        }

    
    }
}

struct Setting_Previews: PreviewProvider {
    static var previews: some View {
        Setting(themeColor: ThemesColors())
    }
}
