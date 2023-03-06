//
//  ViewController.swift
//  FreeOnBoarding
//
//  Created by 윤준수 on 2023/03/06.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource {
    @IBOutlet weak var collectionView: UICollectionView!
    var urls: [URL?] = [URL(string: "https://images.unsplash.com/photo-1584028887908-f6d2257fe9d4?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8cHJldHR5fGVufDB8fDB8fA%3D%3D&w=1000&q=80"),
                        URL(string: "https://wallpaperstock.net/pretty-purple-pelican-islands-wallpapers_48522_1920x1200.jpg"),
                        URL(string: "https://media.istockphoto.com/id/1052276576/photo/villefranche-sur-mer-cote-dazur-french-riviera-france.jpg?s=612x612&w=0&k=20&c=SeyC7XNtIZcXG_7A29Jl3Z8lM4UwVJ_wqdtTSvmbdLk="),
                        URL(string: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSLwIGdytYicJPPv8DJzyaIlB5YiVA2b-3fgh-fWgrQ-oAn00exxI_mPmFFwyg0ynAyeCY&usqp=CAU"),
                        URL(string: "https://m.fourseasons.com/alt/img-opt/~70.1530.0,0000-304,1590-3000,0000-1687,5000/publish/content/dam/fourseasons/images/web/BEV/BEV_528_original.jpg"),
                        URL(string: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS3wmb90A2OdTnZYVuj_yRxW7Hphcxrvdz5cA&usqp=CAU")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.register(UINib(nibName: "MainCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "MainCollectionViewCell")
        collectionView.dataSource = self
        collectionView.collectionViewLayout = configureCollectionViewLayout()
        
    }
    
    func configureCollectionViewLayout() -> UICollectionViewCompositionalLayout {
        let sectionProvider = { (sectionIndex: Int, layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                  heightDimension: .absolute(70))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)

            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                   heightDimension: .absolute(70))

            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize,
                                                           subitems: [item])
            let section = NSCollectionLayoutSection(group: group)
            section.interGroupSpacing = 10
            return section
        }
        
        let layout = UICollectionViewCompositionalLayout(sectionProvider: sectionProvider)
        
        return layout
    }

    @IBAction func didTapLoadAllButton(_ sender: Any) {
        collectionView.visibleCells.forEach({
            ($0 as? MainCollectionViewCell)?.loadImage()
        })
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        urls.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MainCollectionViewCell", for: indexPath) as? MainCollectionViewCell
        else {
            return UICollectionViewCell()
        }
        
        cell.configure(url: urls[indexPath.item])
        
        return cell
    }
}

