//
//  HapticsManager.swift
//  MinimaList
//
//  Created by Jérémy Perez on 08/01/2022.
//

import SwiftUI

final class HapticsManager {
    
    static let shared  = HapticsManager()
    
    private init() { }
    
    public func selectionVibrate() {
        DispatchQueue.main.async {
            let selectionFeedbackGenerator = UISelectionFeedbackGenerator()
            selectionFeedbackGenerator.prepare()
            selectionFeedbackGenerator.selectionChanged()
        }
    }
    
    public func vibrate(for type: UINotificationFeedbackGenerator.FeedbackType) {
        DispatchQueue.main.async {
            let notificationGenerator = UINotificationFeedbackGenerator()
            notificationGenerator.prepare()
            notificationGenerator.notificationOccurred(type)
        }
    }
    
    public func vibrateImpact(for intensity: CGFloat, impact: UIImpactFeedbackGenerator.FeedbackStyle) {
        DispatchQueue.main.async {
            let impactGenerator = UIImpactFeedbackGenerator(style: impact)
            impactGenerator.prepare()
            impactGenerator.impactOccurred(intensity: intensity)
        }
    }
    
}
