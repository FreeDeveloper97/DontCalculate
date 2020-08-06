//
//  View_4_3_ViewController.swift
//  Calculator Plus
//
//  Created by Min_MacBook Pro on 2020/03/26.
//  Copyright © 2020 FreeDeveloper. All rights reserved.
//

import UIKit

class View_4_3_ViewController: UIViewController {

    @IBOutlet var Text_after: UITextField!
    @IBOutlet var Text_per: UITextField!
    @IBOutlet var Button_Result_outlet: UIButton!
    
    @IBOutlet weak var Label_result1_show: UILabel!
    @IBOutlet weak var Label_result2_show: UILabel!
    
    @IBOutlet var Result_1: UILabel!
    @IBOutlet var Result_2: UILabel!
    
    @IBOutlet weak var View_result1_line: UIView!
    @IBOutlet weak var View_result2_line: UIView!
    
    @IBOutlet weak var View_line: UIView!
    @IBOutlet weak var Button_RESET: UIButton!
    
    @IBOutlet weak var View_View: UIView!
    
    var AFTER = ""
    var PER = ""
    var temp = 0.0
    var RESULT = 0
    
    let GRAY = UIColor(named: "ColorGray")
    let BUTTON = UIColor(named: "button")
    
    override func viewDidLoad() {
        
        self.View_View.alpha = 0
        UIView.animate(withDuration: 0.5, animations: {
            self.View_View.alpha = 1
        })

        Button_Result_outlet.layer.cornerRadius = 4
        Text_after.keyboardType = .numberPad
        Text_per.keyboardType = .decimalPad
        
        self.hideKeyboard()
        super.viewDidLoad()
        
        //animation
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
        self.Button_RESET.transform = CGAffineTransform(translationX: 0, y: -109)
        self.View_line.transform = CGAffineTransform(translationX: 0, y: -109)
        
        //color
        self.Button_Result_outlet.backgroundColor = self.GRAY
        //action
        Text_after.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: UIControl.Event.editingChanged)
        Text_per.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: UIControl.Event.editingChanged)
    }
    
    @objc func textFieldDidChange(textField: UITextField){
        AFTER = Text_after.text!
        PER = Text_per.text!
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
        AFTER = Text_after.text!
        PER = Text_per.text!
        if(check())
        {
            RESULT = Int(Double(AFTER)! * 100 / (100 - Double(PER)!))
            Result_1.text = inputComma(innum: RESULT) + " 원"
            Result_2.text = "- " + inputComma(innum: (RESULT - Int(AFTER)!)) + " 원"
            
            UIView.animate(withDuration: 0.5, animations: {
                self.View_line.transform = CGAffineTransform(translationX: 0, y: 0)
                self.Button_RESET.transform = CGAffineTransform(translationX: 0, y: 0)
                self.Button_Result_outlet.backgroundColor = self.GRAY
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
        AFTER = ""
        PER = ""
        temp = 0.0
        RESULT = 0
        Text_after.text = ""
        Text_per.text = ""
//        Result_1.text = "원"
//        Result_2.text = "원"
        
        UIView.animate(withDuration: 0.5, animations: {
            //animation
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
            self.Button_RESET.transform = CGAffineTransform(translationX: 0, y: -109)
            self.View_line.transform = CGAffineTransform(translationX: 0, y: -109)
            
            //color
            self.Button_Result_outlet.backgroundColor = self.GRAY
        })
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
