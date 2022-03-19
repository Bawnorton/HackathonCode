//
//  main.swift
//  Interest
//
//  Created by Benjamin on 12/12/18.
//  Copyright © 2018 Benjamin. All rights reserved.
//

import Foundation

var principal:Double = 200
var rate:Double = 7
var time:Double = 18
var money = principal * pow((1+rate/100), time)
print(money)
