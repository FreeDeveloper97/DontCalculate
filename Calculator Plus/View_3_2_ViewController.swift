//
//  View_3_2_ViewController.swift
//  Calculator Plus
//
//  Created by Min_MacBook Pro on 2020/03/26.
//  Copyright © 2020 FreeDeveloper. All rights reserved.
//

import UIKit

class View_3_2_ViewController: UIViewController {
    
    @IBOutlet var Text_goalPoint: UITextField!
    @IBOutlet var Text_per: UITextField!
    @IBOutlet var Button_Result_outlet: UIButton!
    @IBOutlet var Result_1: UILabel!
    
    @IBOutlet weak var Label_result_show: UILabel!
    @IBOutlet weak var View_result_line: UIView!
    @IBOutlet weak var View_line: UIView!
    
    @IBOutlet weak var Button_RESET: UIButton!
    
    @IBOutlet weak var View_View: UIView!
    
    var GOAL = ""
    var PER = ""
    var RESULT = 0
    
    let GRAY = UIColor(named: "ColorGray")
    let BUTTON = UIColor(named: "button")
    
    override func viewDidLoad() {
    
        self.View_View.alpha = 0
        UIView.animate(withDuration: 0.5, animations: {
            self.View_View.alpha = 1
        })
        
        Button_Result_outlet.layer.cornerRadius = 4
        Text_goalPoint.keyboardType = .numberPad
        Text_per.keyboardType = .decimalPad
        
        self.hideKeyboard()
        super.viewDidLoad()
        
        //animation
        self.Button_Result_outlet.backgroundColor = self.GRAY
        self.Label_result_show.alpha = 0
        self.Result_1.alpha = 0
        self.View_result_line.alpha = 0
        self.Button_RESET.alpha = 0
        self.Label_result_show.transform = CGAffineTransform(translationX: 0, y: -10)
        self.Result_1.transform = CGAffineTransform(translationX: 0, y: -10)
        self.View_result_line.transform = CGAffineTransform(translationX: 0, y: -10)
        self.View_line.transform = CGAffineTransform(translationX: 0, y: -62)
        self.Button_RESET.transform = CGAffineTransform(translationX: 0, y: -10)
        
        //action
        Text_goalPoint.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: UIControl.Event.editingChanged)
        Text_per.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: UIControl.Event.editingChanged)
    }
    
    @objc func textFieldDidChange(textField: UITextField){
        GOAL = Text_goalPoint.text!
        PER = Text_per.text!
        if(check())
        {
            UIView.animate(withDuration: 0.5, animations: {
                self.Button_Result_outlet.backgroundColor = self.BUTTON
            })
        }
    }
    
    @IBAction func Button_Result(_ sender: UIButton) {
        GOAL = Text_goalPoint.text!
        PER = Text_per.text!
        if(check())
        {
            RESULT = Int(Double(GOAL)! * 100 / Double(PER)!)
            Result_1.text = inputComma(innum: RESULT) + " 원"
            
            UIView.animate(withDuration: 0.5, animations: {
                self.Button_Result_outlet.backgroundColor = self.GRAY
                self.View_line.transform = CGAffineTransform(translationX: 0, y: 0)
            })
            
            UIView.animate(withDuration: 0.7, animations: {
                self.Label_result_show.alpha = 1
                self.Result_1.alpha = 1
                self.View_result_line.alpha = 1
                self.Button_RESET.alpha = 1
                self.Label_result_show.transform = CGAffineTransform(translationX: 0, y: 0)
                self.Result_1.transform = CGAffineTransform(translationX: 0, y: 0)
                self.View_result_line.transform = CGAffineTransform(translationX: 0, y: 0)
                self.Button_RESET.transform = CGAffineTransform(translationX: 0, y: 0)
            })
            self.view.endEditing(true)
        }
    }
    
    @IBAction func Button_reset(_ sender: UIButton) {
        GOAL = ""
        PER = ""
        RESULT = 0
        Text_goalPoint.text = ""
        Text_per.text = ""
        Result_1.text = ""
        
        UIView.animate(withDuration: 0.5, animations: {
            self.Button_Result_outlet.backgroundColor = self.GRAY
            self.Label_result_show.alpha = 0
            self.Result_1.alpha = 0
            self.View_result_line.alpha = 0
            self.Button_RESET.alpha = 0
            self.Label_result_show.transform = CGAffineTransform(translationX: 0, y: -10)
            self.Result_1.transform = CGAffineTransform(translationX: 0, y: -10)
            self.View_result_line.transform = CGAffineTransform(translationX: 0, y: -10)
            self.View_line.transform = CGAffineTransform(translationX: 0, y: -62)
            self.Button_RESET.transform = CGAffineTransform(translationX: 0, y: -10)
        })
    }
    
    func check() -> Bool
    {
        if GOAL == ""
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
