//
//  View_6_ViewController.swift
//  Calculator Plus
//
//  Created by Min_MacBook Pro on 2020/03/26.
//  Copyright © 2020 FreeDeveloper. All rights reserved.
//

import UIKit

class View_6_ViewController: UIViewController {

    @IBOutlet var Text_Y_now: UITextField!
    @IBOutlet var Text_age: UITextField!
    @IBOutlet var Text_Y_to: UITextField!
    @IBOutlet var Button_Result_outlet: UIButton!
    @IBOutlet var Result_1: UILabel!
    @IBOutlet var Result_2: UILabel!
    @IBOutlet weak var Text_born: UITextField!
    
    var NOW = ""
    var TO = ""
    var AGE = ""
    var BORN = ""
    var SUB = 0
    var RESULT = 0
    var PRINT = ""
    
    let GRAY = UIColor(named: "ColorGray")
    let BUTTON = UIColor(named: "button")
    
    override func viewDidLoad() {
        
        Button_Result_outlet.layer.cornerRadius = 4
        Text_Y_now.keyboardType = .numberPad
        Text_age.keyboardType = .numberPad
        Text_Y_to.keyboardType = .numberPad
        
        self.hideKeyboard()
        super.viewDidLoad()
        
        //animation
        
        //color
        self.Button_Result_outlet.backgroundColor = self.GRAY
        //action
        Text_age.addTarget(self, action: #selector(textFieldDidChange1(textField:)), for: UIControl.Event.editingChanged)
        Text_born.addTarget(self, action: #selector(textFieldDidChange2(textField:)), for: UIControl.Event.editingChanged)
    }
    
    @objc func textFieldDidChange1(textField: UITextField){
        Text_born.text = ""
        NOW = Text_Y_now.text!
        AGE = Text_age.text!
        TO = Text_Y_to.text!
        BORN = Text_born.text!
        if(check())
        {
            UIView.animate(withDuration: 0.5, animations: {
                self.Button_Result_outlet.backgroundColor = self.BUTTON
            })
        }
    }
    @objc func textFieldDidChange2(textField: UITextField){
        Text_age.text = ""
        NOW = Text_Y_now.text!
        AGE = Text_age.text!
        TO = Text_Y_to.text!
        BORN = Text_born.text!
        if(check())
        {
            UIView.animate(withDuration: 0.5, animations: {
                self.Button_Result_outlet.backgroundColor = self.BUTTON
            })
        }
    }
    
    @IBAction func Button_Result(_ sender: UIButton) {
        NOW = Text_Y_now.text!
        AGE = Text_age.text!
        TO = Text_Y_to.text!
        BORN = Text_born.text!
        if(check())
        {
            SUB = Int(NOW)! - Int(TO)!
            print("년도차 : " + String(SUB))
            if(AGE != "")
            {
                if(SUB > 0 ) //과거
                {
                    RESULT = Int(AGE)! - SUB
                    print("나이1 : " + String(RESULT))
                    Print()
                    Result_1.text = "-" + String(SUB) + "년 (과거)"
                    Result_2.text = PRINT
                }
                else if(SUB <= 0) //미래
                {
                    RESULT = Int(AGE)! - SUB
                    print("나이2 : " + String(RESULT))
                    Result_1.text = String(-SUB) + "년 (미래)"
                    Result_2.text = String(RESULT) + " 살"
                }
            }
            else if(BORN != "")
            {
                if(SUB > 0)//과거
                {
                    RESULT = Int(TO)! - Int(BORN)! + 1
                    print("나이3: " + String(RESULT))
                    Print()
                    Result_1.text = "-" + String(SUB) + "년 (과거)"
                    Result_2.text = PRINT
                }
                else if(SUB <= 0) //미래
                {
                    RESULT = Int(NOW)! - Int(BORN)! + 1 - SUB
                    print("나이4 : " + String(RESULT))
                    Result_1.text = String(-SUB) + "년 (미래)"
                    Result_2.text = String(RESULT) + " 살"
                }
            }
            
            UIView.animate(withDuration: 0.5, animations: {
                self.Button_Result_outlet.backgroundColor = self.GRAY
            })
            
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
        Text_born.text = ""
    }
    
    func check() -> Bool
    {
        if NOW == ""
        {
            return false
        }
        if TO == ""
        {
            return false
        }
        if AGE != ""
        {
            return true
        }
        if BORN != ""
        {
            return true
        }
        return false
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
        else
        {
            PRINT = String(RESULT) + " 살"
        }
    }
    
    

}
