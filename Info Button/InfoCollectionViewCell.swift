//
//  InfoCollectionViewCell.swift
//  PanicAttacks
//
//  Created by Kakha Sepashvili on 25.02.21.
//

import UIKit

class InfoCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var infoImage: UIImageView!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.contentView.isUserInteractionEnabled = false
      

    }
    static func nib2() -> UINib {
    return UINib(nibName: "InfoCollectionViewCell", bundle: nil)
   }
}


