//
//  main.swift
//  Math
//
//  Created by Benjamin on 11/12/18.
//  Copyright © 2018 Benjamin. All rights reserved.
//

import Foundation


extension Double {
    func rounded(toPlaces places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}

var operatorArray = ["PLUS","MINUS","TIMES","DIVIDE","POWER","SIN","COS","TAN","+","-","X","/","^"]
var input = ""
var selectedOperator = ""
var selectedOperatorValue = 0
var rawInput: String? = ""
var lastNumber: Double = 0.0
var firstNumber: Double = 0.0
var success = true

print("Simple Math Program\n\nOperators:\nPLUS (+)\nMINUS (-)\nTIMES (X)\nDIVIDE (/)\nPOWER (^)\nSIN\nCOS\nTAN\n\nUses:\n{number} Operator {number}\nOperator {number}\nEG:\n6 PLUS 8\nSIN 8\n")

func reset() {
    input = ""
    selectedOperator = ""
    selectedOperatorValue = 0
    lastNumber = 0.0
    firstNumber = 0.0
    success = true
}
func begin() -> String
{
    while true {
        print("Input: ", terminator: "")
        rawInput = readLine()

        if rawInput == "" || rawInput == nil {
            print("Please Give An Input")
        }
        else {
            break
        }
    }
    input = rawInput!.replacingOccurrences(of: " ", with: "").uppercased()
    var i = 0
    let n = operatorArray.count - 1
    var c = 0
    while i <= n {
        if input.contains(operatorArray[i]) {
            c += 1
            if c == 2 {
                print("ERROR: MULTIPLE OPERATORS")
                break
            }
            selectedOperator = operatorArray[i]
            selectedOperatorValue = i
            if selectedOperatorValue >= 8 {
                selectedOperatorValue -= 8
            }
        }
        i += 1
    }
    if c == 0 {
        print("ERROR: NO OPERATOR")
        return "ERROR"
    }
    return input
}
func numbers(input: String) {
    success = true
    var index = (input.range(of: selectedOperator)?.upperBound)
    if let last = Double(input.suffix(from: index!)){
        lastNumber = last
    }
    else {
        print("ERROR: PLEASE GIVE A LAST NUMBER")
        success = false
    }
    if selectedOperatorValue <= 4 {
        index = (input.range(of: selectedOperator)?.lowerBound)
        if let first = Double(input.prefix(upTo: index!)){
            firstNumber = first
        }
        else {
            print("ERROR: PLEASE GIVE A FIRST NUMBER")
            success = false
        }
    }
}
func math() {
    let trig = lastNumber * Double.pi / 180
    var answer: Double = 0.0
    if selectedOperatorValue == 0 {
        answer = (firstNumber + lastNumber)
    }
    else if selectedOperatorValue == 1 {
        answer = (firstNumber - lastNumber)
    }
    else if selectedOperatorValue == 2 {
        answer = (firstNumber * lastNumber)
    }
    else if selectedOperatorValue == 3 {
        answer = (firstNumber / lastNumber)
    }
    else if selectedOperatorValue == 4 {
        answer = pow(firstNumber, lastNumber)
    }
    else if selectedOperatorValue == 5 {
        answer = sin(trig)
    }
    else if selectedOperatorValue == 6 {
        answer = cos(trig)
    }
    else {
        answer = tan(trig)
    }
    print("Answer:", answer.rounded(toPlaces: 100))
}
while true {
    let confirmedInput = begin()
    if confirmedInput != "ERROR" {
        numbers(input: confirmedInput)
    }
    if success {
        math()
    }
    reset()
}

