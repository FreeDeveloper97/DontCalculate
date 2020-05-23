//
//  View_5_ViewController.swift
//  Calculator Plus
//
//  Created by Min_MacBook Pro on 2020/03/26.
//  Copyright © 2020 FreeDeveloper. All rights reserved.
//

import UIKit

class View_5_1_ViewController: UIViewController {

    @IBOutlet var View_1: UIView!
    @IBOutlet var Text_start: UITextField!
    @IBOutlet var Text_end: UITextField!
    @IBOutlet var Button_Result_outlet: UIButton!
    @IBOutlet var View_Result: UIView!
    @IBOutlet var Result_D: UILabel!
    @IBOutlet var Result_H: UILabel!
    @IBOutlet var Result_M: UILabel!
    @IBOutlet var Result_S: UILabel!
    
    private var datePicker: UIDatePicker?
    
    var START = ""
    var END = ""
    
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
        datePicker?.addTarget(self, action: #selector(View_5_1_ViewController.dateChanged(datePicker:)), for: .valueChanged)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(View_5_1_ViewController.viewTapped(gestureRecognizer:)))
        view.addGestureRecognizer(tapGesture)
        
        Text_start.inputView = datePicker
        Text_end.inputView = datePicker
        
        self.hideKeyboard()
        super.viewDidLoad()
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
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let startDay = dateFormatter.date(from: START)!
        let endDay = dateFormatter.date(from: END)!
        let interval = endDay.timeIntervalSince(startDay)
        var days = Int(interval) / 86400
        
        Result_D.text = String(days) + " D"
        days = days*24
        Result_H.text = String(days) + " H"
        days = days*60
        Result_M.text = String(days) + " M"
        days = days*60
        Result_S.text = String(days) + " S"
        
    }
    
    @IBAction func Button_reset(_ sender: UIButton) {
        START = ""
        END = ""
        Result_D.text = "D"
        Result_H.text = "H"
        Result_M.text = "M"
        Result_S.text = "S"
        Text_start.text = ""
        Text_end.text = ""
    }
    
    
}
