//
//  LoginViewController.swift
//  PanicAttacks
//
//  Created by Kakha Sepashvili on 04.02.21.
//

import UIKit

class LoginViewController: UIViewController {

    @IBAction func presentController() {
        navigationController?.pushViewController(ViewController(), animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: true)
    }

}
