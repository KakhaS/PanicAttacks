//
//  firstButtonViewController.swift
//  PanicAttacks
//
//  Created by Kakha Sepashvili on 23.02.21.
//

import UIKit

class firstButtonViewController: UIViewController{
    
    struct Item {
        var imageName: String
    }
    var items: [Item] = [
        Item(imageName: "PanickInfo"),
        Item(imageName: "Panickinfo2"),
        Item(imageName: "Panicinfo3"),
    Item(imageName: "PanicInfo4")]

    @IBOutlet weak var collectionView: UICollectionView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(InfoCollectionViewCell.nib2(), forCellWithReuseIdentifier: "InfoCollectionViewCell")
        
        let cellsize = CGSize(width: 400, height: 420)
        let layout2 = UICollectionViewFlowLayout()
        layout2.itemSize = cellsize
        layout2.minimumLineSpacing = 35.0
        layout2.minimumInteritemSpacing = 15.0
          }

        
       }
    

extension firstButtonViewController: UICollectionViewDelegate  {
    
}

extension firstButtonViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "InfoCollectionViewCell", for: indexPath) as! InfoCollectionViewCell
        cell.infoImage.image = UIImage(named: items[indexPath.item].imageName)
        
        return cell
    }
}
extension firstButtonViewController: UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionViewFlowLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
           return CGSize(width: 200, height: 200)
    }
}
