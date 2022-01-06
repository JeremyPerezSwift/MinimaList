//
//  ContentView.swift
//  MinimaList
//
//  Created by Jérémy Perez on 05/01/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        NavigationView {
            CustomTabView()
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarHidden(true)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
