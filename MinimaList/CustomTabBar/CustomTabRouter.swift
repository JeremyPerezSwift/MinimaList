//
//  CustomTabRouter.swift
//  MinimaList
//
//  Created by Jérémy Perez on 05/01/2022.
//

import SwiftUI
import Foundation

class CustomTabRouter: ObservableObject {
    @Published var currentPage: Page = .home
}

enum Page {
    case home
    case setting
    case plus
}
