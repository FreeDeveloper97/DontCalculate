//
//  View_4_3_ViewController.swift
//  Calculator Plus
//
//  Created by Min_MacBook Pro on 2020/03/26.
//  Copyright © 2020 FreeDeveloper. All rights reserved.
//

import UIKit

class View_4_3_ViewController: UIViewController {

    @IBOutlet var View_1: UIView!
    @IBOutlet var Text_after: UITextField!
    @IBOutlet var Text_per: UITextField!
    @IBOutlet var Button_Result_outlet: UIButton!
    @IBOutlet var View_Result: UIView!
    @IBOutlet var Result_1: UILabel!
    @IBOutlet var Result_2: UILabel!
    
    var AFTER = ""
    var PER = ""
    var temp = 0.0
    var RESULT = 0
    
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
        
        Text_after.keyboardType = .numberPad
        Text_per.keyboardType = .decimalPad
        
        self.hideKeyboard()
        super.viewDidLoad()
    }
    

    @IBAction func Button_Result(_ sender: UIButton) {
        AFTER = Text_after.text!
        PER = Text_per.text!
        if(check())
        {
            RESULT = Int(Double(AFTER)! * 100 / (100 - Double(PER)!))
            Result_1.text = inputComma(innum: RESULT) + " 원"
            Result_2.text = "- " + inputComma(innum: (RESULT - Int(AFTER)!)) + " 원"
        }
    }
    
    @IBAction func Button_reset(_ sender: UIButton) {
        AFTER = ""
        PER = ""
        temp = 0.0
        RESULT = 0
        Text_after.text = ""
        Text_per.text = ""
        Result_1.text = "원"
        Result_2.text = "원"
    }
    
    func check() -> Bool
    {
        if AFTER == ""
        {
            return false
        }
        else if PER == ""
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
