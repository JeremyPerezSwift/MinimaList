//
//  ThemesIconesView2.swift
//  MinimaList
//
//  Created by Jérémy Perez on 12/01/2022.
//

import SwiftUI

struct ThemesIconesView2: View {
    @Environment(\.dismiss) var dismiss
    
    @ObservedObject var themeColor: ThemesColors
    var appIconServices = IconThemeViewModel()
    
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                
                HStack {
                    
                    Text("Icons")
                        .font(.title)
                        .bold()
                        .fixedSize(horizontal: false, vertical: true)
                        .lineLimit(2)
                        .padding(.horizontal)
                    
                    Spacer()
                    
                    
                    Button(action: {
                        dismiss()
                    }) {
                        Image(systemName: "xmark.circle")
                            .font(.title2)
                            .foregroundColor(themeColor.color)
                    }
                    .frame(width: 40, height: 40)
//                    .neumorphicEffect(fillColor: Color("RedList"), cornerRdius: 10)
                }
                .padding(.horizontal)
                .padding(.bottom)
                .padding(.top)
                
                HStack {
                    Image(systemName: "giftcard")
                        .font(.body)
                        .foregroundColor(themeColor.color)
                        .frame(width: 40, height: 40)
                        .neumorphicEffect(fillColor: Color("MercuryList"), cornerRdius: 10)
                    
                    Text("Themes gratuit")
                        .foregroundColor(.black)
                    
                    Spacer()
                    
                }
                .padding(.horizontal)
                .padding()
                
                
                LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 20), count: 3), spacing: 20) {
                    
                    Button(action: {
                        appIconServices.changeAppIcon(to: .black)
                    }) {
                        Image("blackwithoutbg")
                            .resizable()
                            .frame(width: 50, height: 50)
                    }
                    .cornerRadius(10)
                    .frame(width: 60, height: 60)
                    .foregroundColor(Color("MercuryList"))
                    .neumorphicEffect(fillColor: Color("MercuryList"), cornerRdius: 10)
                }
                .padding(.top)
                
                HStack {
                    
                    Image(systemName: "crown")
                        .font(.body)
                        .foregroundColor(themeColor.color)
                        .frame(width: 40, height: 40)
                        .neumorphicEffect(fillColor: Color("MercuryList"), cornerRdius: 10)
                    
                    Text("Themes premium")
                        .foregroundColor(.black)
                    
                    Spacer()
                    
                }
                .padding(.horizontal)
                .padding()
                .padding(.top, 30)
                
                
                LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 20), count: 3), spacing: 20) {
                    
                    Button(action: {
                        appIconServices.changeAppIcon(to: .salmon)
                    }) {
                        Button(action: {
                            appIconServices.changeAppIcon(to: .black)
                        }) {
                            Image("salmonwithoutbg")
                                .resizable()
                                .frame(width: 50, height: 50)
                        }
                        .cornerRadius(10)
                        .frame(width: 60, height: 60)
                        .foregroundColor(Color("MercuryList"))
                        .neumorphicEffect(fillColor: Color("MercuryList"), cornerRdius: 10)
                    }
                    
                    Button(action: {
                        appIconServices.changeAppIcon(to: .green)
                    }) {
                        Button(action: {
                            appIconServices.changeAppIcon(to: .black)
                        }) {
                            Image("greenwithoutbg")
                                .resizable()
                                .frame(width: 50, height: 50)
                        }
                        .cornerRadius(10)
                        .frame(width: 60, height: 60)
                        .foregroundColor(Color("MercuryList"))
                        .neumorphicEffect(fillColor: Color("MercuryList"), cornerRdius: 10)
                    }
                }
                .padding(.top)
                
                Spacer()
                
            }
        }
        .background(Color("MercuryList"))
    }
}

struct ThemesIconesView2_Previews: PreviewProvider {
    static var previews: some View {
        ThemesIconesView2(themeColor: ThemesColors())
    }
}
