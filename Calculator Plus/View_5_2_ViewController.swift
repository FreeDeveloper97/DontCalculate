//
//  View_5_2_ViewController.swift
//  Calculator Plus
//
//  Created by Min_MacBook Pro on 2020/04/08.
//  Copyright © 2020 FreeDeveloper. All rights reserved.
//

import UIKit

class View_5_2_ViewController: UIViewController {

    @IBOutlet var View_1: UIView!
    @IBOutlet var Text_start: UITextField!
    @IBOutlet var Text_dday: UITextField!
    @IBOutlet var Button_Result_outlet: UIButton!
    @IBOutlet var View_Result: UIView!
    @IBOutlet var Result_day: UILabel!
    @IBOutlet var Result_H: UILabel!
    @IBOutlet var Result_M: UILabel!
    @IBOutlet var Result_S: UILabel!
    
    private var datePicker: UIDatePicker?
    
    var START = ""
    var DDAY = ""
    var temp = 0
    var plus = 0.0
    
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
        
        datePicker = UIDatePicker()
        datePicker?.datePickerMode = .date
        datePicker?.locale = NSLocale(localeIdentifier: "ko_KO") as Locale
        datePicker?.addTarget(self, action: #selector(View_5_2_ViewController.dateChanged(datePicker:)), for: .valueChanged)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(View_5_2_ViewController.viewTapped(gestureRecognizer:)))
        view.addGestureRecognizer(tapGesture)
        
        Text_start.inputView = datePicker
        Text_dday.keyboardType = .numberPad
        
        self.hideKeyboard()
        
        super.viewDidLoad()

    }
    
    @IBAction func Button_Result(_ sender: UIButton) {
        START = Text_start.text!
        DDAY = Text_dday.text!
        temp = Int(DDAY)!
        plus = Double(temp * 86400)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let startDay = dateFormatter.date(from: START)!
        let endDay = startDay.addingTimeInterval(plus)
        Result_day.text = dateFormatter.string(from: endDay) + " 일"
        temp = temp*24
        Result_H.text = String(temp) + " H"
        temp = temp * 60
        Result_M.text = String(temp) + " M"
        temp = temp * 60
        Result_S.text = String(temp) + " S"
    }
    
    @IBAction func Button_reset(_ sender: UIButton) {
        START = ""
        DDAY = ""
        temp = 0
        plus = 0.0
        Text_start.text = ""
        Text_dday.text = ""
        Result_day.text = "일"
        Result_H.text = "H"
        Result_M.text = "M"
        Result_S.text = "S"
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
    }
    
    func textFieldDidBeginEditting(_ textField: UITextField)
    {
        if textField == Text_start
        {
            datePicker?.datePickerMode = .date
        }
    }

}
