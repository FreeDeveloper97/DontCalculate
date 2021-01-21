//
//  View_5_ViewController.swift
//  Calculator Plus
//
//  Created by Min_MacBook Pro on 2020/03/26.
//  Copyright © 2020 FreeDeveloper. All rights reserved.
//

import UIKit

class Show6_1ViewController: UIViewController {

    @IBOutlet var Text_start: UITextField!
    @IBOutlet var Text_end: UITextField!
    @IBOutlet var Button_Result_outlet: UIButton!
    
    @IBOutlet weak var Label_result1_show: UILabel!
    @IBOutlet weak var Label_result2_show: UILabel!
    @IBOutlet weak var Label_result3_show: UILabel!
    @IBOutlet weak var Label_result4_show: UILabel!
    
    @IBOutlet var Result_D: UILabel!
    @IBOutlet var Result_H: UILabel!
    @IBOutlet var Result_M: UILabel!
    @IBOutlet var Result_S: UILabel!
    
    @IBOutlet weak var View_result1_line: UIView!
    @IBOutlet weak var View_result2_line: UIView!
    @IBOutlet weak var View_result3_line: UIView!
    @IBOutlet weak var View_result4_line: UIView!
    
    @IBOutlet weak var View_line: UIView!
    @IBOutlet weak var Button_RESET: UIButton!
    
    @IBOutlet weak var View_View: UIView!
    
    
    private var datePicker: UIDatePicker?
    
    var START = ""
    var END = ""
    
    let GRAY = UIColor(named: "ColorGray")
    let BUTTON = UIColor(named: "button")
    
    
    override func viewDidLoad() {
        
        self.View_View.alpha = 0
        UIView.animate(withDuration: 0.5, animations: {
            self.View_View.alpha = 1
        })
        
        Button_Result_outlet.layer.cornerRadius = 4
        datePicker = UIDatePicker()
        datePicker?.datePickerMode = .date
        if #available(iOS 14.0, *) {
            datePicker?.preferredDatePickerStyle = .wheels
        } else {
            // Fallback on earlier versions
        }
        datePicker?.locale = NSLocale(localeIdentifier: "ko_KO") as Locale
        datePicker?.addTarget(self, action: #selector(Show6_1ViewController.dateChanged(datePicker:)), for: .valueChanged)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(Show6_1ViewController.viewTapped(gestureRecognizer:)))
        view.addGestureRecognizer(tapGesture)
        
        Text_start.inputView = datePicker
        Text_end.inputView = datePicker
        
        self.hideKeyboard()
        super.viewDidLoad()
        
        //animation
        self.Label_result1_show.alpha = 0
        self.Label_result2_show.alpha = 0
        self.Label_result3_show.alpha = 0
        self.Label_result4_show.alpha = 0
        self.Result_D.alpha = 0
        self.Result_H.alpha = 0
        self.Result_M.alpha = 0
        self.Result_S.alpha = 0
        self.View_result1_line.alpha = 0
        self.View_result2_line.alpha = 0
        self.View_result3_line.alpha = 0
        self.View_result4_line.alpha = 0
        
        self.Label_result1_show.transform = CGAffineTransform(translationX: 0, y: -10)
        self.Label_result2_show.transform = CGAffineTransform(translationX: 0, y: -10)
        self.Label_result3_show.transform = CGAffineTransform(translationX: 0, y: -10)
        self.Label_result4_show.transform = CGAffineTransform(translationX: 0, y: -10)
        self.Result_D.transform = CGAffineTransform(translationX: 0, y: -10)
        self.Result_H.transform = CGAffineTransform(translationX: 0, y: -10)
        self.Result_M.transform = CGAffineTransform(translationX: 0, y: -10)
        self.Result_S.transform = CGAffineTransform(translationX: 0, y: -10)
        self.View_result1_line.transform = CGAffineTransform(translationX: 0, y: -10)
        self.View_result2_line.transform = CGAffineTransform(translationX: 0, y: -10)
        self.View_result3_line.transform = CGAffineTransform(translationX: 0, y: -10)
        self.View_result4_line.transform = CGAffineTransform(translationX: 0, y: -10)
        self.Button_RESET.transform = CGAffineTransform(translationX: 0, y: -200)
        self.View_line.transform = CGAffineTransform(translationX: 0, y: -200)
        
        //color
        self.Button_Result_outlet.backgroundColor = self.GRAY
        
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
    
    @objc func viewTapped(gestureRecognizer: UITapGestureRecognizer)
    {
        view.endEditing(true)
    }
    @objc func dateChanged(datePicker: UIDatePicker)
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        if Text_start.isFirstResponder
        {
            Text_start.text = dateFormatter.string(from: datePicker.date)
        }
        if Text_end.isFirstResponder
        {
            Text_end.text = dateFormatter.string(from: datePicker.date)
        }
        START = Text_start.text!
        END = Text_end.text!
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
    
    func textFieldDidBeginEditting(_ textField: UITextField)
    {
        if textField == Text_start
        {
            datePicker?.datePickerMode = .date
        }
        if textField == Text_end
        {
            datePicker?.datePickerMode = .date
        }
    }
    
    
    @IBAction func Button_Result(_ sender: UIButton) {
        START = Text_start.text!
        END = Text_end.text!
        if(check())
        {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd"
            let startDay = dateFormatter.date(from: START)!
            let endDay = dateFormatter.date(from: END)!
            let interval = endDay.timeIntervalSince(startDay)
            var days = Int(interval) / 86400
            
            Result_D.text = inputComma(innum: days) + " D"
            days = days*24
            Result_H.text = inputComma(innum: days) + " H"
            days = days*60
            Result_M.text = inputComma(innum: days) + " M"
            days = days*60
            Result_S.text = inputComma(innum: days) + " S"
            
            UIView.animate(withDuration: 0.5, animations: {
                self.View_line.transform = CGAffineTransform(translationX: 0, y: 0)
                self.Button_RESET.transform = CGAffineTransform(translationX: 0, y: 0)
                self.Button_Result_outlet.backgroundColor = self.GRAY
            })
            
            UIView.animate(withDuration: 0.7, animations: {
                //animation
                self.Label_result1_show.alpha = 1
                self.Label_result2_show.alpha = 1
                self.Label_result3_show.alpha = 1
                self.Label_result4_show.alpha = 1
                self.Result_D.alpha = 1
                self.Result_H.alpha = 1
                self.Result_M.alpha = 1
                self.Result_S.alpha = 1
                self.View_result1_line.alpha = 1
                self.View_result2_line.alpha = 1
                self.View_result3_line.alpha = 1
                self.View_result4_line.alpha = 1
                
                self.Label_result1_show.transform = CGAffineTransform(translationX: 0, y: 0)
                self.Label_result2_show.transform = CGAffineTransform(translationX: 0, y: 0)
                self.Label_result3_show.transform = CGAffineTransform(translationX: 0, y: 0)
                self.Label_result4_show.transform = CGAffineTransform(translationX: 0, y: 0)
                self.Result_D.transform = CGAffineTransform(translationX: 0, y: 0)
                self.Result_H.transform = CGAffineTransform(translationX: 0, y: 0)
                self.Result_M.transform = CGAffineTransform(translationX: 0, y: 0)
                self.Result_S.transform = CGAffineTransform(translationX: 0, y: 0)
                self.View_result1_line.transform = CGAffineTransform(translationX: 0, y: 0)
                self.View_result2_line.transform = CGAffineTransform(translationX: 0, y: 0)
                self.View_result3_line.transform = CGAffineTransform(translationX: 0, y: 0)
                self.View_result4_line.transform = CGAffineTransform(translationX: 0, y: 0)
            })
            self.view.endEditing(true)
        }
    }
    
    @IBAction func Button_reset(_ sender: UIButton) {
        START = ""
        END = ""
//        Result_D.text = "D"
//        Result_H.text = "H"
//        Result_M.text = "M"
//        Result_S.text = "S"
        Text_start.text = ""
        Text_end.text = ""
        
        UIView.animate(withDuration: 0.5, animations: {
            //animation
            self.Label_result1_show.alpha = 0
            self.Label_result2_show.alpha = 0
            self.Label_result3_show.alpha = 0
            self.Label_result4_show.alpha = 0
            self.Result_D.alpha = 0
            self.Result_H.alpha = 0
            self.Result_M.alpha = 0
            self.Result_S.alpha = 0
            self.View_result1_line.alpha = 0
            self.View_result2_line.alpha = 0
            self.View_result3_line.alpha = 0
            self.View_result4_line.alpha = 0
            
            self.Label_result1_show.transform = CGAffineTransform(translationX: 0, y: -10)
            self.Label_result2_show.transform = CGAffineTransform(translationX: 0, y: -10)
            self.Label_result3_show.transform = CGAffineTransform(translationX: 0, y: -10)
            self.Label_result4_show.transform = CGAffineTransform(translationX: 0, y: -10)
            self.Result_D.transform = CGAffineTransform(translationX: 0, y: -10)
            self.Result_H.transform = CGAffineTransform(translationX: 0, y: -10)
            self.Result_M.transform = CGAffineTransform(translationX: 0, y: -10)
            self.Result_S.transform = CGAffineTransform(translationX: 0, y: -10)
            self.View_result1_line.transform = CGAffineTransform(translationX: 0, y: -10)
            self.View_result2_line.transform = CGAffineTransform(translationX: 0, y: -10)
            self.View_result3_line.transform = CGAffineTransform(translationX: 0, y: -10)
            self.View_result4_line.transform = CGAffineTransform(translationX: 0, y: -10)
            self.Button_RESET.transform = CGAffineTransform(translationX: 0, y: -200)
            self.View_line.transform = CGAffineTransform(translationX: 0, y: -200)
            
            //color
            self.Button_Result_outlet.backgroundColor = self.GRAY
        })
    }
    
    func check() -> Bool
    {
        if(START == "")
        {
            return false
        }
        if(END == "")
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
