//
//  main.swift
//  Hangman
//
//  Created by Benjamin on 12/12/18.
//  Copyright © 2018 Benjamin. All rights reserved.
//

import Foundation

print("Guess A Number\nComputer will tell you if your number is smaller or bigger than the number the computer is thinking of\nYou have 8 tries")

var rawInput: String?
var input: Int
var hangmanNumber = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]
hangmanNumber.shuffle()
var randomNumber = hangmanNumber[0] * hangmanNumber[1]
var i = 0
var decimals = CharacterSet.decimalDigits

while i <= 7 {
    print("Input: ", terminator: "")
    rawInput = readLine()
    if rawInput == "" || rawInput == nil {
        print("Please Give An Input")
    }
    else if ((rawInput?.rangeOfCharacter(from: decimals)) == nil) {
        print("Please Give An Intiger")
    }
    else {
        input = Int(rawInput!)!
        if input == randomNumber {
            print("Win")
            break
        }
        else if input < randomNumber {
            print("Smaller")
        }
        else {
            print("Bigger")
        }
        print("Tries Left:", 8 - i - 1)
        i += 1
    }
}


