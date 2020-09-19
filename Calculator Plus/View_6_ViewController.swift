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
    @IBOutlet var Text_born: UITextField!
    
    @IBOutlet var Label_choose1: UILabel!
    @IBOutlet var Label_choose2: UILabel!
    
    @IBOutlet var View_line1: UIView!
    @IBOutlet var View_line2: UIView!
    
    @IBOutlet var Label_result1_show: UILabel!
    @IBOutlet var Label_result2_show: UILabel!
    @IBOutlet var Result_1: UILabel!
    @IBOutlet var Result_2: UILabel!
    @IBOutlet var View_result1_line: UIView!
    @IBOutlet var View_result2_line: UIView!
    
    @IBOutlet var View_line: UIView!
    @IBOutlet var Button_RESET: UIButton!
    
    @IBOutlet var View_View: UIView!
    
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
        
        self.View_View.alpha = 0
        UIView.animate(withDuration: 0.5, animations: {
            self.View_View.alpha = 1
        })
        
        Button_Result_outlet.layer.cornerRadius = 4
        Text_Y_now.keyboardType = .numberPad
        Text_age.keyboardType = .numberPad
        Text_Y_to.keyboardType = .numberPad
        Text_born.keyboardType = .numberPad
        
        self.hideKeyboard()
        super.viewDidLoad()
        
        //animation
        self.View_line.transform = CGAffineTransform(translationX: 0, y: -108)
        self.Label_result1_show.alpha = 0
        self.Label_result2_show.alpha = 0
        self.Result_1.alpha = 0
        self.Result_2.alpha = 0
        self.View_result1_line.alpha = 0
        self.View_result2_line.alpha = 0
        self.Label_result1_show.transform = CGAffineTransform(translationX: 0, y: -10)
        self.Label_result2_show.transform = CGAffineTransform(translationX: 0, y: -10)
        self.Result_1.transform = CGAffineTransform(translationX: 0, y: -10)
        self.Result_2.transform = CGAffineTransform(translationX: 0, y: -10)
        self.View_result1_line.transform = CGAffineTransform(translationX: 0, y: -10)
        self.View_result2_line.transform = CGAffineTransform(translationX: 0, y: -10)
        self.Button_RESET.transform = CGAffineTransform(translationX: 0, y: -108)
        
        //color
        self.Button_Result_outlet.backgroundColor = self.GRAY
        self.Label_choose1.textColor = self.GRAY
        self.Label_choose2.textColor = self.GRAY
        self.View_line1.backgroundColor = self.GRAY
        self.View_line2.backgroundColor = self.GRAY
        //action
        Text_Y_now.addTarget(self, action: #selector(textFieldDidChange3(textField:)), for: UIControl.Event.editingChanged)
        Text_Y_to.addTarget(self, action: #selector(textFieldDidChange3(textField:)), for: UIControl.Event.editingChanged)
        Text_age.addTarget(self, action: #selector(textFieldDidChange1(textField:)), for: UIControl.Event.editingChanged)
        Text_born.addTarget(self, action: #selector(textFieldDidChange2(textField:)), for: UIControl.Event.editingChanged)
        
        //우측상단버튼 생성
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "icon_bar"), for: .normal)
        button.addTarget(self, action: #selector(fbButtonPressed), for: .touchUpInside)
        button.frame = CGRect(x: 0, y: 0, width: 43, height: 51)
        let barButton = UIBarButtonItem(customView: button)
        self.navigationItem.rightBarButtonItem = barButton
    }
    //This method will call when you press button.
    @objc func fbButtonPressed() {
        performSegue(withIdentifier: "showNomal", sender: self)
    }
    
    @objc func textFieldDidChange1(textField: UITextField){
        Text_born.text = ""
        NOW = Text_Y_now.text!
        AGE = Text_age.text!
        TO = Text_Y_to.text!
        BORN = Text_born.text!
        UIView.animate(withDuration: 0.5, animations: {
            self.Label_choose1.textColor = self.BUTTON
            self.View_line1.backgroundColor = self.BUTTON
            self.Label_choose2.textColor = self.GRAY
            self.View_line2.backgroundColor = self.GRAY
        })
        if(check())
        {
            UIView.animate(withDuration: 0.5, animations: {
                self.Button_Result_outlet.backgroundColor = self.BUTTON
            })
        }
        else
        {
            UIView.animate(withDuration: 0.5, animations: {
                self.Button_Result_outlet.backgroundColor = self.GRAY
            })
        }
    }
    @objc func textFieldDidChange2(textField: UITextField){
        Text_age.text = ""
        NOW = Text_Y_now.text!
        AGE = Text_age.text!
        TO = Text_Y_to.text!
        BORN = Text_born.text!
        UIView.animate(withDuration: 0.5, animations: {
            self.Label_choose1.textColor = self.GRAY
            self.View_line1.backgroundColor = self.GRAY
            self.Label_choose2.textColor = self.BUTTON
            self.View_line2.backgroundColor = self.BUTTON
        })
        if(check())
        {
            UIView.animate(withDuration: 0.5, animations: {
                self.Button_Result_outlet.backgroundColor = self.BUTTON
            })
        }
        else
        {
            UIView.animate(withDuration: 0.5, animations: {
                self.Button_Result_outlet.backgroundColor = self.GRAY
            })
        }
    }
    
    @objc func textFieldDidChange3(textField: UITextField){
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
        else
        {
            UIView.animate(withDuration: 0.5, animations: {
                self.Button_Result_outlet.backgroundColor = self.GRAY
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
                self.View_line.transform = CGAffineTransform(translationX: 0, y: 0)
                self.Button_RESET.transform = CGAffineTransform(translationX: 0, y: 0)
            })
            
            UIView.animate(withDuration: 0.7, animations: {
                self.Label_result1_show.alpha = 1
                self.Label_result2_show.alpha = 1
                self.Result_1.alpha = 1
                self.Result_2.alpha = 1
                self.View_result1_line.alpha = 1
                self.View_result2_line.alpha = 1
                self.Label_result1_show.transform = CGAffineTransform(translationX: 0, y: 0)
                self.Label_result2_show.transform = CGAffineTransform(translationX: 0, y: 0)
                self.Result_1.transform = CGAffineTransform(translationX: 0, y: 0)
                self.Result_2.transform = CGAffineTransform(translationX: 0, y: 0)
                self.View_result1_line.transform = CGAffineTransform(translationX: 0, y: 0)
                self.View_result2_line.transform = CGAffineTransform(translationX: 0, y: 0)
            })
            self.view.endEditing(true)
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
//        Result_1.text = "년"
//        Result_2.text = "살"
        Text_born.text = ""
        UIView.animate(withDuration: 0.5, animations: {
            self.View_line.transform = CGAffineTransform(translationX: 0, y: -108)
            self.Label_result1_show.alpha = 0
            self.Label_result2_show.alpha = 0
            self.Result_1.alpha = 0
            self.Result_2.alpha = 0
            self.View_result1_line.alpha = 0
            self.View_result2_line.alpha = 0
            self.Label_result1_show.transform = CGAffineTransform(translationX: 0, y: -10)
            self.Label_result2_show.transform = CGAffineTransform(translationX: 0, y: -10)
            self.Result_1.transform = CGAffineTransform(translationX: 0, y: -10)
            self.Result_2.transform = CGAffineTransform(translationX: 0, y: -10)
            self.View_result1_line.transform = CGAffineTransform(translationX: 0, y: -10)
            self.View_result2_line.transform = CGAffineTransform(translationX: 0, y: -10)
            self.Button_RESET.transform = CGAffineTransform(translationX: 0, y: -108)
            
            //color
            self.Button_Result_outlet.backgroundColor = self.GRAY
            self.Label_choose1.textColor = self.GRAY
            self.Label_choose2.textColor = self.GRAY
            self.View_line1.backgroundColor = self.GRAY
            self.View_line2.backgroundColor = self.GRAY
        })
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
