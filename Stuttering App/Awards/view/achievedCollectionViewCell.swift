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
    
    
    @IBOutlet weak var achievedDate: UILabel!
    
    override func awakeFromNib() {
           super.awakeFromNib()
           
           // Rounded image
           achievedImage.layer.cornerRadius = 16
           achievedImage.layer.masksToBounds = true
           
        
       }
       
       func configure(with item: AchievedChallenge) {
           achievedImage.image = UIImage(named: item.imageName)
           achievedLabel.text = item.title
           achievedDate.text = item.completedDate
           
       }
   }
