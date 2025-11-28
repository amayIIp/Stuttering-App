//
//  monthlyChallengesCollectionViewCell.swift
//  Stuttering App
//
//  Created by SDC-USER on 28/11/25.
//

import UIKit

class monthlyChallengesCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var montlyImageView: UIImageView!
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var montlyLabel: UILabel!
    
    func configure(with challenge: MonthlyChallenge) {
        montlyImageView.image = UIImage(named: challenge.imageName)
        montlyLabel.text = challenge.title
        progressView.setProgress(challenge.progress, animated: true)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        montlyImageView.layer.cornerRadius = 16
        montlyImageView.layer.masksToBounds = true
        contentView.layer.cornerRadius = 16
        contentView.layer.masksToBounds = true
        
        progressView.trackTintColor = UIColor.systemGray5
        // Fixed: progressTintColor expects UIColor, not CGColor
        progressView.progressTintColor = UIColor(red: 45/255, green: 156/255, blue: 219/255, alpha: 1)

        progressView.layer.cornerRadius = 2
        progressView.clipsToBounds = true
    }
}
