//
//  thirdViewController.swift
//  PanicAttacks
//
//  Created by Kakha Sepashvili on 24.02.21.
//

import UIKit

struct Item3 {
    var imageName: String
}
var items3: [Item3] = [
    Item3(imageName: "panicsheteva1"),
    Item3(imageName: "panicsheteva2"),
    Item3(imageName: "panicsheteva3")]


class thirdButtonViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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



extension thirdButtonViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "InfoCollectionViewCell", for: indexPath) as! InfoCollectionViewCell
        cell.infoImage.image = UIImage(named: items3[indexPath.item].imageName)
        return cell
    }
}
extension thirdButtonViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionViewFlowLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: 200)
    }
}

