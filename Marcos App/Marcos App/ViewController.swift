//
//  ViewController.swift
//  Marcos App
//
//  Created by Benjamin on 12/12/18.
//  Copyright © 2018 Benjamin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var pepperoniC = ""
    var margaritaC = ""
    var tripleCheeseC = ""
    var seafoodDelightC = ""
    var farmhouseC = ""
    var neopolitanC = ""
    var n = 0
    @IBOutlet weak var pepperoniCount: UILabel!
    @IBOutlet weak var margaritaCount: UILabel!
    @IBOutlet weak var tripleCheeseCount: UILabel!
    @IBOutlet weak var seafoodDelightCount: UILabel!
    @IBOutlet weak var farmhouseCount: UILabel!
    @IBOutlet weak var neopolitanCount: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func pepperoni(_ sender: Any) {
        pepperoniCount.text = String(Int(pepperoniCount.text ?? "0")! + 1)
        pepperoniC = pepperoniCount.text!
        n += 12
    }
    @IBAction func margarita(_ sender: Any) {
        margaritaCount.text = String(Int(margaritaCount.text ?? "0")! + 1)
        margaritaC = margaritaCount.text!
        n += 12
    }
    @IBAction func tripleCheese(_ sender: Any) {
        tripleCheeseCount.text = String(Int(tripleCheeseCount.text ?? "0")! + 1)
        tripleCheeseC = tripleCheeseCount.text!
        n += 12
    }
    @IBAction func seafoodDelight(_ sender: Any) {
        seafoodDelightCount.text = String(Int(seafoodDelightCount.text ?? "0")! + 1)
        seafoodDelightC = seafoodDelightCount.text!
        n += 12
    }
    @IBAction func farmhouse(_ sender: Any) {
        farmhouseCount.text = String(Int(farmhouseCount.text ?? "0")! + 1)
        farmhouseC = farmhouseCount.text!
        n += 12
    }
    @IBAction func neopolitan(_ sender: Any) {
        neopolitanCount.text = String(Int(neopolitanCount.text ?? "0")! + 1)
        neopolitanC = neopolitanCount.text!
        n += 12
    }
    @IBAction func confirm(_ sender: Any) {
        let alert = UIAlertController(title: "Ordered Pizzas", message: String(stringInterpolation: "Pepperoni: ", pepperoniC, "\nMargarita: ", margaritaC, "\nTriple Cheese: ", tripleCheeseC, "\nSeafood Delight: ", seafoodDelightC, "\nFarmhouse: ", farmhouseC, "\nNeopolitan: ", neopolitanC, "\n", "\nCost: $", String(n)), preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
