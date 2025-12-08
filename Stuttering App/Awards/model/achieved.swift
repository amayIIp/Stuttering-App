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
     
    let completedDate: String

    static let achieved: [AchievedChallenge] = [
        AchievedChallenge(title: "First Step", imageName: "firstStep",completedDate: "06/07/25"),
        AchievedChallenge(title: "Voice Explorer", imageName: "voiceExplorer",completedDate: "06/09/25"),
        AchievedChallenge(title: "Breath Control", imageName: "breadthControl",completedDate: "06/11/25")
    ]
}

