//
//  achieved.swift
//  Stuttering App
//
//  Created by SDC-USER on 28/11/25.
//

import Foundation

struct AchievedChallenge {
    let title: String
    let imageName: String
    let progress: Float = 1.0   // Always 100%

    static let achieved: [AchievedChallenge] = [
        AchievedChallenge(title: "First Step", imageName: "firstStep"),
        AchievedChallenge(title: "Voice Explorer", imageName: "voiceExplorer"),
        AchievedChallenge(title: "Breath Control", imageName: "breadthControl")
    ]
}

