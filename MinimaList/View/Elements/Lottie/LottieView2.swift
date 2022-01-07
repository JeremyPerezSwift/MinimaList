//
//  LottieView2.swift
//  MinimaList
//
//  Created by Jérémy Perez on 07/01/2022.
//

import SwiftUI
import Lottie

struct LottieView2: UIViewRepresentable {
    let animationView = AnimationView()
    var filename = "LottieSuccess"
    
    func makeUIView(context: Context) -> some UIView {
        let view = UIView()
        
        let animation = Animation.named(filename)
        animationView.animation = animation
        animationView.contentMode = .scaleAspectFit
        animationView.play(toProgress: .infinity, loopMode: .autoReverse, completion: nil)
        
        animationView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(animationView)
        
        NSLayoutConstraint.activate([
            animationView.heightAnchor.constraint(equalTo: view.heightAnchor),
            animationView.widthAnchor.constraint(equalTo: view.widthAnchor),
        ])
        
        return view
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
}
