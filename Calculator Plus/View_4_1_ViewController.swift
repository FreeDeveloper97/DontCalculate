//
//  View_4_1_ViewController.swift
//  Calculator Plus
//
//  Created by Min_MacBook Pro on 2020/03/26.
//  Copyright © 2020 FreeDeveloper. All rights reserved.
//

import UIKit

class View_4_1_ViewController: UIViewController {

    @IBOutlet var View_1: UIView!
    @IBOutlet var Text_before: UITextField!
    @IBOutlet var Text_per: UITextField!
    @IBOutlet var Button_Result_outlet: UIButton!
    @IBOutlet var View_Result: UIView!
    @IBOutlet var Result_1: UILabel!
    @IBOutlet var Result_2: UILabel!
    
    var BEFORE = ""
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
        
        Text_before.keyboardType = .numberPad
        Text_per.keyboardType = .decimalPad
        
        self.hideKeyboard()
        super.viewDidLoad()
    }
    

    @IBAction func Button_Result(_ sender: UIButton) {
        BEFORE = Text_before.text!
        PER = Text_per.text!
        if(check())
        {
            temp = Double(BEFORE)! * (1-(Double(PER)! * 0.01))
            RESULT = Int(temp)
            Result_1.text = String(RESULT) + " 원"
            Result_2.text = "- " + String(Int(BEFORE)! - RESULT) + " 원"
        }
    }
    
    @IBAction func Button_reset(_ sender: UIButton) {
        BEFORE = ""
        PER = ""
        temp = 0.0
        RESULT = 0
        Text_before.text = ""
        Text_per.text = ""
        Result_1.text = "원"
        Result_2.text = "원"
    }
    
    func check() -> Bool
    {
        if BEFORE == ""
        {
            return false
        }
        else if PER == ""
        {
            return false
        }
        return true
    }
    

}
