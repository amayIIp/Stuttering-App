import UIKit

class monthlyChallengesViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    
    
   
    @IBOutlet weak var monthlyCollectionView: UICollectionView!
    


    
    let allChallenges = MonthlyChallenge.challenges
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            monthlyCollectionView.dataSource = self
            monthlyCollectionView.collectionViewLayout = generateLayout()
        }

        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return allChallenges.count
        }

        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = monthlyCollectionView.dequeueReusableCell(
                withReuseIdentifier: "MonthlyChallengeCell",
                for: indexPath
            ) as! monthlyChallengesCollectionViewCell
            
            let challenge = allChallenges[indexPath.row]
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
