//
//  View_4_2_ViewController.swift
//  Calculator Plus
//
//  Created by Min_MacBook Pro on 2020/03/26.
//  Copyright © 2020 FreeDeveloper. All rights reserved.
//

import UIKit

class View_4_2_ViewController: UIViewController {

    
    @IBOutlet var View_1: UIView!
    @IBOutlet var Text_before: UITextField!
    @IBOutlet var Text_after: UITextField!
    @IBOutlet var Button_Result_outlet: UIButton!
    @IBOutlet var View_Result: UIView!
    @IBOutlet var Result_1: UILabel!
    @IBOutlet var Result_2: UILabel!
    
    var BEFORE = ""
    var AFTER = ""
    var RESULT = 0.0
    
    let brown = UIColor(named: "Dynamic_brown")
    let button = UIColor(named: "Dynamic_button")
    
    override func viewDidLoad() {
        
        View_1.layer.cornerRadius = 18
        Button_Result_outlet.layer.cornerRadius = 13
        View_Result.layer.cornerRadius = 13
        Text_before.keyboardType = .numberPad
        Text_after.keyboardType = .numberPad
        
        self.hideKeyboard()
        super.viewDidLoad()
    }
    

    @IBAction func Button_Result(_ sender: UIButton) {
        BEFORE = Text_before.text!
        AFTER = Text_after.text!
        if(check())
        {
            RESULT = 100 - (Double(AFTER)! / Double(BEFORE)! * 100)
            Result_1.text = String(format: "%.2f",RESULT) + " %"
            Result_2.text = "- " + inputComma(innum: (Int(BEFORE)!-Int(AFTER)!)) + " 원"
        }
    }
    
    @IBAction func Button_reset(_ sender: UIButton) {
        BEFORE = ""
        AFTER = ""
        RESULT = 0.0
        Text_before.text = ""
        Text_after.text = ""
        Result_1.text = "%"
        Result_2.text = "원"
    }
    
    func check() -> Bool
    {
        if BEFORE == ""
        {
            return false
        }
        else if AFTER == ""
        {
            return false
        }
        return true
    }
    
    //ver1.1 콤마 추가
    func inputComma(innum: Int) -> String
    {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        
        let RESULT_COMMA: String = numberFormatter.string(from:NSNumber(value: innum))!
        return RESULT_COMMA
    }

}
