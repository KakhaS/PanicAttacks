//
//  thirdViewController.swift
//  PanicAttacks
//
//  Created by Kakha Sepashvili on 19.01.21.
//

import UIKit

class thirdViewController: UIViewController {

    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var image2: UIImageView!
    @IBOutlet weak var image3: UIImageView!
    @IBOutlet weak var image4: UIImageView!
    @IBOutlet weak var image5: UIImageView!

    @IBAction func buttonPressed(_ sender: Any) {

        UIView.animate(withDuration: 10){
            self.backgroundImage.isHidden = true
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.view.backgroundColor = .black
        }
        button.isHidden = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            self.image1.isHidden = false
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 8) {
            self.image2.isHidden = false
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 11) {
            self.image3.isHidden = false
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 14) {
            self.image4.isHidden = false
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 17) {
            self.image5.isHidden = false
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 22) {
            self.image1.isHidden = true
            self.image2.isHidden = true
            self.image3.isHidden = true
            self.image4.isHidden = true
            self.image5.isHidden = true
            self.button.isHidden = false
            self.backgroundImage.isHidden = false
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        backgroundImage.image = UIImage(named: "3pagebackground")
        backgroundImage.contentMode = .scaleToFill
        image1.isHidden = true
        image2.isHidden = true
        image3.isHidden = true
        image4.isHidden = true
        image5.isHidden = true
        button.setImage(UIImage(named: "savarjishoButton2"), for: UIControl.State.normal)
        }
    }


