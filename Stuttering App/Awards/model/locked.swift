//
//  locked.swift
//  Stuttering App
//
//  Created by SDC-USER on 28/11/25.
//

import Foundation

struct LockedChallenge {
    let title: String
    let imageName: String = "locked"   // Same image for all
    let progress: Float = 0.3         // 30%

    static let locked: [LockedChallenge] = [
        LockedChallenge(title: "Fluency Legend"),
        LockedChallenge(title: "Steady Speaker"),
        LockedChallenge(title: "Clarity Champ")
    ]
}
