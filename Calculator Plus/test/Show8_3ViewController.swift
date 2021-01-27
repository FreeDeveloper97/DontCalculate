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
    @IBOutlet var buttonOutlet: UIButton!
    
    @IBOutlet var result3: UILabel!
    @IBOutlet var detail: UILabel!
    
    @IBOutlet var View_view: UIView!
    
    var money: Int = 0
    var monMoney: Int = 0
    var moneyNotCal: Int = 0
    var peopleNum: Int = 0
    var minusIncomMoney: Int = 0
    var minusIncomMoney2: Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboard()
        
        setRadius()
        showAnimation()
        
        setInputType()
    }

    @IBAction func buttonResult(_ sender: Any) {
        if (check()) {
            algoOfResult()
        }
    }
    @IBAction func buttonDetail(_ sender: Any) {
        algoOfDetail()
    }
    @IBAction func buttonReset(_ sender: Any) {
        reset()
    }
    
    
}



extension Show8_3ViewController {
    func showAnimation() {
        self.View_view.alpha = 0
        UIView.animate(withDuration: 0.5, animations: {
            self.View_view.alpha = 1
        })
    }
    
    func setRadius() {
        buttonOutlet.layer.cornerRadius = 4
    }
    
    func setInputType() {
        inputMoney.keyboardType = .numberPad
        inputMoneyNotCal.keyboardType = .numberPad
        inputPeopleNum.keyboardType = .numberPad
    }
    
    func check() -> Bool {
        return true
    }
    
    func inputComma(innum: Int) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        
        let RESULT_COMMA: String = numberFormatter.string(from:NSNumber(value: innum))!
        return RESULT_COMMA
    }
    
    func reset() {
        inputMoney.text = ""
        inputMoneyNotCal.text = ""
        inputPeopleNum.text = ""
        result3.text = "원"
        detail.text = "원\n원\n원\n원\n원\n원"
    }
}



extension Show8_3ViewController {
    
    func algoOfResult() {
        money = Int(inputMoney.text!)!
        monMoney = Int(Double(money)/12.0)
        print("-->monMoney: \(monMoney)")
        minusIncomMoney = Money.algoOfIncomMoney(Money: (monMoney/1000))
        minusIncomMoney2 = Int(Double(minusIncomMoney)*0.1)
        let minusResult: Int = minusIncomMoney + minusIncomMoney2
        
        result3.text = inputComma(innum: minusResult) + " 원"
    }
    
    func algoOfDetail() {
        detail.text =
            "국민연금 (4.5%) : " + " 원\n"
        + "건강보험 (3.4%) : " + " 원\n"
        + "장기요양 (0.4%) : " + " 원\n"
        + "고용보험 (0.8%) : " + " 원\n"
        + "근로소득세(beta) : " + inputComma(innum: minusIncomMoney) + " 원\n"
        + "지방소득세(beta) : " + inputComma(innum: minusIncomMoney2) + "원"
    }
}
