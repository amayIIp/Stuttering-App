//
//  lockedViewController.swift
//  Stuttering App
//
//  Created by SDC-USER on 28/11/25.
//

import UIKit

class lockedViewController: UIViewController,UICollectionViewDataSource {

    @IBOutlet weak var lockedView: UICollectionView!
    
    let lockedChallenges = LockedChallenge.locked

        override func viewDidLoad() {
            super.viewDidLoad()

            lockedView.dataSource = self
            lockedView.collectionViewLayout = generateLayout()
        }

        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return lockedChallenges.count
        }

        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

            let cell = lockedView.dequeueReusableCell(
                withReuseIdentifier: "LockedCell",
                for: indexPath
            ) as! lockedCollectionViewCell

            let challenge = lockedChallenges[indexPath.row]
            cell.configure(with: challenge)

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
                heightDimension: .absolute(250)
            )
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
            group.interItemSpacing = .fixed(10)

            let section = NSCollectionLayoutSection(group: group)
            section.interGroupSpacing = 15
            section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)

            return UICollectionViewCompositionalLayout(section: section)
        }
    }
