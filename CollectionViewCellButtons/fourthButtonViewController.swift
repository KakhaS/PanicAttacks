//
//  fourthButtonViewController.swift
//  PanicAttacks
//
//  Created by Kakha Sepashvili on 24.02.21.
//

import UIKit

struct Item4 {
    var imageName: String
}
var items4: [Item4] = [
    Item4(imageName: "depersonalization1"),
    Item4(imageName: "depersonalization2")]


class fourthButtonViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var uiBackground2: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        uiBackground2.image = UIImage(named: "button2backgrounds")
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(InfoCollectionViewCell.nib2(), forCellWithReuseIdentifier: "InfoCollectionViewCell")
        
        let cellsize = CGSize(width: 400, height: 420)
        let layout3 = UICollectionViewFlowLayout()
        layout3.itemSize = cellsize
        layout3.minimumLineSpacing = 35.0
        layout3.minimumInteritemSpacing = 15.0
    }
}



extension fourthButtonViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "InfoCollectionViewCell", for: indexPath) as! InfoCollectionViewCell
        cell.infoImage.image = UIImage(named: items[indexPath.item].imageName)
        return cell
    }
}
extension fourthButtonViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionViewFlowLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: 200)
    }
}

