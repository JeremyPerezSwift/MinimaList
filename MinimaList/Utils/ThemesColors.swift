//
//  ThemesColors.swift
//  MinimaList
//
//  Created by Jérémy Perez on 07/01/2022.
//

import Foundation
import SwiftUI

class ThemesColors: ObservableObject {
    
    static let shared = ThemesColors()
    
    @Published var color = Color("BlackList")
    @Published var colorAlpha = Color("BlackListAlpha")

    // Color("RedList") Color("SilverList")
    // Color("SeaList") Color("SeaListAlpha")
    
    init() {
        fetchTheme()
    }
    
    func updateTheme(color: String, colorAlpha: String) {
        let defaults = UserDefaults.standard
        defaults.set(color, forKey: "ThemeColor")
        defaults.set(colorAlpha, forKey: "ThemeColorAlpha")
    }
    
    func fetchTheme() {
        let defaults = UserDefaults.standard
        
        let colorString = defaults.object(forKey: "ThemeColor") as? String ?? "BlackList"
        let colorStringAlpha = defaults.object(forKey: "ThemeColorAlpha") as? String ?? "BlackListAlpha"
        
        color = Color(colorString)
        colorAlpha = Color(colorStringAlpha)
    }
    
}
