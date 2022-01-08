//
//  CustomTabView.swift
//  MinimaList
//
//  Created by Jérémy Perez on 05/01/2022.
//

import SwiftUI

struct CustomTabView: View {
    @StateObject var tabBarRouter = CustomTabRouter()
    @StateObject var themeColor = ThemesColors()
    
    @State var isShowPopUp = false
    @State var refreshList = false
    
    @ViewBuilder var contentView: some View {
        switch tabBarRouter.currentPage {
        case .home:
            Home(themeColor: themeColor, refreshList: $refreshList)
        case .setting:
            Setting(themeColor: themeColor)
        case .plus:
            EmptyView()
        }
    }
    
    var body: some View {
        GeometryReader { geometry in
            Color("MercuryList")
                .ignoresSafeArea()
            VStack {
                Spacer()
                
                contentView
                
                Spacer()
                Divider()
                
                HStack {
                    CustomTabItem(width: geometry.size.width / 20, height: 0, systemIconName: "rectangle.grid.1x2.fill", themeColor: themeColor, tabBarRouter: tabBarRouter, assignedPage: .home)
                        .padding(.top)
                    
                    CustomPlusTabItem(width: geometry.size.width / 8, height: geometry.size.width / 8, systemIconName: "plus", themeColor: themeColor, action: showPopUp)
                        .neumorphicEffect(fillColor: ThemesColors.shared.color, cornerRdius: 15)
                        .padding(.horizontal, geometry.size.width / 6)
                        .offset(y: -((geometry.size.height / 9) / 2) - 8)
                    
                    CustomTabItem(width: geometry.size.width / 20, height: 0, systemIconName: "gearshape.fill", themeColor: themeColor, tabBarRouter: tabBarRouter, assignedPage: .setting)
                        .padding(.top)
                }
                .frame(width: geometry.size.width, height: geometry.size.height / 9)
                .background(Color("MercuryList"))
            }
            .sheet(isPresented: $isShowPopUp) {
                refreshList.toggle()
            } content: {
                AddList(themeColor: themeColor)
            }

        }
        .edgesIgnoringSafeArea(.bottom)
        
    }
    
    func showPopUp() {
        isShowPopUp = true
    }
    
}

struct CustomTabView_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabView()
    }
}

//struct CustomTabView: View {
//    var tabs = ["home", "gear"]
//    @State var selectedTab = "home"
//    
//    var body: some View {
//        
//        ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)) {
//            
//            TabView(selection: $selectedTab) {
//
//                Home()
//                    .tag("home")
//                
//                ToDo()
//                    .tag("gear")
//                
//            }
////            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
////            .ignoresSafeArea(.all, edges: .bottom)
//            
//            HStack(spacing: 0) {
//                
//                ForEach(tabs, id: \.self) { image in
//                    
//                    TabButton(image: image, selectTab: $selectedTab)
//                        .padding(.horizontal, 50)
//                    
//                    if image != tabs.last {
//                        Spacer(minLength: 0)
//                    }
//                    
//                }
//                
//            }
//            .border(Color.black, width: 1)
//            .background(Color.clear)
//            .ignoresSafeArea()
//        }
//        .ignoresSafeArea(.keyboard, edges: .bottom)
//        
//    }
//    
//}
//
//struct TabButton: View {
//    
//    var image: String
//    @Binding var selectTab: String
//    
//    var body: some View {
//        
//        Button(action: { selectTab = image }) {
//            Image(image)
//                .renderingMode(.template)
//                .foregroundColor(selectTab == image ? Color.black : Color.black.opacity(0.4))
//                .padding()
//        }
//        
//    }
//    
//}
