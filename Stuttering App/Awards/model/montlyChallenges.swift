//
//  montlyChallenges.swift
//  Stuttering App
//
//  Created by SDC-USER on 28/11/25.
//

import Foundation

import UIKit

struct MonthlyChallenge {
    let title: String
    let imageName: String
    let progress: Float

    // Static list of challenges
    static let challenges: [MonthlyChallenge] = [
        MonthlyChallenge(title: "Persistent Pro", imageName: "persistentPro", progress: 0.6),
        MonthlyChallenge(title: "Steady Strider", imageName: "steadyStrider", progress: 0.6),
        MonthlyChallenge(title: "Conversation Cadet", imageName: "conversationCadet", progress: 0.6)
    ]
}
