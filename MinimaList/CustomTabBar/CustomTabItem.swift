//
//  CustomTabItem.swift
//  MinimaList
//
//  Created by Jérémy Perez on 05/01/2022.
//

import SwiftUI

struct CustomTabItem: View {
    
    let width, height: CGFloat
    let systemIconName: String
    
    @ObservedObject var themeColor: ThemesColors
    
    @ObservedObject var tabBarRouter: CustomTabRouter
    let assignedPage: Page
    
    var body: some View {
        VStack {
            Image(systemName: systemIconName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: width, height: width)
                .padding(.top, 10)
            
            Spacer()
        }
        .foregroundColor(tabBarRouter.currentPage == assignedPage ? themeColor.color : Color.gray)
        .onTapGesture {
            tabBarRouter.currentPage = assignedPage
        }
    }
}

struct CustomPlusTabItem: View {
    let width, height: CGFloat
    let systemIconName: String
    
    @ObservedObject var themeColor: ThemesColors
    
    var action: () -> Void
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(themeColor.color)
                .frame(width: width, height: height)
                .cornerRadius(15)
//            Circle()
//                .foregroundColor(Color("RedList"))
//                .frame(width: width, height: height)
                
            Image(systemName: systemIconName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: width / 2.5, height: width / 2.5)
                .foregroundColor(.white)
        }
        .onTapGesture {
            action()
        }
    }
}
