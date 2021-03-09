//
//  loginViewController.swift
//  PanicAttacks
//
//  Created by Kakha Sepashvili on 04.02.21.
//

import UIKit

class loginViewController: UIViewController {

    @IBAction func nextPage(){
        let vc = storyboard?.instantiateViewController(withIdentifier: "tabbar") as! UITabBarController
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: false)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}
