//
//  View_3_1_ViewController.swift
//  Calculator Plus
//
//  Created by Min_MacBook Pro on 2020/03/26.
//  Copyright © 2020 FreeDeveloper. All rights reserved.
//

import UIKit

class View_3_1_ViewController: UIViewController {
    
    @IBOutlet var Text_use: UITextField!
    @IBOutlet var Text_per: UITextField!
    @IBOutlet var Button_Result_outlet: UIButton!
    @IBOutlet var Result_1: UILabel!
    
    @IBOutlet weak var Label_result_show: UILabel!
    @IBOutlet weak var View_result_line: UIView!
    @IBOutlet weak var View_line: UIView!
    @IBOutlet weak var Button_RESET: UIButton!
    
    @IBOutlet weak var View_View: UIView!
    
    var USE = ""
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
        Text_use.keyboardType = .numberPad
        Text_per.keyboardType = .decimalPad
        
        self.hideKeyboard()
        super.viewDidLoad()
        
        //animation
        self.Button_Result_outlet.backgroundColor = self.GRAY
        self.Label_result_show.alpha = 0
        self.Result_1.alpha = 0
        self.View_result_line.alpha = 0
        self.Label_result_show.transform = CGAffineTransform(translationX: 0, y: -10)
        self.Result_1.transform = CGAffineTransform(translationX: 0, y: -10)
        self.View_result_line.transform = CGAffineTransform(translationX: 0, y: -10)
        self.View_line.transform = CGAffineTransform(translationX: 0, y: -62)
        self.Button_RESET.transform = CGAffineTransform(translationX: 0, y: -62)
        
        //action
        Text_use.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: UIControl.Event.editingChanged)
        Text_per.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: UIControl.Event.editingChanged)
    }
    
    @objc func textFieldDidChange(textField: UITextField){
        USE = Text_use.text!
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
        USE = Text_use.text!
        PER = Text_per.text!
        if(check())
        {
            temp = Double(USE)! * Double(PER)! * 0.01
            RESULT = Int(temp)
            Result_1.text = inputComma(innum: RESULT) + " P"
            
            UIView.animate(withDuration: 0.5, animations: {
                self.Button_Result_outlet.backgroundColor = self.GRAY
                self.View_line.transform = CGAffineTransform(translationX: 0, y: 0)
                self.Button_RESET.transform = CGAffineTransform(translationX: 0, y: 0)
            })
            
            UIView.animate(withDuration: 0.7, animations: {
                self.Label_result_show.alpha = 1
                self.Result_1.alpha = 1
                self.View_result_line.alpha = 1
                self.Label_result_show.transform = CGAffineTransform(translationX: 0, y: 0)
                self.Result_1.transform = CGAffineTransform(translationX: 0, y: 0)
                self.View_result_line.transform = CGAffineTransform(translationX: 0, y: 0)
            })
            self.view.endEditing(true)
        }
    }
    
    @IBAction func Button_reset(_ sender: UIButton) {
        USE = ""
        PER = ""
        temp = 0.0
        RESULT = 0
        Text_use.text = ""
        Text_per.text = ""
//        Result_1.text = ""
        
        UIView.animate(withDuration: 0.5, animations: {
            self.Button_Result_outlet.backgroundColor = self.GRAY
            self.Label_result_show.alpha = 0
            self.Result_1.alpha = 0
            self.View_result_line.alpha = 0
            self.Label_result_show.transform = CGAffineTransform(translationX: 0, y: -10)
            self.Result_1.transform = CGAffineTransform(translationX: 0, y: -10)
            self.View_result_line.transform = CGAffineTransform(translationX: 0, y: -10)
            self.View_line.transform = CGAffineTransform(translationX: 0, y: -62)
            self.Button_RESET.transform = CGAffineTransform(translationX: 0, y: -62)
        })
    }
    
    func check() -> Bool
    {
        if USE == ""
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
