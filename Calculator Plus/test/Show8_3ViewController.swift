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
    
    @IBOutlet var result1: UILabel!
    @IBOutlet var result2: UILabel!
    @IBOutlet var result3: UILabel!
    @IBOutlet var result4: UILabel!
    @IBOutlet var detail: UILabel!
    
    @IBOutlet var View_view: UIView!
    
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
        result1.text = "원"
        result2.text = "원"
        result3.text = "원"
        result4.text = "원"
        detail.text = "원\n원\n원\n원\n원\n원"
    }
}



extension Show8_3ViewController {
    
    func algoOfResult() {
        algoOfCheckInput()
        
        detail1 = Money.algoOfMoney1(Money: monMoney)
        detail2 = Money.algoOfMoney2(Money: monMoney)
        detail3 = Money.algoOfMoney3(Money: monMoney)
        detail4 = Money.algoOfMoney4(Money: monMoney)
        
        let monMoneyResult: Int = monMoney + monMoneyNotCal
        let minus: Int = Int(detail1+detail2+detail3+detail4)
        let minus2: Int = minusIncomMoney + minusIncomMoney2
        let result: Int = (monMoneyResult - minus - minus2)
        
        result1.text = inputComma(innum: monMoneyResult) + " 원"
        result2.text = "- " + inputComma(innum: minus) + " 원"
        result3.text = "- " + inputComma(innum: minus2) + " 원"
        result4.text = inputComma(innum: result) + " 원"
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
        
        if monMoney < 1060000 {
            minusIncomMoney = 0
            minusIncomMoney2 = 0
        } else {
            minusIncomMoney = Money.algoOfIncomMoney(Money: (monMoney/1000))
            minusIncomMoney2 = Int(Double(minusIncomMoney)*0.1)
        }
    }
    
    func algoOfDetail() {
        detail.text =
            "국민연금 (4.5%) : " + inputComma(innum: Int(detail1)) + " 원\n"
        + "건강보험 (3.4%) : " + inputComma(innum: Int(detail2)) + " 원\n"
        + "장기요양 (0.4%) : " + inputComma(innum: Int(detail3)) + " 원\n"
        + "고용보험 (0.8%) : " + inputComma(innum: Int(detail4)) + " 원\n"
        + "근로소득세 (beta) : " + inputComma(innum: minusIncomMoney) + " 원\n"
        + "지방소득세 (beta) : " + inputComma(innum: minusIncomMoney2) + " 원"
    }
}
