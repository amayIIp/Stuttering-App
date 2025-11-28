//
//  achievedCollectionViewCell.swift
//  Stuttering App
//
//  Created by SDC-USER on 28/11/25.
//

import UIKit

class achievedCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var achievedImage: UIImageView!
    
    @IBOutlet weak var achievedLabel: UILabel!
    
    @IBOutlet weak var achievedProgress: UIProgressView!
    
    override func awakeFromNib() {
           super.awakeFromNib()
           
           // Rounded image
           achievedImage.layer.cornerRadius = 16
           achievedImage.layer.masksToBounds = true
           
           // Progress bar style (green for 100%)
           achievedProgress.progressTintColor = UIColor(
               red: 76/255,
               green: 217/255,
               blue: 100/255,
               alpha: 1
           )  // Apple Green
           
           achievedProgress.trackTintColor = UIColor.systemGray5
           achievedProgress.layer.cornerRadius = 2
           achievedProgress.clipsToBounds = true
       }
       
       func configure(with item: AchievedChallenge) {
           achievedImage.image = UIImage(named: item.imageName)
           achievedLabel.text = item.title
           achievedProgress.setProgress(1.0, animated: true)
       }
   }
