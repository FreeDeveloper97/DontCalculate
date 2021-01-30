//
//  Show8_3ViewController.swift
//  Calculator Plus
//
//  Created by Kang Minsang on 2021/01/27.
//  Copyright © 2021 FreeDeveloper. All rights reserved.
//

import UIKit

class Show8_3ViewController: UIViewController {

    @IBOutlet var inputMoney: UITextField!
    @IBOutlet var inputMoneyNotCal: UITextField!
    @IBOutlet var inputPeopleNum: UITextField!
    @IBOutlet var buttonResultOutlet: UIButton!
    
    @IBOutlet var showResult1: UILabel!
    @IBOutlet var showResult2: UILabel!
    @IBOutlet var showResult3: UILabel!
    @IBOutlet var showResult4: UILabel!
    @IBOutlet var showDetail: UILabel!
    
    @IBOutlet var lineResult1: UIView!
    @IBOutlet var lineResult2: UIView!
    @IBOutlet var lineResult3: UIView!
    @IBOutlet var lineResult4: UIView!
    @IBOutlet var lineDetail: UIView!
    
    @IBOutlet var result1: UILabel!
    @IBOutlet var result2: UILabel!
    @IBOutlet var result3: UILabel!
    @IBOutlet var result4: UILabel!
    @IBOutlet var detail: UILabel!
    
    @IBOutlet var View_line: UIView!
    @IBOutlet var View_view: UIView!
    
    @IBOutlet var buttons: UIView!
    @IBOutlet var buttonLinkOutlet: UIButton!
    @IBOutlet var buttonResetOutlet: UIButton!
    
    @IBOutlet var viewA: UIView!
    @IBOutlet var viewResult: UIView!
    @IBOutlet var viewDetail: UIView!
    
    let GRAY = UIColor(named: "ColorGray")
    let BUTTON = UIColor(named: "button")
    
    var money: Int = 0
    var monMoney: Int = 0
    var moneyNotCal: Int = 0
    var monMoneyNotCal: Int = 0
    var peopleNum: Int = 0
    var minusIncomMoney: Int = 0
    var minusIncomMoney2: Int = 0
    var detail1: Double = 0
    var detail2: Double = 0
    var detail3: Double = 0
    var detail4: Double = 0
    var Kakao_print: String = ""
    var detailShow: Bool = true
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboard()
        
        self.navigationItem.title = "연봉"
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

    @IBAction func buttonResult(_ sender: Any) {
        if (check()) {
            algoOfResult()
        }
    }
    @IBAction func buttonDetail(_ sender: Any) {
        algoOfDetail()
    }
    @IBAction func buttonKakao(_ sender: Any) {
        Kakao.sendData(data: Kakao_print)
    }
    @IBAction func buttonLink(_ sender: Any) {
        if let url = URL(string: "https://han.gl/kp39M"){
            UIApplication.shared.open(url, options: [:])
        }
    }
    @IBAction func buttonReset(_ sender: Any) {
        reset()
        UIView.animate(withDuration: 0.5, animations: {
            self.resetColor()
            self.setAlpha()
            self.setTransform()
        })
    }
}



extension Show8_3ViewController {
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
        if inputMoney.text == "" {
            return false
        }
        if inputMoneyNotCal.text == "" {
            return false
        }
        if inputPeopleNum.text == "" {
            return false
        } else if (Int(inputPeopleNum.text!)! == 0 || Int(inputPeopleNum.text!)! > 4) {
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
        buttonResultOutlet.backgroundColor = GRAY
    }
    
    func setRadius() {
        buttonResultOutlet.layer.cornerRadius = 4
        detail.layer.cornerRadius = 4
        buttonLinkOutlet.layer.cornerRadius = 4
        buttonResetOutlet.layer.cornerRadius = 4
        viewA.layer.cornerRadius = 12
        viewResult.layer.cornerRadius = 12
        viewDetail.layer.cornerRadius = 12
    }
    
    func setAlpha() {
        self.showResult1.alpha = 0
        self.showResult2.alpha = 0
        self.showResult3.alpha = 0
        self.showResult4.alpha = 0
        self.showDetail.alpha = 0
        
        self.lineResult1.alpha = 0
        self.lineResult2.alpha = 0
        self.lineResult3.alpha = 0
        self.lineResult4.alpha = 0
        self.lineDetail.alpha = 0
        
        self.result1.alpha = 0
        self.result2.alpha = 0
        self.result3.alpha = 0
        self.result4.alpha = 0
        self.detail.alpha = 0
        
        self.buttons.alpha = 0
        self.buttonLinkOutlet.alpha = 0
        self.viewResult.alpha = 0
        self.viewDetail.alpha = 0
    }
    
    func setTransform() {
        self.showResult1.transform = CGAffineTransform(translationX: 0, y: -10)
        self.showResult2.transform = CGAffineTransform(translationX: 0, y: -10)
        self.showResult3.transform = CGAffineTransform(translationX: 0, y: -10)
        self.showResult4.transform = CGAffineTransform(translationX: 0, y: -10)
        self.showDetail.transform = CGAffineTransform(translationX: 0, y: -10)
        
        self.lineResult1.transform = CGAffineTransform(translationX: 0, y: -10)
        self.lineResult2.transform = CGAffineTransform(translationX: 0, y: -10)
        self.lineResult3.transform = CGAffineTransform(translationX: 0, y: -10)
        self.lineResult4.transform = CGAffineTransform(translationX: 0, y: -10)
        self.lineDetail.transform = CGAffineTransform(translationX: 0, y: -10)
        
        self.result1.transform = CGAffineTransform(translationX: 0, y: -10)
        self.result2.transform = CGAffineTransform(translationX: 0, y: -10)
        self.result3.transform = CGAffineTransform(translationX: 0, y: -10)
        self.result4.transform = CGAffineTransform(translationX: 0, y: -10)
        self.detail.transform = CGAffineTransform(translationX: 0, y: -10)
        
        self.View_line.transform = CGAffineTransform(translationX: 0, y: -200)
        self.buttons.transform = CGAffineTransform(translationX: 0, y: -180)
        self.buttonLinkOutlet.transform = CGAffineTransform(translationX: 0, y: -180)
        self.buttonResetOutlet.transform = CGAffineTransform(translationX: 0, y: -440)
    }
    
    func showAnimation() {
        self.View_view.alpha = 0
        UIView.animate(withDuration: 0.5, animations: {
            self.View_view.alpha = 1
        })
    }
    
    func setInputType() {
        inputMoney.keyboardType = .numberPad
        inputMoneyNotCal.keyboardType = .numberPad
        inputPeopleNum.keyboardType = .numberPad
    }
    
    func setInputChanged() {
        inputMoney.addTarget(self, action: #selector(textFieldDidChange(textField:)),
            for: UIControl.Event.editingChanged)
        inputMoneyNotCal.addTarget(self, action: #selector(textFieldDidChange(textField:)),
            for: UIControl.Event.editingChanged)
        inputPeopleNum.addTarget(self, action: #selector(textFieldDidChange(textField:)),
            for: UIControl.Event.editingChanged)
    }
    
    func showResultButtonAnimation() {
        if(check()) {
            UIView.animate(withDuration: 0.5, animations: {
                self.buttonResultOutlet.backgroundColor = self.BUTTON
            })
        } else {
            UIView.animate(withDuration: 0.5, animations: {
                self.buttonResultOutlet.backgroundColor = self.GRAY
            })
        }
    }
    
    func showResultAnimation() {
        UIView.animate(withDuration: 0.5, animations: {
            self.View_line.transform = CGAffineTransform(translationX: 0, y: 0)
            self.buttonResetOutlet.transform = CGAffineTransform(translationX: 0, y: -170)
            self.buttonResultOutlet.backgroundColor = self.GRAY
        })
        
        UIView.animate(withDuration: 0.7, animations: {
            self.showAlpha()
            self.showTransform()
        })
    }
    
    func showAlpha() {
        self.showResult1.alpha = 1
        self.showResult2.alpha = 1
        self.showResult3.alpha = 1
        self.showResult4.alpha = 1
        
        self.lineResult1.alpha = 1
        self.lineResult2.alpha = 1
        self.lineResult3.alpha = 1
        self.lineResult4.alpha = 1
        
        self.result1.alpha = 1
        self.result2.alpha = 1
        self.result3.alpha = 1
        self.result4.alpha = 1
        
        self.buttons.alpha = 1
        self.buttonLinkOutlet.alpha = 1
        self.viewResult.alpha = 1
    }
    
    func showTransform() {
        self.showResult1.transform = CGAffineTransform(translationX: 0, y: 0)
        self.showResult2.transform = CGAffineTransform(translationX: 0, y: 0)
        self.showResult3.transform = CGAffineTransform(translationX: 0, y: 0)
        self.showResult4.transform = CGAffineTransform(translationX: 0, y: 0)
        self.showDetail.transform = CGAffineTransform(translationX: 0, y: 0)
        
        self.lineResult1.transform = CGAffineTransform(translationX: 0, y: 0)
        self.lineResult2.transform = CGAffineTransform(translationX: 0, y: 0)
        self.lineResult3.transform = CGAffineTransform(translationX: 0, y: 0)
        self.lineResult4.transform = CGAffineTransform(translationX: 0, y: 0)
        self.lineDetail.transform = CGAffineTransform(translationX: 0, y: 0)
        
        self.result1.transform = CGAffineTransform(translationX: 0, y: 0)
        self.result2.transform = CGAffineTransform(translationX: 0, y: 0)
        self.result3.transform = CGAffineTransform(translationX: 0, y: 0)
        self.result4.transform = CGAffineTransform(translationX: 0, y: 0)
        self.detail.transform = CGAffineTransform(translationX: 0, y: 0)
        
        self.buttons.transform = CGAffineTransform(translationX: 0, y: -170)
        self.buttonLinkOutlet.transform = CGAffineTransform(translationX: 0, y: -170)
    }
    
    func reset() {
        inputMoney.text = ""
        inputMoneyNotCal.text = ""
        inputPeopleNum.text = ""
        result1.text = "원"
        result2.text = "원"
        result3.text = "원"
        result4.text = "원"
        detail.text = "원\n원\n원\n원\n원\n원"
        detailShow = true
    }
    
    func resetColor() {
        self.buttonResultOutlet.backgroundColor = self.GRAY
    }
    
    func showDetailAnimation() {
        UIView.animate(withDuration: 0.5, animations: {
            self.buttons.transform = CGAffineTransform(translationX: 0, y: 0)
            self.buttonResetOutlet.transform = CGAffineTransform(translationX: 0, y: 0)
            self.buttonLinkOutlet.transform = CGAffineTransform(translationX: 0, y: 0)
            self.viewDetail.alpha = 1
        })
        
        UIView.animate(withDuration: 0.7, animations: {
            self.showDetail.alpha = 1
            self.lineDetail.alpha = 1
            self.detail.alpha = 1
            
            self.showDetail.transform = CGAffineTransform(translationX: 0, y: 0)
            self.lineDetail.transform = CGAffineTransform(translationX: 0, y: 0)
            self.detail.transform = CGAffineTransform(translationX: 0, y: 0)
        })
    }
    
    func dismissDetailAnimation() {
        UIView.animate(withDuration: 0.5, animations: {
            self.buttons.transform = CGAffineTransform(translationX: 0, y: -170)
            self.buttonResetOutlet.transform = CGAffineTransform(translationX: 0, y: -170)
            self.buttonLinkOutlet.transform = CGAffineTransform(translationX: 0, y: -170)
            self.viewDetail.alpha = 0
            
            self.showDetail.alpha = 0
            self.lineDetail.alpha = 0
            self.detail.alpha = 0
            
            self.showDetail.transform = CGAffineTransform(translationX: 0, y: -10)
            self.lineDetail.transform = CGAffineTransform(translationX: 0, y: -10)
            self.detail.transform = CGAffineTransform(translationX: 0, y: -10)
        })
    }
}



extension Show8_3ViewController {
    
    func algoOfTextChange() {
        showResultButtonAnimation()
    }
    
    func algoOfResult() {
        algoOfCheckInput()
        
        detail1 = Money.algoOfMoney1(Money: monMoney)
        detail2 = Money.algoOfMoney2(Money: monMoney)
        detail3 = Money.algoOfMoney3(Money: monMoney)
        detail4 = Money.algoOfMoney4(Money: monMoney)
        if(detail1 > 226350) {
            detail1 = 226350.0
        }
        
        let monMoneyResult: Int = monMoney + monMoneyNotCal
        let minus: Int = Int(detail1+detail2+detail3+detail4)
        let minus2: Int = minusIncomMoney + minusIncomMoney2
        let result: Int = (monMoneyResult - minus - minus2)
        
        result1.text = inputComma(innum: monMoneyResult) + " 원"
        result2.text = "- " + inputComma(innum: minus) + " 원"
        result3.text = "- " + inputComma(innum: minus2) + " 원"
        result4.text = inputComma(innum: result) + " 원"
        
        showResultAnimation()
        dismissDetailAnimation()
        self.detailShow = true
        self.view.endEditing(true)
        
        Kakao_print = "연봉 → 월급 계산서"
        Kakao_print += "\n\n연봉 금액 : " + inputComma(innum: Int(inputMoney.text!)!) + " 원"
        Kakao_print += "\n비과세금액 : " + inputComma(innum: Int(inputMoneyNotCal.text!)!) + " 원"
        Kakao_print += "\n부양가족수 : " + inputPeopleNum.text! + " 명"
        Kakao_print += "\n\n월급 : " + inputComma(innum: monMoneyResult) + " 원"
        Kakao_print += "\n4대보험비 : -" + inputComma(innum: minus) + " 원"
        Kakao_print += "\n근로소득세 : -" + inputComma(innum: minus2) + " 원"
        Kakao_print += "\n\n최종 월급 : " + inputComma(innum: result) + " 원"
        Kakao_print += "\n\n※ 근로소득세는 오차가 존재합니다 ※"
    }
    
    func algoOfCheckInput() {
        money = Int(inputMoney.text!)!
        if (inputMoneyNotCal.text != "") {
            moneyNotCal = Int(inputMoneyNotCal.text!)!
            monMoneyNotCal = Int(Double(moneyNotCal)/12.0)
        } else {
            moneyNotCal = 0
            monMoneyNotCal = 0
        }
        monMoney = Int(Double(money)/12.0) - monMoneyNotCal
        
        if (monMoney < 1060000) {
            minusIncomMoney = 0
            minusIncomMoney2 = 0
        } else if (monMoney < 10000000) {
            algoOfCheckPeopleNum()
        } else {
            //천만원 이상의 경우 에러
            minusIncomMoney = 0
            minusIncomMoney2 = 0
        }
    }
    
    func algoOfCheckPeopleNum() {
        peopleNum = Int(inputPeopleNum.text!)!
        if (peopleNum == 1) {
            minusIncomMoney = Money.algoOfIncomMoney(Money: (monMoney/1000))
        } else if (peopleNum == 2) {
            minusIncomMoney = Money.algoOfIncomMoney2(Money: (monMoney/1000))
        }
        minusIncomMoney2 = Int(Double(minusIncomMoney)*0.1)
    }
    
    func algoOfDetail() {
        detail.text =
            "국민연금 (4.5%) : " + inputComma(innum: Int(detail1)) + " 원\n"
        + "건강보험 (3.4%) : " + inputComma(innum: Int(detail2)) + " 원\n"
        + "장기요양 (0.4%) : " + inputComma(innum: Int(detail3)) + " 원\n"
        + "고용보험 (0.8%) : " + inputComma(innum: Int(detail4)) + " 원\n"
        + "근로소득세 (beta) : " + inputComma(innum: minusIncomMoney) + " 원\n"
        + "지방소득세 (beta) : " + inputComma(innum: minusIncomMoney2) + " 원"
        
        if (detailShow) {
            showDetailAnimation()
            detailShow = false
        } else {
            dismissDetailAnimation()
            detailShow = true
        }
    }
}
