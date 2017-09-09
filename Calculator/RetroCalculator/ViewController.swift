//
//  ViewController.swift
//  functions
//
//  Created by Daniel Ra on 6/17/17.
//  Copyright © 2017 Daniel Ra. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


func calculateArea(length: Int, width: Int) -> Int {
    let area = length * width
    return area
    //This is for more complex code, where you want to label it with something. 
    //You can't return a string if you pre-defined your return value as an Int.
}

let newArea = calculateArea(length: 5, width: 4)
let shapeOne = calculateArea(length: 3, width: 10)

var bankAccountBalance = 500.00
var sigourneyWeaverAlienStomperShoes = 350.00

func purchaseItem(currentBalance: Double, itemPrice: Double) -> Double{
    if itemPrice <= currentBalance {
        print("Purchased item for: $\(itemPrice)")
        return currentBalance - itemPrice
    } else {
        print("You are broke. You should learn how to save money.")
        return currentBalance
    }
}

let newBalance = purchaseItem(currentBalance: bankAccountBalance, itemPrice: sigourneyWeaverAlienStomperShoes)

var retroLunchBox = 40.00

bankAccountBalance = purchaseItem(currentBalance: bankAccountBalance, itemPrice: retroLunchBox)
