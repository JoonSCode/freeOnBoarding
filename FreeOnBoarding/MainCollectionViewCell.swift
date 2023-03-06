//
//  MainCollectionViewCell.swift
//  FreeOnBoarding
//
//  Created by 윤준수 on 2023/03/06.
//

import UIKit
import SDWebImage

class MainCollectionViewCell: UICollectionViewCell {

    var url: URL?
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var loadButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        progressView.setProgress(0, animated: false)
    }
    
    func configure(url: URL?) {
        self.url = url
    }
    
    func loadImage() {
        imageView.image = UIImage(systemName: "photo")
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: { [weak self] in
            guard let self, let url = self.url else { return }
            self.imageView.sd_setImage(with: url)
        })
       
    }
    
    @IBAction func didTapLoadButton(_ sender: Any) {
        loadImage()
    }
}
