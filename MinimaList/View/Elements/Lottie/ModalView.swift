//
//  ModalView.swift
//  MinimaList
//
//  Created by Jérémy Perez on 07/01/2022.
//

import SwiftUI

struct ModalView: View {
    var body: some View {
        ZStack {
            ZStack {
                LottieView(filename: "Test")
            }
            .frame(width: UIScreen.main.bounds.width / 3, height: UIScreen.main.bounds.width / 3)
            .background(Color("MercuryList"))
            .cornerRadius(30)
            .shadow(radius: 30)
        }
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 1.3)
        .background(Color("Alpha"))
        .onAppear {
            HapticsManager.shared.vibrate(for: .success)
        }
    }
}

struct ModalView_Previews: PreviewProvider {
    static var previews: some View {
        ModalView()
    }
}
