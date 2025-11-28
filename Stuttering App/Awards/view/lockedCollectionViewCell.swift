//
//  lockedCollectionViewCell.swift
//  Stuttering App
//
//  Created by SDC-USER on 28/11/25.
//

import UIKit

class lockedCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var lockedImage: UIImageView!
    
    @IBOutlet weak var lockedProgress: UIProgressView!
    @IBOutlet weak var lockedLabel: UILabel!
    
    override func awakeFromNib() {
            super.awakeFromNib()

            lockedImage.layer.cornerRadius = 16
            lockedImage.layer.masksToBounds = true

            // Grey color for locked items
            lockedProgress.progressTintColor = UIColor(red: 45/255, green: 156/255, blue: 219/255, alpha: 1)

            lockedProgress.trackTintColor = UIColor.systemGray5

            lockedProgress.layer.cornerRadius = 2
            lockedProgress.clipsToBounds = true
        }

        func configure(with challenge: LockedChallenge) {
            lockedImage.image = UIImage(named: challenge.imageName)
            lockedLabel.text = challenge.title
            lockedProgress.setProgress(challenge.progress, animated: true)
        }
    }
