//
//  PasswordsViewController.swift
//  SuperSenha
//
//  Created by Guilherme Santos on 29/04/19.
//  Copyright © 2019 Guilherme Santos. All rights reserved.
//

import UIKit

class PasswordsViewController: UIViewController {

    @IBOutlet weak var tvPasswords: UITextView!
    
    var numberOfCharacteres: Int = 10
    var numberOfPasswords: Int = 1
    var userLetters: Bool!
    var userNumbers: Bool!
    var userCapitalLaters: Bool!
        var userSpecialLatters: Bool!
    
    var passwordGenerete: PasswordGenerate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = " Numero de senhas: \(numberOfPasswords)"
        
        passwordGenerete = PasswordGenerate(numberOfCharacteres: numberOfCharacteres, userLetters: userLetters, userNumbers: userNumbers, userCapitalLaters: userCapitalLaters, userSpecialLatters: userSpecialLatters)
        
        generatePasswords()
    }
    
    func generatePasswords(){
        tvPasswords.scrollRangeToVisible(NSRange(location: 0, length: 0))
        tvPasswords.text = ""
        let passwords = passwordGenerete.generate(total: numberOfPasswords)
        for password in passwords {
            tvPasswords.text.append(password + "\n\n")
        }
    }
    
    @IBAction func generate(_ sender: UIButton) {
        generatePasswords()
    }
}
