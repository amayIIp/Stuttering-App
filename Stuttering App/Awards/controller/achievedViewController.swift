//
//  achievedViewController.swift
//  Stuttering App
//
//  Created by SDC-USER on 28/11/25.
//

import UIKit

class achievedViewController: UIViewController,UICollectionViewDataSource {

    @IBOutlet weak var achievedCollectionView: UICollectionView!
    
    let achieved = AchievedChallenge.achieved
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            achievedCollectionView.dataSource = self
            achievedCollectionView.collectionViewLayout = generateLayout()
        }
        
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return achieved.count
        }

        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = achievedCollectionView.dequeueReusableCell(
                withReuseIdentifier: "AchievedCell",
                for: indexPath
            ) as! achievedCollectionViewCell
            
            let item = achieved[indexPath.row]
            cell.configure(with: item)
            
            return cell
        }

        func generateLayout() -> UICollectionViewLayout {

            let itemSize = NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(0.5),
                heightDimension: .fractionalHeight(1.0)
            )

            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            item.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)

            let groupSize = NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .absolute(250)   // Adjust to your needs
            )

            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
            group.interItemSpacing = .fixed(10)

            let section = NSCollectionLayoutSection(group: group)
            section.interGroupSpacing = 15
            section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)

            return UICollectionViewCompositionalLayout(section: section)
        }
    }
