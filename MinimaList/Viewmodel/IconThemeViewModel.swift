//
//  IconThemeViewModel.swift
//  MinimaList
//
//  Created by Jérémy Perez on 11/01/2022.
//

import SwiftUI

class IconThemeViewModel: ObservableObject {
    
    let application = UIApplication.shared
    
    enum AppIcon: String {
        case salmon
        case black
        case green
        case primaryAppIcon
    }
    
    func changeAppIcon(to appIcon: AppIcon) {
        application.setAlternateIconName(appIcon.rawValue) { error in
            if let error = error {
                print("DEBUG: setAlternateIconName Error \(error.localizedDescription)")
            } else {
                print("DEBUG: setAlternateIconName True")
            }
        }
    }
}
