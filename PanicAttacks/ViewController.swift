//
//  ViewController.swift
//  PanicAttacks
//
//  Created by Kakha Sepashvili on 19.01.21.
//

import UIKit

//struct რომელიც აიღებს ფოტოს და segue ID - ს
struct Item {
    var imageName: String
    var destination: String
}

class ViewController: UIViewController {
    
    var items: [Item] = [
        Item(imageName: "buttonBackground", destination: "firstButtonViewController"),
        Item(imageName: "SecondCollectionView", destination: "secondButtonViewController"),
        Item(imageName: "panicAttack", destination: "thirdButtonViewController"),
        Item(imageName: "depersonalization", destination: "fourthButtonViewController")]
    
    
    let welcomeTexts = ["ცხოვრება მშვენიერია", "გაიღიმე, ყველაფერი დაძლევადია", "გამოუვალი მდომარეობა არ არსებობს. ფიქრია საჭირო"]
    let greeting = "გახსოვდეს, რომ"
    
    @IBOutlet weak var greetingsText: UILabel!
    @IBOutlet weak var mainText: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // რეალურად ერთი Cell ია სახელი "First" დარჩა ძველი კოდიდან
        collectionView.register(FirstCollectionViewCell.nib(), forCellWithReuseIdentifier: "FirstCollectionViewCell")
        
        //CELL ზოპები კოდით
        let cellSize = CGSize(width:200, height:200)
        let layout1 = UICollectionViewFlowLayout()
//        layout.sectionInset = UIEdgeInsets(top: 1, left: 1, bottom: 1, right: 1)
        layout1.itemSize = cellSize
        layout1.minimumLineSpacing = 1.0
        layout1.minimumInteritemSpacing = 1.0
        collectionView.setCollectionViewLayout(layout1, animated: true)
        
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        navigationController?.setNavigationBarHidden(true, animated: true)
        mainText.numberOfLines = 2
        mainText.text = welcomeTexts.randomElement()
        mainText.textColor = .white
        greetingsText.text = greeting
        greetingsText.numberOfLines = 5
        greetingsText.textColor = .white
        
        //collectionview scroll მიმართულება
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
            collectionView.backgroundColor = .none
        }
    }
}
extension ViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        let item = items[indexPath.item]
        performSegue(withIdentifier: item.destination, sender: item)
    }
}
extension ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FirstCollectionViewCell", for: indexPath) as! FirstCollectionViewCell
        cell.imageView.image = UIImage(named: items[indexPath.item].imageName)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionViewFlowLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: 200)
    }
}
