//
//  ThemesIconesView.swift
//  MinimaList
//
//  Created by Jérémy Perez on 11/01/2022.
//

import SwiftUI

//struct ThemesIconesView: View {
//    @EnvironmentObject var iconSettings: IconThemeViewModel
//
//    var body: some View {
//        NavigationView {
//            Form {
//                Picker(selection: $iconSettings.currentIndex) {
//                    ForEach(0 ..< iconSettings.iconNames.count) { i in
//                        HStack {
//                            Text(iconSettings.iconNames[i] ?? "AppIcon")
//                            Image(uiImage: UIImage(named: self.iconSettings.iconNames[i] ?? "AppIcon") ?? UIImage()).resizable().renderingMode(.original).frame(width: 50, height: 50, alignment: .leading)
//                        }
//                    }
//                    .onReceive([self.iconSettings.currentIndex].publisher.first()) { value in
//                        let i = self.iconSettings.iconNames.firstIndex(of: UIApplication.shared.alternateIconName) ?? 0
//
//                        if value != i {
//                            UIApplication.shared.setAlternateIconName(self.iconSettings.iconNames[value]) { error in
//                                if error != nil {
//                                    print(error)
//                                } else {
//                                    print("True")
//                                }
//                            }
//                        }
//                    }
//                } label: {
//                    Text("Icons")
//                }
//
//            }
//        }
//
//    }
//}
//
//struct ThemesIconesView_Previews: PreviewProvider {
//    static var previews: some View {
//        ThemesIconesView()
//    }
//}
