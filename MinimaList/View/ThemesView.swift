//
//  ThemesView.swift
//  MinimaList
//
//  Created by Jérémy Perez on 08/01/2022.
//

import SwiftUI

struct ThemesView: View {
    @Environment(\.dismiss) var dismiss
    
    @ObservedObject var themeColor: ThemesColors
    
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                
                HStack {
                    
                    Text("Thèmes")
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
                        themeColor.color = Color("BlackList")
                        themeColor.colorAlpha = Color("BlackListAlpha")
                        
                        themeColor.updateTheme(color: "BlackList", colorAlpha: "BlackListAlpha")
                    }) {
                        Rectangle()
                            .cornerRadius(10)
                            .frame(width: 50, height: 50)
                            .foregroundColor(Color("BlackList"))
                            .neumorphicEffect(fillColor: Color("BlackList"), cornerRdius: 10)
                    }
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
                        themeColor.color = Color("RedList")
                        themeColor.colorAlpha = Color("SilverList")
                        
                        themeColor.updateTheme(color: "RedList", colorAlpha: "SilverList")
                    }) {
                        Rectangle()
                            .cornerRadius(10)
                            .frame(width: 50, height: 50)
                            .foregroundColor(Color("RedList"))
                            .neumorphicEffect(fillColor: Color("RedList"), cornerRdius: 10)
                    }
                    
                    Button(action: {
                        themeColor.color = Color("SeaList")
                        themeColor.colorAlpha = Color("SeaListAlpha")
                        
                        themeColor.updateTheme(color: "SeaList", colorAlpha: "SeaListAlpha")
                    }) {
                        Rectangle()
                            .cornerRadius(10)
                            .frame(width: 50, height: 50)
                            .foregroundColor(Color("SeaList"))
                            .neumorphicEffect(fillColor: Color("SeaList"), cornerRdius: 10)
                    }
                }
                .padding(.top)
                
                Spacer()
                
            }
        }
        .background(Color("MercuryList"))
    }
}

struct ThemesView_Previews: PreviewProvider {
    static var previews: some View {
        ThemesView(themeColor: ThemesColors())
    }
}
