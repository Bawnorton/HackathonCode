//
//  main.swift
//  Clock
//
//  Created by Benjamin on 12/12/18.
//  Copyright © 2018 Benjamin. All rights reserved.
//

import Foundation

while true {
    sleep(1)
    print(Calendar.current.component(.hour, from: Date()),":", Calendar.current.component(.minute, from: Date()),":", Calendar.current.component(.second, from: Date()))
}

