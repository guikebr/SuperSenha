//
//  ViewController.swift
//  SuperSenha
//
//  Created by Guilherme Santos on 25/04/19.
//  Copyright © 2019 Guilherme Santos. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tfTotalPasswords: UITextField!
    @IBOutlet weak var tfNumberOfCharectors: UITextField!
    @IBOutlet weak var swLatters: UISwitch!
    @IBOutlet weak var swNumbers: UISwitch!
    @IBOutlet weak var swCapitalLatters: UISwitch!
    @IBOutlet weak var swSpecialCharacters: UISwitch!
    
    override func viewDidLoad() {   
        super.viewDidLoad()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let passwordsViewController = segue.destination as! PasswordsViewController
        if let numberOfPasswords = Int(tfTotalPasswords.text!) {
            passwordsViewController.numberOfPasswords = numberOfPasswords
        }
        if let numberOfCharacteres = Int(tfNumberOfCharectors.text!) {
            passwordsViewController.numberOfCharacteres = numberOfCharacteres
        }
        passwordsViewController.userLetters = swLatters.isOn
        passwordsViewController.userNumbers = swNumbers.isOn
        passwordsViewController.userCapitalLaters = swCapitalLatters.isOn
        passwordsViewController.userSpecialLatters = swSpecialCharacters.isOn
        
        view.endEditing(true)
    }

}

