//
//  ViewController.swift
//  Calculator-1
//
//  Created by TT on 15.08.2019.
//  Copyright © 2019 TT. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var numberOnScreen: Double = 0
    var previousNumber: Double = 0
    var operation = 0
    var isPerformingOperation = false
    
    @IBOutlet weak var resultScreen: UILabel!
    @IBOutlet weak var preResultScreen: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    //resultScreen.text="0"
    }

@IBAction func numbers(_ sender: UIButton) {
 
    
    if isPerformingOperation == true {
        isPerformingOperation = false
        resultScreen.text = String(sender.tag)
        numberOnScreen = Double(resultScreen.text!)!
        
       
    }
 
    else {
    
  
    resultScreen.text=resultScreen.text! + String(sender.tag)
       numberOnScreen = Double(resultScreen.text!)!
    }
}

@IBAction func operators(_ sender: UIButton) {
    //Clear All
    if sender.tag == 19{
           //preResultScreen.text=String(numberOnScreen)
        resultScreen.text = ""
        previousNumber = 0
        numberOnScreen = 0
        operation = 0
     
        return
    }
    
    // operations +13 -14 /16 *15 =12
    
    if sender.tag == 13{
        isPerformingOperation = true
        previousNumber = Double(resultScreen.text!)!
        resultScreen.text = "+"
        operation = sender.tag
        
    }else if sender.tag == 14{
        isPerformingOperation = true
        previousNumber = Double(resultScreen.text!)!
        resultScreen.text = "-"
         operation = sender.tag
    }else if sender.tag == 15{
        isPerformingOperation = true
        previousNumber = Double(resultScreen.text!)!
        resultScreen.text = "x"
         operation = sender.tag
    }else if sender.tag == 16{
        isPerformingOperation = true
        previousNumber = Double(resultScreen.text!)!
        resultScreen.text = "/"
         operation = sender.tag
    }else if sender.tag == 17{
        isPerformingOperation = true
        previousNumber = Double(resultScreen.text!)!
        resultScreen.text = "%"
        operation = sender.tag
    }else if sender.tag == 12{
        
        switch operation {
        case 13 :
            resultScreen.text=String(previousNumber + numberOnScreen)
       case 14 :
            resultScreen.text=String(previousNumber - numberOnScreen)
        case 15 :
            resultScreen.text=String(previousNumber * numberOnScreen)
        case 16 :
            resultScreen.text=String(previousNumber / numberOnScreen)
        case 17 :
            resultScreen.text=String( numberOnScreen*previousNumber*100)
        default :
            resultScreen.text = "Error."
        }

}

}
}
