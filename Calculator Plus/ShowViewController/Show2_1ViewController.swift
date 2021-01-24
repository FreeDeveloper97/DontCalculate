//
//  View_1_1_ViewController.swift
//  Calculator Plus
//
//  Created by Min_MacBook Pro on 2020/03/19.
//  Copyright © 2020 FreeDeveloper. All rights reserved.
//

import UIKit

class Show2_1ViewController: UIViewController {
    
    @IBOutlet var Input_money: UITextField!
    @IBOutlet var Button_plus_outlet: UIButton!
    @IBOutlet var Text_n: UITextField!
    @IBOutlet var Text_bank: UITextField!
    
    @IBOutlet var Label_money_show: UILabel!
    @IBOutlet var Text_money: UILabel!
    @IBOutlet var View_money_line: UIView!
    
    @IBOutlet var Button_Result_outlet: UIButton!
    
    @IBOutlet var Label_result1_show: UILabel!
    @IBOutlet var Result_1: UILabel!
    @IBOutlet var View_result1_line: UIView!
    
    @IBOutlet var Label_result2_show: UILabel!
    @IBOutlet var Result_2: UILabel!
    @IBOutlet var View_result2_line: UIView!
    
    @IBOutlet var Label_result3_show: UILabel!
    @IBOutlet var Result_3: UILabel!
    @IBOutlet var View_result3_line: UIView!
    
    @IBOutlet var View_Line: UIView!
    
    @IBOutlet var Button_detail_outlet: UIButton!
    @IBOutlet var Button_kakao_outlet: UIButton!
    @IBOutlet var Button_RESET: UIButton!
    @IBOutlet var View_Buttons: UIView!
    
    @IBOutlet var View_View: UIView!
    
    var InputMoney = ""
    var MONEY = 0
    var N = ""
    var RESULT = 0
    var kakao_print = ""
    var DETAIL = ""
    
    var detailShow: Bool = true
    var detailCount: Int = 0
    
    let GRAY = UIColor(named: "ColorGray")
    let BUTTON = UIColor(named: "button")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboard()
        
        setColor()
        setRadius()
        setAlpha()
        setTransform()
        showViewAnimation()
        
        setNavigationButton()
        setInputType()
        setInputChanged()
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
        InputMoney = Input_money.text!
        if(InputMoney != "") {
            algoOfPlus()
        }
    }
    @IBAction func Button_Result(_ sender: UIButton) {
        N = Text_n.text!
        if(check()) {
            algoOfResult()
        }
    }
    @IBAction func Button_detail(_ sender: UIButton) {
        if(RESULT != 0) {
            algoOfDetail()
        }
    }
    @IBAction func Button_kakao(_ sender: UIButton) {
        Kakao.sendData(data: kakao_print)
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




extension Show2_1ViewController {
    
    func setNavigationButton() {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "icon_bar"), for: .normal)
        button.addTarget(self, action: #selector(fbButtonPressed), for: .touchUpInside)
        button.frame = CGRect(x: 0, y: 0, width: 43, height: 51)
        let barButton = UIBarButtonItem(customView: button)
        self.navigationItem.rightBarButtonItem = barButton
    }
    
    func setInputChanged() {
        Input_money.addTarget(self, action: #selector(textFieldDidChange1(textField:)),
            for: UIControl.Event.editingChanged)
        Text_n.addTarget(self, action: #selector(textFieldDidChange2(textField:)),
            for: UIControl.Event.editingChanged)
    }
    
    func goToCalculater() {
        let vcName = self.storyboard?.instantiateViewController(withIdentifier: "CalculaterViewController")
                self.present(vcName!, animated: true, completion: nil)
    }
    
    func check() -> Bool {
        if Text_money.text == "원" {
            return false
        } else if N == "" {
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
        Button_plus_outlet.layer.cornerRadius = 4
        Button_Result_outlet.layer.cornerRadius = 4
        Button_kakao_outlet.layer.cornerRadius = 4
        Button_detail_outlet.layer.cornerRadius = 4
    }
    
    func setInputType() {
        Input_money.keyboardType = .numberPad
        Text_n.keyboardType = .numberPad
    }
    
    func setColor() {
        Label_money_show.textColor = GRAY
        Text_money.textColor = GRAY
        View_money_line.backgroundColor = GRAY
        self.Button_plus_outlet.backgroundColor = GRAY
        self.Button_Result_outlet.backgroundColor = GRAY
    }
    
    func setAlpha() {
        self.Label_result1_show.alpha = 0
        self.Result_1.alpha = 0
        self.View_result1_line.alpha = 0
        
        self.Label_result2_show.alpha = 0
        self.Result_2.alpha = 0
        self.View_result2_line.alpha = 0
        
        self.Label_result3_show.alpha = 0
        self.Result_3.alpha = 0
        self.View_result3_line.alpha = 0
        
        self.View_Line.alpha = 0
        self.View_Buttons.alpha = 0
    }
    
    func setTransform() {
        self.Label_result1_show.transform = CGAffineTransform(translationX: 0, y: -10)
        self.Result_1.transform = CGAffineTransform(translationX: 0, y: -10)
        self.View_result1_line.transform = CGAffineTransform(translationX: 0, y: -10)
        
        self.Label_result2_show.transform = CGAffineTransform(translationX: 0, y: -10)
        self.Result_2.transform = CGAffineTransform(translationX: 0, y: -10)
        self.View_result2_line.transform = CGAffineTransform(translationX: 0, y: -10)
        
        self.Label_result3_show.transform = CGAffineTransform(translationX: 0, y: -10)
        self.Result_3.transform = CGAffineTransform(translationX: 0, y: -10)
        self.View_result3_line.transform = CGAffineTransform(translationX: 0, y: -10)
        
        self.View_Line.transform = CGAffineTransform(translationX: 0, y: -155)
        self.Button_RESET.transform = CGAffineTransform(translationX: 0, y: -180)
        self.View_Buttons.transform = CGAffineTransform(translationX: 0, y: -60)
    }
    
    func showViewAnimation() {
        self.View_View.alpha = 0
        UIView.animate(withDuration: 0.5, animations: {
            self.View_View.alpha = 1
        })
    }
    
    func showPlusAnimation() {
        UIView.animate(withDuration: 0.5, animations: {
            self.Label_money_show.textColor = self.BUTTON
            self.Text_money.textColor = self.BUTTON
            self.View_money_line.backgroundColor = self.BUTTON
            self.Button_plus_outlet.backgroundColor = self.GRAY
        })
    }
    
    func showResultAnimation() {
        UIView.animate(withDuration: 0.5, animations: {
            self.View_Line.alpha = 1
            self.View_Line.transform = CGAffineTransform(translationX: 0, y: -50)
            self.Button_RESET.transform = CGAffineTransform(translationX: 0, y: -50)
            self.Button_Result_outlet.backgroundColor = self.GRAY
        })

        UIView.animate(withDuration: 0.7, animations: {
            self.Label_result1_show.alpha = 1
            self.Label_result1_show.transform = CGAffineTransform(translationX: 0, y: 0)
            self.Result_1.alpha = 1
            self.Result_1.transform = CGAffineTransform(translationX: 0, y: 0)
            self.View_result1_line.alpha = 1
            self.View_result1_line.transform = CGAffineTransform(translationX: 0, y: 0)
            
            self.Label_result2_show.alpha = 1
            self.Label_result2_show.transform = CGAffineTransform(translationX: 0, y: 0)
            self.Result_2.alpha = 1
            self.Result_2.transform = CGAffineTransform(translationX: 0, y: 0)
            self.View_result2_line.alpha = 1
            self.View_result2_line.transform = CGAffineTransform(translationX: 0, y: 0)
            
            self.View_Buttons.alpha = 1
            self.View_Buttons.transform = CGAffineTransform(translationX: 0, y: -50)
            
            self.Label_result3_show.alpha = 0
            self.Label_result3_show.transform = CGAffineTransform(translationX: 0, y: -10)
            self.Result_3.alpha = 0
            self.Result_3.transform = CGAffineTransform(translationX: 0, y: -10)
            self.View_result3_line.alpha = 0
            self.View_result3_line.transform = CGAffineTransform(translationX: 0, y: -10)
        })
    }
    
    func showDetailAnimation() {
        UIView.animate(withDuration: 0.5, animations: {
            self.View_Line.transform = CGAffineTransform(translationX: 0, y: 0)
            self.Button_RESET.transform = CGAffineTransform(translationX: 0, y: 0)
            self.View_Buttons.transform = CGAffineTransform(translationX: 0, y: 0)
        })
        
        UIView.animate(withDuration: 0.7, animations: {
            self.Label_result3_show.alpha = 1
            self.Label_result3_show.transform = CGAffineTransform(translationX: 0, y: 0)
            self.Result_3.alpha = 1
            self.Result_3.transform = CGAffineTransform(translationX: 0, y: 0)
            self.View_result3_line.alpha = 1
            self.View_result3_line.transform = CGAffineTransform(translationX: 0, y: 0)
        })
    }
    
    func dismissDetailAnimation() {
        UIView.animate(withDuration: 0.5, animations: {
            self.View_Line.transform = CGAffineTransform(translationX: 0, y: -50)
            self.Button_RESET.transform = CGAffineTransform(translationX: 0, y: -50)
            
            self.View_Buttons.transform = CGAffineTransform(translationX: 0, y: -50)
        })
        
        UIView.animate(withDuration: 0.5, animations: {
            self.Label_result3_show.alpha = 0
            self.Label_result3_show.transform = CGAffineTransform(translationX: 0, y: -10)
            self.Result_3.alpha = 0
            self.Result_3.transform = CGAffineTransform(translationX: 0, y: -10)
            self.View_result3_line.alpha = 0
            self.View_result3_line.transform = CGAffineTransform(translationX: 0, y: -10)
        })
    }
    
    func resetColor() {
        self.Label_money_show.textColor = self.GRAY
        self.Text_money.textColor = self.GRAY
        self.View_money_line.backgroundColor = self.GRAY
        
        self.Button_plus_outlet.backgroundColor = self.GRAY
        self.Button_Result_outlet.backgroundColor = self.GRAY
    }
    
    func resetAlpha() {
        self.Label_result1_show.alpha = 0
        self.Result_1.alpha = 0
        self.View_result1_line.alpha = 0
        
        self.Label_result2_show.alpha = 0
        self.Result_2.alpha = 0
        self.View_result2_line.alpha = 0
        
        self.Label_result3_show.alpha = 0
        self.Result_3.alpha = 0
        self.View_result3_line.alpha = 0
        
        self.View_Line.alpha = 0
        self.View_Buttons.alpha = 0
    }
    
    func resetTransform() {
        self.Label_result1_show.transform = CGAffineTransform(translationX: 0, y: -10)
        self.Result_1.transform = CGAffineTransform(translationX: 0, y: -10)
        self.View_result1_line.transform = CGAffineTransform(translationX: 0, y: -10)
        
        self.Label_result2_show.transform = CGAffineTransform(translationX: 0, y: -10)
        self.Result_2.transform = CGAffineTransform(translationX: 0, y: -10)
        self.View_result2_line.transform = CGAffineTransform(translationX: 0, y: -10)
        
        self.Label_result3_show.transform = CGAffineTransform(translationX: 0, y: -10)
        self.Result_3.transform = CGAffineTransform(translationX: 0, y: -10)
        self.View_result3_line.transform = CGAffineTransform(translationX: 0, y: -10)
        
        self.View_Line.transform = CGAffineTransform(translationX: 0, y: -155)
        self.Button_RESET.transform = CGAffineTransform(translationX: 0, y: -180)
        self.View_Buttons.transform = CGAffineTransform(translationX: 0, y: -60)
    }
    
    func reset() {
        InputMoney = ""
        MONEY = 0
        N = ""
        RESULT = 0
        kakao_print = ""
        DETAIL = ""
        Input_money.text = ""
        Text_money.text = "원"
        Text_n.text = ""
        Result_2.text = ""
        Text_bank.text = ""
        
        detailShow = true
        detailCount = 0
    }
}


extension Show2_1ViewController {
    
    func algoOfTextChange1() {
        if(Input_money.text != "") {
            UIView.animate(withDuration: 0.5, animations: {
                self.Button_plus_outlet.backgroundColor = self.BUTTON
            })
        } else {
            UIView.animate(withDuration: 0.5, animations: {
                self.Button_plus_outlet.backgroundColor = self.GRAY
            })
        }
    }
    
    func algoOfTextChange2() {
        N = Text_n.text!
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
    
    func algoOfPlus() {
        kakao_print = ""
        detailCount = 0
        detailShow = true
        
        MONEY += Int(InputMoney)!
        Input_money.text = ""
        Text_money.text = inputComma(innum: MONEY) + " 원"
        
        if(DETAIL == "") {
            DETAIL = inputComma(innum: Int(InputMoney)!) + " 원"
        } else if (DETAIL != "") {
            DETAIL += "\n" + inputComma(innum: Int(InputMoney)!) + " 원"
        }
    
        showPlusAnimation()
        N = Text_n.text!
        if(check()) {
            UIView.animate(withDuration: 0.5, animations: {
                self.Button_Result_outlet.backgroundColor = self.BUTTON
            })
        }
    }
    
    func algoOfResult() {
        kakao_print = "일반 더치페이"
        kakao_print += "\n\n총 사용금액 : " + inputComma(innum: MONEY) + " 원"
        kakao_print += "\n인원수 : " + N + " 명"

        RESULT = MONEY / Int(N)!
        Result_1.text = inputComma(innum: RESULT) + " 원"
        Result_2.text = Text_bank.text!
        kakao_print += "\n더치페이 결과 : " + inputComma(innum: RESULT) + " 원"
        kakao_print += "\n\n계좌번호 : " + Text_bank.text!
        
        showResultAnimation()
        self.view.endEditing(true)
    }
    
    func algoOfDetail() {
        if(detailShow == true) {
            if(detailCount == 0) {
                self.Result_3.text = self.DETAIL
                self.kakao_print += "\n\n상세금액\n" + self.DETAIL
                detailCount = detailCount + 1
            }
            showDetailAnimation()
            detailShow = false
        } else {
            dismissDetailAnimation()
            detailShow = true
        }
    }
}
