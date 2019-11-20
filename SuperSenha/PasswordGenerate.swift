//
//  PasswordGenerate.swift
//  SuperSenha
//
//  Created by Guilherme Santos on 29/04/19.
//  Copyright © 2019 Guilherme Santos. All rights reserved.
//

import Foundation

class PasswordGenerate {
 
    var numberOfCharacteres: Int
    var userLetters: Bool
    var userNumbers: Bool
    var userCapitalLaters: Bool
    var userSpecialLatters: Bool
    
    var passwords: [String] = []
    
    private let letters = "abcdefghijklmnopqrstuvwxyz"
    private let spacecialCharacteres = "!@#$%¨&*()_+=~`|]}[{':;?/<>.,"
    private let numbers = "0123456789"
    
    init(numberOfCharacteres: Int, userLetters: Bool, userNumbers: Bool, userCapitalLaters: Bool, userSpecialLatters: Bool) {
        
        var numchars = min(numberOfCharacteres, 16)
        numchars = max(numchars, 1)
        
        self.numberOfCharacteres = numchars
        self.userLetters = userLetters
        self.userNumbers = userNumbers
        self.userCapitalLaters = userCapitalLaters
        self.userSpecialLatters = userSpecialLatters
        
    }
    
    func generate(total: Int) -> [String] {
        passwords.removeAll()
        var universe: String = ""
        
        if userLetters {
            universe += letters
        }
        
        if userNumbers {
            universe += numbers
        }
        
        if userSpecialLatters {
            universe += spacecialCharacteres
        }
        
        if userCapitalLaters {
            universe += letters.uppercased()
        }
        
        let universeArray = Array(universe)
        while passwords.count < total {
            var password = ""
            for _ in 1...numberOfCharacteres {
                let index = Int(arc4random_uniform(UInt32(universeArray.count)))
                password += String(universeArray[index])
            }
            passwords.append(password)
        }
        
        return passwords
    }
}
