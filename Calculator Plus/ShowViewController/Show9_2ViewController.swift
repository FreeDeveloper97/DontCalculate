//
//  View_8_2_ViewController.swift
//  Calculator Plus
//
//  Created by Min_MacBook Pro on 2020/03/26.
//  Copyright © 2020 FreeDeveloper. All rights reserved.
//

import UIKit

class Show9_2ViewController: UIViewController {

    @IBOutlet var Text_now: UITextField!
    @IBOutlet var Text_plus: UITextField!
    @IBOutlet var Text_card: UITextField!
    @IBOutlet var Text_save: UITextField!
    @IBOutlet var Button_Result_outlet: UIButton!
    @IBOutlet var Button_plus_outlet: UIButton!
    @IBOutlet var Text_M: UITextField!
    
    @IBOutlet var Label_sum_show: UILabel!
    @IBOutlet var Show_card: UILabel!
    @IBOutlet var View_sum_line: UIView!
    
    @IBOutlet var Label_result1_show: UILabel!
    @IBOutlet var Label_result2_show: UILabel!
    @IBOutlet var Label_result3_show: UILabel!
    
    @IBOutlet var Result_1: UILabel!
    @IBOutlet var Result_2: UILabel!
    @IBOutlet var Result_3: UILabel!
    
    @IBOutlet var View_result1_line: UIView!
    @IBOutlet var View_result2_line: UIView!
    @IBOutlet var View_result3_line: UIView!
    
    @IBOutlet var View_line: UIView!
    @IBOutlet var Button_kakao_outlet: UIButton!
    @IBOutlet var Button_RESET: UIButton!
    
    @IBOutlet var View_View: UIView!
    @IBOutlet var View_dottedline: UIView!
    
    var NOW = ""
    var Plus = ""
    var PLUS = 0
    var CARD = ""
    var SAVE = ""
    var MINUS = 0
    var RESULT = 0
    var M = "?"
    var KAKAO_PRINT = ""
    var detail = ""
    
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
        setDottedLine()
    }

    @objc func fbButtonPressed() {
        goToCalculater()
    }
    @objc func textFieldDidChange1(textField: UITextField){
        algoOfTextChange1()
    }
    @objc func textFieldDidChange2(textField: UITextField){
        algoOfTextChange2()
    }
    
    @IBAction func Button_plus(_ sender: UIButton) {
        algoOfPlus()
    }
    @IBAction func Button_Result(_ sender: UIButton) {
        algoOfResult()
    }
    @IBAction func Button_kakao(_ sender: UIButton) {
        Kakao.sendData(data: KAKAO_PRINT)
    }
    @IBAction func Button_reset(_ sender: UIButton) {
        reset()
        UIView.animate(withDuration: 0.5, animations: {
            self.resetColor()
            self.resetAlpha()
            self.resetTransform()
        })
        self.view.endEditing(true)
    }
}



extension Show9_2ViewController {
    
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
    
    func beforeCheck() {
        M = Text_M.text!
        NOW = Text_now.text!
        Plus = Text_plus.text!
        SAVE = Text_save.text!
    }
    
    func check() -> Bool {
        if NOW == "" {
            return false
        } else if Plus == "" {
            return false
        } else if MINUS == 0 {
            return false
        } else if SAVE == "" {
            return false
        }
        if M == "" {
            M = "?"
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
        self.Button_plus_outlet.backgroundColor = self.GRAY
        self.Label_sum_show.textColor = self.GRAY
        self.Show_card.textColor = self.GRAY
        self.View_sum_line.backgroundColor = self.GRAY
        self.Button_Result_outlet.backgroundColor = self.GRAY
    }
    
    func setRadius() {
        Button_plus_outlet.layer.cornerRadius = 4
        Button_Result_outlet.layer.cornerRadius = 4
        Button_kakao_outlet.layer.cornerRadius = 4
    }
    
    func setAlpha() {
        self.Label_result1_show.alpha = 0
        self.Label_result2_show.alpha = 0
        self.Label_result3_show.alpha = 0
        self.Result_1.alpha = 0
        self.Result_2.alpha = 0
        self.Result_3.alpha = 0
        self.View_result1_line.alpha = 0
        self.View_result2_line.alpha = 0
        self.View_result3_line.alpha = 0
        self.Button_kakao_outlet.alpha = 0
    }
    
    func setTransform() {
        self.Label_result1_show.transform = CGAffineTransform(translationX: 0, y: -10)
        self.Label_result2_show.transform = CGAffineTransform(translationX: 0, y: -10)
        self.Label_result3_show.transform = CGAffineTransform(translationX: 0, y: -10)
        self.Result_1.transform = CGAffineTransform(translationX: 0, y: -10)
        self.Result_2.transform = CGAffineTransform(translationX: 0, y: -10)
        self.Result_3.transform = CGAffineTransform(translationX: 0, y: -10)
        self.View_result1_line.transform = CGAffineTransform(translationX: 0, y: -10)
        self.View_result2_line.transform = CGAffineTransform(translationX: 0, y: -10)
        self.View_result3_line.transform = CGAffineTransform(translationX: 0, y: -10)
        self.Button_kakao_outlet.transform = CGAffineTransform(translationX: 0, y: -10)
        
        self.View_line.transform = CGAffineTransform(translationX: 0, y: -154)
        self.Button_RESET.transform = CGAffineTransform(translationX: 0, y: -180)
    }
    
    func showAnimation() {
        self.View_View.alpha = 0
        UIView.animate(withDuration: 0.5, animations: {
            self.View_View.alpha = 1
        })
    }
    
    func setInputType() {
        Text_M.keyboardType = .numberPad
        Text_now.keyboardType = .numberPad
        Text_plus.keyboardType = .numberPad
        Text_card.keyboardType = .numberPad
        Text_save.keyboardType = .numberPad
    }
    
    func setInputChanged() {
        Text_M.addTarget(self, action: #selector(textFieldDidChange1(textField:)),
            for: UIControl.Event.editingChanged)
        Text_now.addTarget(self, action: #selector(textFieldDidChange1(textField:)),
            for: UIControl.Event.editingChanged)
        Text_plus.addTarget(self, action: #selector(textFieldDidChange1(textField:)),
            for: UIControl.Event.editingChanged)
        Text_save.addTarget(self, action: #selector(textFieldDidChange1(textField:)),
            for: UIControl.Event.editingChanged)
        Text_card.addTarget(self, action: #selector(textFieldDidChange2(textField:)),
            for: UIControl.Event.editingChanged)
    }
    
    func setDottedLine() {
        View_dottedline.backgroundColor = UIColor.clear
        View_dottedline.addDashedBorder()
    }
    
    func showPlusAnimation() {
        UIView.animate(withDuration: 0.5, animations: {
            self.Button_plus_outlet.backgroundColor = self.GRAY
            self.Label_sum_show.textColor = self.BUTTON
            self.Show_card.textColor = self.BUTTON
            self.View_sum_line.backgroundColor = self.BUTTON
        })
    }
    
    func showResultAnimation() {
        UIView.animate(withDuration: 0.5, animations: {
            self.View_line.transform = CGAffineTransform(translationX: 0, y: 0)
            self.Button_RESET.transform = CGAffineTransform(translationX: 0, y: 0)
            self.Button_plus_outlet.backgroundColor = self.GRAY
            self.Button_Result_outlet.backgroundColor = self.GRAY
        })
        
        UIView.animate(withDuration: 0.7, animations: {
            self.Label_result1_show.alpha = 1
            self.Label_result2_show.alpha = 1
            self.Label_result3_show.alpha = 1
            self.Result_1.alpha = 1
            self.Result_2.alpha = 1
            self.Result_3.alpha = 1
            self.View_result1_line.alpha = 1
            self.View_result2_line.alpha = 1
            self.View_result3_line.alpha = 1
            self.Button_kakao_outlet.alpha = 1
            
            self.Label_result1_show.transform = CGAffineTransform(translationX: 0, y: 0)
            self.Label_result2_show.transform = CGAffineTransform(translationX: 0, y: 0)
            self.Label_result3_show.transform = CGAffineTransform(translationX: 0, y: 0)
            self.Result_1.transform = CGAffineTransform(translationX: 0, y: 0)
            self.Result_2.transform = CGAffineTransform(translationX: 0, y: 0)
            self.Result_3.transform = CGAffineTransform(translationX: 0, y: 0)
            self.View_result1_line.transform = CGAffineTransform(translationX: 0, y: 0)
            self.View_result2_line.transform = CGAffineTransform(translationX: 0, y: 0)
            self.View_result3_line.transform = CGAffineTransform(translationX: 0, y: 0)
            self.Button_kakao_outlet.transform = CGAffineTransform(translationX: 0, y: 0)
        })
    }
    
    func reset() {
        NOW = ""
        Plus = ""
        PLUS = 0
        CARD = ""
        SAVE = ""
        MINUS = 0
        RESULT = 0
        M = "?"
        KAKAO_PRINT = ""
        detail = ""
        Text_now.text = ""
        Text_plus.text = ""
        Text_card.text = ""
        Text_save.text = ""
        Show_card.text = "원"
        Text_M.text = ""
    }
    
    func resetColor() {
        self.Button_plus_outlet.backgroundColor = self.GRAY
        self.Label_sum_show.textColor = self.GRAY
        self.Show_card.textColor = self.GRAY
        self.View_sum_line.backgroundColor = self.GRAY
        self.Button_Result_outlet.backgroundColor = self.GRAY
    }
    
    func resetAlpha() {
        self.Label_result1_show.alpha = 0
        self.Label_result2_show.alpha = 0
        self.Label_result3_show.alpha = 0
        self.Result_1.alpha = 0
        self.Result_2.alpha = 0
        self.Result_3.alpha = 0
        self.View_result1_line.alpha = 0
        self.View_result2_line.alpha = 0
        self.View_result3_line.alpha = 0
        self.Button_kakao_outlet.alpha = 0
    }
    
    func resetTransform() {
        self.Label_result1_show.transform = CGAffineTransform(translationX: 0, y: -10)
        self.Label_result2_show.transform = CGAffineTransform(translationX: 0, y: -10)
        self.Label_result3_show.transform = CGAffineTransform(translationX: 0, y: -10)
        self.Result_1.transform = CGAffineTransform(translationX: 0, y: -10)
        self.Result_2.transform = CGAffineTransform(translationX: 0, y: -10)
        self.Result_3.transform = CGAffineTransform(translationX: 0, y: -10)
        self.View_result1_line.transform = CGAffineTransform(translationX: 0, y: -10)
        self.View_result2_line.transform = CGAffineTransform(translationX: 0, y: -10)
        self.View_result3_line.transform = CGAffineTransform(translationX: 0, y: -10)
        self.Button_kakao_outlet.transform = CGAffineTransform(translationX: 0, y: -10)
        
        self.View_line.transform = CGAffineTransform(translationX: 0, y: -154)
        self.Button_RESET.transform = CGAffineTransform(translationX: 0, y: -180)
    }
}



extension Show9_2ViewController {
    
    func algoOfTextChange1() {
        beforeCheck()
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
    
    func algoOfTextChange2() {
        beforeCheck()
        CARD = Text_card.text!
        if(CARD != "") {
            UIView.animate(withDuration: 0.5, animations: {
                self.Button_plus_outlet.backgroundColor = self.BUTTON
            })
        } else {
            UIView.animate(withDuration: 0.5, animations: {
                self.Button_plus_outlet.backgroundColor = self.GRAY
            })
        }
    }
    
    func algoOfPlus() {
        CARD = Text_card.text!
        if(CARD != "") {
            MINUS += Int(CARD)!
            Show_card.text = inputComma(innum: MINUS) + " 원"
            Text_card.text = ""
            
            if(detail == "") {
                detail = "- " + inputComma(innum: Int(CARD)!) + " 원"
            } else if(detail != "") {
                detail += "\n- " + inputComma(innum: Int(CARD)!) + " 원"
            }
            
            showPlusAnimation()
            if(check()) {
                UIView.animate(withDuration: 0.5, animations: {
                    self.Button_Result_outlet.backgroundColor = self.BUTTON
                })
            }
        }
    }
    
    func algoOfResult() {
        beforeCheck()
        if(check()) {
            PLUS = Int(NOW)! + Int(Plus)!
            MINUS += Int(SAVE)!
            Result_1.text = inputComma(innum: PLUS) + " 원"
            Result_2.text = "- " + inputComma(innum: MINUS) + " 원"
            Result_3.text = inputComma(innum: (PLUS-MINUS)) + " 원"
            
            KAKAO_PRINT = M + "월달 카드대금납부"
            KAKAO_PRINT += "\n\n현재 잔액 : " + inputComma(innum: Int(NOW)!) + " 원"
            KAKAO_PRINT += "\n수입 금액 : " + inputComma(innum: Int(Plus)!) + " 원"
            KAKAO_PRINT += "\n\n잔액+수입 : " + inputComma(innum: PLUS) + " 원"
            KAKAO_PRINT += "\n지출 금액 : -" + inputComma(innum: MINUS) + " 원"
            KAKAO_PRINT += "\n최종 금액 : " + inputComma(innum: (PLUS-MINUS)) + " 원"
            KAKAO_PRINT += "\n\n지출 내역\n" + detail
            KAKAO_PRINT += "\n- " + inputComma(innum: Int(SAVE)!) + " 원(적금)"
            
            showResultAnimation()
            self.view.endEditing(true)
        }
    }
}
