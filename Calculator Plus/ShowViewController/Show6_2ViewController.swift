//
//  View_5_2_ViewController.swift
//  Calculator Plus
//
//  Created by Min_MacBook Pro on 2020/04/08.
//  Copyright © 2020 FreeDeveloper. All rights reserved.
//

import UIKit

class Show6_2ViewController: UIViewController {
    
    @IBOutlet var Text_start: UITextField!
    @IBOutlet var Text_dday: UITextField!
    @IBOutlet var Button_Result_outlet: UIButton!
    
    @IBOutlet weak var Label_result1_show: UILabel!
    @IBOutlet weak var Label_result2_show: UILabel!
    @IBOutlet weak var Label_result3_show: UILabel!
    @IBOutlet weak var Label_result4_show: UILabel!
    
    @IBOutlet var Result_day: UILabel!
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
    @IBOutlet var viewA: UIView!
    @IBOutlet var viewResult: UIView!
    
    var datePicker: UIDatePicker?
    
    var START = ""
    var DDAY = ""
    var temp = 0
    var plus = 0.0
    
    let GRAY = UIColor(named: "ColorGray")
    let BUTTON = UIColor(named: "button")
    var negative: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboard()
        
        setColor()
        setRadius()
        setAlpha()
        setTransform()
        showAnimation()
        
        setNavigationButton()
        setDatePicker()
        setInputType()
        setInputChanged()
    }
    
    @objc func fbButtonPressed() {
        goToCalculater()
    }
    @objc func textFieldDidChange(textField: UITextField){
        algoOfTextChange()
    }
    @objc func viewTapped(gestureRecognizer: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    @objc func dateChanged(datePicker: UIDatePicker) {
        algoOfDateChange()
    }
    
    @IBAction func Button_Result(_ sender: UIButton) {
        START = Text_start.text!
        DDAY = Text_dday.text!
        if(check()) {
            algoOfResult()
        }
        
    }
    @IBAction func Button_reset(_ sender: UIButton) {
        reset()
        UIView.animate(withDuration: 0.5, animations: {
            self.resetColor()
            self.resetAlpha()
            self.resetTransform()
        })
    }
    @IBAction func plusMinus(_ sender: UISwitch) {
        if sender.isOn {
            negative = false
        } else {
            negative = true
        }
        showResultButtonAnimation()
    }
    
}



extension Show6_2ViewController {
    
    func setNavigationButton() {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "icon_bar"), for: .normal)
        button.addTarget(self, action: #selector(fbButtonPressed), for: .touchUpInside)
        button.frame = CGRect(x: 0, y: 0, width: 43, height: 51)
        let barButton = UIBarButtonItem(customView: button)
        self.navigationItem.rightBarButtonItem = barButton
    }
    
    func goToCalculater() {
        let vcName = self.storyboard?.instantiateViewController(withIdentifier: "CalculaterViewController")
                self.present(vcName!, animated: true, completion: nil)
    }
    
    func setColor() {
        self.Button_Result_outlet.backgroundColor = self.GRAY
    }
    
    func textFieldDidBeginEditting(_ textField: UITextField)
    {
        if textField == Text_start {
            datePicker?.datePickerMode = .date
        }
    }
    
    func check() -> Bool {
        if(START == "") {
            return false
        }
        if(DDAY == "") {
            return false
        }
        return true
    }
    
    func inputComma(innum: Int) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        
        let RESULT_COMMA: String = numberFormatter.string(from:NSNumber(value: innum))!
        return RESULT_COMMA
    }
    
    func setRadius() {
        Button_Result_outlet.layer.cornerRadius = 4
        self.viewA.layer.cornerRadius = 12
        self.viewResult.layer.cornerRadius = 12
    }
    
    func setAlpha() {
        self.Label_result1_show.alpha = 0
        self.Label_result2_show.alpha = 0
        self.Label_result3_show.alpha = 0
        self.Label_result4_show.alpha = 0
        self.Result_day.alpha = 0
        self.Result_H.alpha = 0
        self.Result_M.alpha = 0
        self.Result_S.alpha = 0
        self.View_result1_line.alpha = 0
        self.View_result2_line.alpha = 0
        self.View_result3_line.alpha = 0
        self.View_result4_line.alpha = 0
        self.viewResult.alpha = 0
    }
    
    func setTransform() {
        self.Label_result1_show.transform = CGAffineTransform(translationX: 0, y: -10)
        self.Label_result2_show.transform = CGAffineTransform(translationX: 0, y: -10)
        self.Label_result3_show.transform = CGAffineTransform(translationX: 0, y: -10)
        self.Label_result4_show.transform = CGAffineTransform(translationX: 0, y: -10)
        self.Result_day.transform = CGAffineTransform(translationX: 0, y: -10)
        self.Result_H.transform = CGAffineTransform(translationX: 0, y: -10)
        self.Result_M.transform = CGAffineTransform(translationX: 0, y: -10)
        self.Result_S.transform = CGAffineTransform(translationX: 0, y: -10)
        self.View_result1_line.transform = CGAffineTransform(translationX: 0, y: -10)
        self.View_result2_line.transform = CGAffineTransform(translationX: 0, y: -10)
        self.View_result3_line.transform = CGAffineTransform(translationX: 0, y: -10)
        self.View_result4_line.transform = CGAffineTransform(translationX: 0, y: -10)
        self.Button_RESET.transform = CGAffineTransform(translationX: 0, y: -200)
        
        self.View_line.transform = CGAffineTransform(translationX: 0, y: -200)
    }
    
    func showAnimation() {
        self.View_View.alpha = 0
        UIView.animate(withDuration: 0.5, animations: {
            self.View_View.alpha = 1
        })
    }
    
    func setDatePicker() {
        datePicker = UIDatePicker()
        datePicker?.datePickerMode = .date
        if #available(iOS 14.0, *) {
            datePicker?.preferredDatePickerStyle = .wheels
        } else {
            // Fallback on earlier versions
        }
        datePicker?.locale = NSLocale(localeIdentifier: "ko_KO") as Locale
        datePicker?.addTarget(self, action: #selector(Show6_2ViewController.dateChanged(datePicker:)), for: .valueChanged)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(Show6_2ViewController.viewTapped(gestureRecognizer:)))
        view.addGestureRecognizer(tapGesture)
    }
    
    func setInputType() {
        Text_start.inputView = datePicker
        Text_dday.keyboardType = .numberPad
    }
    
    func setInputChanged() {
        Text_dday.addTarget(self, action: #selector(textFieldDidChange(textField:)),
            for: UIControl.Event.editingChanged)
    }
    
    func showResultButtonAnimation() {
        if(check()) {
            UIView.animate(withDuration: 0.5, animations: {
                self.Button_Result_outlet.backgroundColor = self.BUTTON
            })
        } else {
            UIView.animate(withDuration: 0.5, animations: {
                self.Button_Result_outlet.backgroundColor = self.GRAY
            })
        }
    }
    
    func showResultAnimation() {
        UIView.animate(withDuration: 0.5, animations: {
            self.View_line.transform = CGAffineTransform(translationX: 0, y: 0)
            self.Button_RESET.transform = CGAffineTransform(translationX: 0, y: 0)
            self.Button_Result_outlet.backgroundColor = self.GRAY
            self.viewResult.alpha = 1
        })
        
        UIView.animate(withDuration: 0.7, animations: {
            self.Label_result1_show.alpha = 1
            self.Label_result2_show.alpha = 1
            self.Label_result3_show.alpha = 1
            self.Label_result4_show.alpha = 1
            self.Result_day.alpha = 1
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
            self.Result_day.transform = CGAffineTransform(translationX: 0, y: 0)
            self.Result_H.transform = CGAffineTransform(translationX: 0, y: 0)
            self.Result_M.transform = CGAffineTransform(translationX: 0, y: 0)
            self.Result_S.transform = CGAffineTransform(translationX: 0, y: 0)
            self.View_result1_line.transform = CGAffineTransform(translationX: 0, y: 0)
            self.View_result2_line.transform = CGAffineTransform(translationX: 0, y: 0)
            self.View_result3_line.transform = CGAffineTransform(translationX: 0, y: 0)
            self.View_result4_line.transform = CGAffineTransform(translationX: 0, y: 0)
        })
    }
    
    func reset() {
        START = ""
        DDAY = ""
        temp = 0
        plus = 0.0
        Text_start.text = ""
        Text_dday.text = ""
    }
    
    func resetColor() {
        self.Button_Result_outlet.backgroundColor = self.GRAY
    }
    
    func resetAlpha() {
        self.Label_result1_show.alpha = 0
        self.Label_result2_show.alpha = 0
        self.Label_result3_show.alpha = 0
        self.Label_result4_show.alpha = 0
        self.Result_day.alpha = 0
        self.Result_H.alpha = 0
        self.Result_M.alpha = 0
        self.Result_S.alpha = 0
        self.View_result1_line.alpha = 0
        self.View_result2_line.alpha = 0
        self.View_result3_line.alpha = 0
        self.View_result4_line.alpha = 0
        self.viewResult.alpha = 0
    }
    
    func resetTransform() {
        self.Label_result1_show.transform = CGAffineTransform(translationX: 0, y: -10)
        self.Label_result2_show.transform = CGAffineTransform(translationX: 0, y: -10)
        self.Label_result3_show.transform = CGAffineTransform(translationX: 0, y: -10)
        self.Label_result4_show.transform = CGAffineTransform(translationX: 0, y: -10)
        self.Result_day.transform = CGAffineTransform(translationX: 0, y: -10)
        self.Result_H.transform = CGAffineTransform(translationX: 0, y: -10)
        self.Result_M.transform = CGAffineTransform(translationX: 0, y: -10)
        self.Result_S.transform = CGAffineTransform(translationX: 0, y: -10)
        self.View_result1_line.transform = CGAffineTransform(translationX: 0, y: -10)
        self.View_result2_line.transform = CGAffineTransform(translationX: 0, y: -10)
        self.View_result3_line.transform = CGAffineTransform(translationX: 0, y: -10)
        self.View_result4_line.transform = CGAffineTransform(translationX: 0, y: -10)
        self.Button_RESET.transform = CGAffineTransform(translationX: 0, y: -200)
        
        self.View_line.transform = CGAffineTransform(translationX: 0, y: -200)
    }
}



extension Show6_2ViewController {
    
    func algoOfTextChange() {
        START = Text_start.text!
        DDAY = Text_dday.text!
        showResultButtonAnimation()
    }
    
    func algoOfResult() {
        temp = Int(DDAY)!
        if negative {
            temp = -temp
        }
        plus = Double(temp * 86400)
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let startDay = dateFormatter.date(from: START)!
        let endDay = startDay.addingTimeInterval(plus)
        Result_day.text = dateFormatter.string(from: endDay) + " 일"
        
        temp = temp*24
        Result_H.text = inputComma(innum: temp) + " H"
        temp = temp * 60
        Result_M.text = inputComma(innum: temp) + " M"
        temp = temp * 60
        Result_S.text = inputComma(innum: temp) + " S"
        
        showResultAnimation()
        self.view.endEditing(true)
    }
    
    func algoOfDateChange() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        if Text_start.isFirstResponder {
            Text_start.text = dateFormatter.string(from: datePicker?.date ?? Date())
        }
        
        START = Text_start.text!
        DDAY = Text_dday.text!
        
        if(check()) {
            UIView.animate(withDuration: 0.5, animations: {
                self.Button_Result_outlet.backgroundColor = self.BUTTON
            })
        } else {
            UIView.animate(withDuration: 0.5, animations: {
                self.Button_Result_outlet.backgroundColor = self.GRAY
            })
        }
    }
}
