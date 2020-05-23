//
//  View_6_ViewController.swift
//  Calculator Plus
//
//  Created by Min_MacBook Pro on 2020/03/26.
//  Copyright © 2020 FreeDeveloper. All rights reserved.
//

import UIKit

class View_6_ViewController: UIViewController {

    @IBOutlet var View_1: UIView!
    @IBOutlet var Text_Y_now: UITextField!
    @IBOutlet var Text_age: UITextField!
    @IBOutlet var Text_Y_to: UITextField!
    @IBOutlet var Button_Result_outlet: UIButton!
    @IBOutlet var View_Result: UIView!
    @IBOutlet var Result_1: UILabel!
    @IBOutlet var Result_2: UILabel!
    
    var NOW = ""
    var TO = ""
    var AGE = ""
    var SUB = 0
    var RESULT = 0
    var PRINT = ""
    
    let brown = UIColor(named: "Dynamic_brown")
    let button = UIColor(named: "Dynamic_button")
    
    override func viewDidLoad() {
        
        View_1.layer.cornerRadius = 18
//        View_1.layer.borderWidth = 2
//        View_1.layer.borderColor = brown?.cgColor

        Button_Result_outlet.layer.cornerRadius = 13
//        Button_Result_outlet.layer.borderWidth = 2
//        Button_Result_outlet.layer.borderColor = button?.cgColor

        View_Result.layer.cornerRadius = 13
//        View_Result.layer.borderWidth = 2
//        View_Result.layer.borderColor = brown?.cgColor
        
        Text_Y_now.keyboardType = .numberPad
        Text_age.keyboardType = .numberPad
        Text_Y_to.keyboardType = .numberPad
        
        self.hideKeyboard()
        super.viewDidLoad()
    }
    
    @IBAction func Button_Result(_ sender: UIButton) {
        NOW = Text_Y_now.text!
        AGE = Text_age.text!
        TO = Text_Y_to.text!
        if(check())
        {
            if(Int(TO)! < Int(NOW)! )
            {
                SUB = Int(NOW)! - Int(TO)!
                RESULT = Int(AGE)! - SUB
                Print()
                
                Result_1.text = String(SUB) + "년 과거"
                Result_2.text = PRINT
            }
            else if(Int(TO)! > Int(NOW)!)
            {
                SUB = Int(TO)! - Int(NOW)!
                RESULT = Int(AGE)! + SUB
                
                Result_1.text = String(SUB) + "년 미래"
                Result_2.text = String(RESULT) + " 살"
            }
        }
    }
    
    @IBAction func Button_reset(_ sender: UIButton) {
        NOW = ""
        TO = ""
        AGE = ""
        SUB = 0
        RESULT = 0
        PRINT = ""
        Text_Y_now.text = ""
        Text_age.text = ""
        Text_Y_to.text = ""
        Result_1.text = "년"
        Result_2.text = "살"
    }
    
    func check() -> Bool
    {
        if NOW == ""
        {
            return false
        }
        else if AGE == ""
        {
            return false
        }
        else if TO == ""
        {
            return false
        }
        return true
    }
    
    func Print()
    {
        if RESULT < 1
        {
            PRINT = "태어나기 전"
        }
        else if RESULT < 20
        {
            switch RESULT
            {
            case 8:
                PRINT = "8 살 (초1)"
            case 9:
                PRINT = "9 살 (초2)"
            case 10:
                PRINT = "10 살 (초3)"
            case 11:
                PRINT = "11 살 (초4)"
            case 12:
                PRINT = "12 살 (초5)"
            case 13:
                PRINT = "13 살 (초6)"
            case 14:
                PRINT = "14 살 (중1)"
            case 15:
                PRINT = "15 살 (중2)"
            case 16:
                PRINT = "16 살 (중3)"
            case 17:
                PRINT = "17 살 (고1)"
            case 18:
                PRINT = "18 살 (고2)"
            case 19:
                PRINT = "19 살 (고3)"
            default:
                PRINT = String(RESULT) + " 살"
            }
        }
    }
    
    

}
