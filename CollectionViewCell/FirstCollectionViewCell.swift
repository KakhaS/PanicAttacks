//
//  FirstCollectionViewCell.swift
//  PanicAttacks
//
//  Created by Kakha Sepashvili on 20.02.21.
//

import UIKit

class FirstCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var imageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.contentView.isUserInteractionEnabled = false
    }
    public func configure(with ViewControllerBackground: UIImage) {
        imageView.image = ViewControllerBackground
        imageView.contentMode = .scaleAspectFill
    
    }
    static func nib() -> UINib {
     return UINib(nibName: "FirstCollectionViewCell", bundle: nil)
    }
}


