//
//  main.swift
//  Rock Paper Scissors
//
//  Created by Benjamin on 12/12/18.
//  Copyright © 2018 Benjamin. All rights reserved.
//

import Foundation

var rawInput: String?
var input = ""
var gameArray = ["ROCK","PAPER","SCISSOR"]

print("Rock Paper Scissors\nGive an Input (Rock|Paper|Scissor) and the computer will play against you")

func play(value: Int) {
    print("Computer: ", terminator: "")
    gameArray.shuffle()
    print(gameArray[0])
    if input == gameArray[0] {
        print("Draw")
    }
    else if (input == "ROCK" && gameArray[0] == "SCISSOR") || (input == "SCISSOR" && gameArray[0] == "PAPER") || (input == "PAPER" && gameArray[0] == "ROCK") {
        print("Win")
    }
    else {
        print("Lose")
    }
}
while true {
    print("Input: ", terminator: "")
    rawInput = readLine()
    if rawInput == "" || rawInput == nil {
        print("Please Give An Input")
    }
    input = rawInput!.uppercased()
    if input == "ROCK" {
        play(value: 0)
    }
    else if input == "PAPER" {
        play(value: 1)
    }
    else if input == "SCISSOR" {
        play(value: 2)
    }
    else {
        print("INVALID INPUT")
    }
    
}

