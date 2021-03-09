//
//  secondButtonViewController.swift
//  PanicAttacks
//
//  Created by Kakha Sepashvili on 24.02.21.
//

import UIKit

struct Item2 {
    var imageName: String
}
var items: [Item2] = [
    Item2(imageName: "nevrozi"),
    Item2(imageName: "nevrozi2")]

class secondButtonViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var uiBackground: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        uiBackground.image = UIImage(named: "button2backgrounds")
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



extension secondButtonViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "InfoCollectionViewCell", for: indexPath) as! InfoCollectionViewCell
        cell.infoImage.image = UIImage(named: items[indexPath.item].imageName)
        return cell
    }
}
extension secondButtonViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionViewFlowLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: 200)
    }
}

