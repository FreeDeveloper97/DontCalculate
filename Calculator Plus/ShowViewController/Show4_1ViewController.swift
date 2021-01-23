//
//  View_3_1_ViewController.swift
//  Calculator Plus
//
//  Created by Min_MacBook Pro on 2020/03/26.
//  Copyright © 2020 FreeDeveloper. All rights reserved.
//

import UIKit

class Show4_1ViewController: UIViewController {
    
    @IBOutlet var Text_use: UITextField!
    @IBOutlet var Text_per: UITextField!
    @IBOutlet var Button_Result_outlet: UIButton!
    @IBOutlet var Result_1: UILabel!
    
    @IBOutlet var Label_result_show: UILabel!
    @IBOutlet var View_result_line: UIView!
    @IBOutlet var View_line: UIView!
    @IBOutlet var Button_RESET: UIButton!
    
    @IBOutlet var View_View: UIView!
    
    var USE = ""
    var PER = ""
    var temp = 0.0
    var RESULT = 0
    
    let GRAY = UIColor(named: "ColorGray")
    let BUTTON = UIColor(named: "button")

    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboard()
        
        setColor()
        setRadius()
        setAlpha()
        setTransform()
        showAnimation()
        
        setNavigationButton()
        setInputType()
        setInputChanged()
    }
    
    @objc func fbButtonPressed() {
        goToCalculater()
    }
    @objc func textFieldDidChange(textField: UITextField){
        algoOfTextChange()
    }
    
    @IBAction func Button_Result(_ sender: UIButton) {
        USE = Text_use.text!
        PER = Text_per.text!
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
}



extension Show4_1ViewController {
    
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
    
    func check() -> Bool {
        if USE == "" {
            return false
        } else if PER == "" {
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
    
    func setColor() {
        self.Button_Result_outlet.backgroundColor = self.GRAY
    }
    
    func setRadius() {
        Button_Result_outlet.layer.cornerRadius = 4
    }
    
    func setAlpha() {
        self.Label_result_show.alpha = 0
        self.Result_1.alpha = 0
        self.View_result_line.alpha = 0
    }
    
    func showAnimation() {
        self.View_View.alpha = 0
        UIView.animate(withDuration: 0.5, animations: {
            self.View_View.alpha = 1
        })
    }
    
    func setTransform() {
        self.Label_result_show.transform = CGAffineTransform(translationX: 0, y: -10)
        self.Result_1.transform = CGAffineTransform(translationX: 0, y: -10)
        self.View_result_line.transform = CGAffineTransform(translationX: 0, y: -10)
        self.View_line.transform = CGAffineTransform(translationX: 0, y: -62)
        self.Button_RESET.transform = CGAffineTransform(translationX: 0, y: -62)
    }
    
    func setInputType() {
        Text_use.keyboardType = .numberPad
        Text_per.keyboardType = .decimalPad
    }
    
    func setInputChanged() {
        Text_use.addTarget(self, action: #selector(textFieldDidChange(textField:)),
            for: UIControl.Event.editingChanged)
        Text_per.addTarget(self, action: #selector(textFieldDidChange(textField:)),
            for: UIControl.Event.editingChanged)
    }
    
    func reset() {
        USE = ""
        PER = ""
        temp = 0.0
        RESULT = 0
        Text_use.text = ""
        Text_per.text = ""
    }
    
    func resetColor() {
        self.Button_Result_outlet.backgroundColor = self.GRAY
    }
    
    func resetAlpha() {
        self.Label_result_show.alpha = 0
        self.Result_1.alpha = 0
        self.View_result_line.alpha = 0
    }
    
    func resetTransform() {
        self.Label_result_show.transform = CGAffineTransform(translationX: 0, y: -10)
        self.Result_1.transform = CGAffineTransform(translationX: 0, y: -10)
        self.View_result_line.transform = CGAffineTransform(translationX: 0, y: -10)
        self.View_line.transform = CGAffineTransform(translationX: 0, y: -62)
        self.Button_RESET.transform = CGAffineTransform(translationX: 0, y: -62)
    }
}



extension Show4_1ViewController {
    
    func algoOfTextChange() {
        USE = Text_use.text!
        PER = Text_per.text!
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
    
    func algoOfResult() {
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
