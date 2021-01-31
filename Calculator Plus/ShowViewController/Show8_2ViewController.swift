//
//  View_7_2_ViewController.swift
//  Calculator Plus
//
//  Created by Min_MacBook Pro on 2020/04/02.
//  Copyright © 2020 FreeDeveloper. All rights reserved.
//

import UIKit

class Show8_2ViewController: UIViewController {

    @IBOutlet var Button_Result_outlet: UIButton!

    @IBOutlet var Button_url_outlet: UIButton!
    @IBOutlet var Text_money: UITextField!
    @IBOutlet var Text_m: UITextField!
    
    @IBOutlet var Button_detail_outlet: UIButton!
    @IBOutlet var Button_kakao_outlet: UIButton!
    
    @IBOutlet var Label_result1_show: UILabel!
    @IBOutlet var Label_result2_show: UILabel!
    @IBOutlet var Label_result3_show: UILabel!
    @IBOutlet var Label_result4_show: UILabel!
    
    @IBOutlet var Result_1: UILabel!
    @IBOutlet var Result_2: UILabel!
    @IBOutlet var Result_3: UILabel!
    @IBOutlet var Result_4: UILabel!
    
    @IBOutlet var View_result1_line: UIView!
    @IBOutlet var View_result2_line: UIView!
    @IBOutlet var View_result3_line: UIView!
    @IBOutlet var View_result4_line: UIView!
    
    @IBOutlet var View_line: UIView!
    
    @IBOutlet var View_Buttons: UIView!
    @IBOutlet var Button_url: UIButton!
    
    @IBOutlet var Button_RESET: UIButton!
    
    @IBOutlet var View_View: UIView!
    @IBOutlet var viewA: UIView!
    @IBOutlet var viewResult: UIView!
    @IBOutlet var viewDetail: UIView!
    
    var MONEY = ""
    var temp = 0.0
    var RESULT = 0
    var MINUS = 0
    var M = "?"
    var detail_1 = 0.0
    var detail_2 = 0.0
    var detail_3 = 0.0
    var detail_4 = 0.0
    var Print_kakao = ""
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
        algoOfResult()
    }
    @IBAction func Button_detail(_ sender: UIButton) {
        algoOfDetail()
    }
    @IBAction func Button_kakao(_ sender: UIButton) {
        if(check()) {
            Kakao.sendData(data: Print_kakao)
        }
    }
    @IBAction func Button_url(_ sender: UIButton) {
        if let url = URL(string: "http://insure.fpvhxm.com"){
            UIApplication.shared.open(url, options: [:])
        }
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



extension Show8_2ViewController {
    
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
        MONEY = Text_money.text!
        M = Text_m.text!
    }
    
    func check() -> Bool {
        if MONEY == "" {
            return false
        }
        return true
    }
    
    func calculate() {
        detail_1 = Money.algoOfMoney1(Money: RESULT)
        detail_2 = Money.algoOfMoney2(Money: RESULT)
        detail_3 = Money.algoOfMoney3(Money: RESULT)
        detail_4 = Money.algoOfMoney4(Money: RESULT)
        temp = detail_1 + detail_2 + detail_3 + detail_4
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
        Button_detail_outlet.layer.cornerRadius = 4
        Button_url_outlet.layer.cornerRadius = 4
        Button_kakao_outlet.layer.cornerRadius = 4
        viewA.layer.cornerRadius = 12
        viewResult.layer.cornerRadius = 12
        viewDetail.layer.cornerRadius = 12
    }
    
    func setAlpha() {
        self.Label_result1_show.alpha = 0
        self.Label_result2_show.alpha = 0
        self.Label_result3_show.alpha = 0
        self.Label_result4_show.alpha = 0
        self.Result_1.alpha = 0
        self.Result_2.alpha = 0
        self.Result_3.alpha = 0
        self.Result_4.alpha = 0
        self.View_result1_line.alpha = 0
        self.View_result2_line.alpha = 0
        self.View_result3_line.alpha = 0
        self.View_result4_line.alpha = 0
        self.View_Buttons.alpha = 0
        self.Button_url.alpha = 0
        self.viewResult.alpha = 0
        self.viewDetail.alpha = 0
    }
    
    func setTransform() {
        self.Label_result1_show.transform = CGAffineTransform(translationX: 0, y: -10)
        self.Label_result2_show.transform = CGAffineTransform(translationX: 0, y: -10)
        self.Label_result3_show.transform = CGAffineTransform(translationX: 0, y: -10)
        self.Label_result4_show.transform = CGAffineTransform(translationX: 0, y: -10)
        self.Result_1.transform = CGAffineTransform(translationX: 0, y: -10)
        self.Result_2.transform = CGAffineTransform(translationX: 0, y: -10)
        self.Result_3.transform = CGAffineTransform(translationX: 0, y: -10)
        self.Result_4.transform = CGAffineTransform(translationX: 0, y: -10)
        self.View_result1_line.transform = CGAffineTransform(translationX: 0, y: -10)
        self.View_result2_line.transform = CGAffineTransform(translationX: 0, y: -10)
        self.View_result3_line.transform = CGAffineTransform(translationX: 0, y: -10)
        self.View_result4_line.transform = CGAffineTransform(translationX: 0, y: -10)
        self.View_Buttons.transform = CGAffineTransform(translationX: 0, y: -130)
        self.Button_url.transform = CGAffineTransform(translationX: 0, y: -130)
        
        self.View_line.transform = CGAffineTransform(translationX: 0, y: -153)
        self.Button_RESET.transform = CGAffineTransform(translationX: 0, y: -340)
    }
    
    func showAnimation() {
        self.View_View.alpha = 0
        UIView.animate(withDuration: 0.5, animations: {
            self.View_View.alpha = 1
        })
    }
    
    func setInputType() {
        Text_m.keyboardType = .numberPad
        Text_money.keyboardType = .numberPad
    }
    
    func setInputChanged() {
        Text_m.addTarget(self, action: #selector(textFieldDidChange(textField:)),
            for: UIControl.Event.editingChanged)
        Text_money.addTarget(self, action: #selector(textFieldDidChange(textField:)),
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
            self.Button_RESET.transform = CGAffineTransform(translationX: 0, y: -120)
            self.Button_Result_outlet.backgroundColor = self.GRAY
            self.viewResult.alpha = 1
        })
        
        UIView.animate(withDuration: 0.7, animations: {
            self.Label_result1_show.alpha = 1
            self.Label_result2_show.alpha = 1
            self.Label_result3_show.alpha = 1
            self.Label_result4_show.alpha = 0
            self.Result_1.alpha = 1
            self.Result_2.alpha = 1
            self.Result_3.alpha = 1
            self.Result_4.alpha = 0
            self.View_result1_line.alpha = 1
            self.View_result2_line.alpha = 1
            self.View_result3_line.alpha = 1
            self.View_result4_line.alpha = 0
            self.View_Buttons.alpha = 1
            self.Button_url.alpha = 1
            
            self.Label_result1_show.transform = CGAffineTransform(translationX: 0, y: 0)
            self.Label_result2_show.transform = CGAffineTransform(translationX: 0, y: 0)
            self.Label_result3_show.transform = CGAffineTransform(translationX: 0, y: 0)
            self.Label_result4_show.transform = CGAffineTransform(translationX: 0, y: -10)
            self.Result_1.transform = CGAffineTransform(translationX: 0, y: 0)
            self.Result_2.transform = CGAffineTransform(translationX: 0, y: 0)
            self.Result_3.transform = CGAffineTransform(translationX: 0, y: 0)
            self.Result_4.transform = CGAffineTransform(translationX: 0, y: -10)
            self.View_result1_line.transform = CGAffineTransform(translationX: 0, y: 0)
            self.View_result2_line.transform = CGAffineTransform(translationX: 0, y: 0)
            self.View_result3_line.transform = CGAffineTransform(translationX: 0, y: 0)
            self.View_result4_line.transform = CGAffineTransform(translationX: 0, y: -10)
            self.View_Buttons.transform = CGAffineTransform(translationX: 0, y: -120)
            self.Button_url.transform = CGAffineTransform(translationX: 0, y: -120)
        })
    }
    
    func showDetailAnimation() {
        UIView.animate(withDuration: 0.5, animations: {
            self.View_Buttons.transform = CGAffineTransform(translationX: 0, y: 0)
            self.Button_RESET.transform = CGAffineTransform(translationX: 0, y: 0)
            self.Button_url.transform = CGAffineTransform(translationX: 0, y: 0)
            self.viewDetail.alpha = 1
        })
        
        UIView.animate(withDuration: 0.7, animations: {
            self.Label_result4_show.alpha = 1
            self.Result_4.alpha = 1
            self.View_result4_line.alpha = 1
            self.Label_result4_show.transform = CGAffineTransform(translationX: 0, y: 0)
            self.Result_4.transform = CGAffineTransform(translationX: 0, y: 0)
            self.View_result4_line.transform = CGAffineTransform(translationX: 0, y: 0)
        })
    }
    
    func dismissDetailAnimation() {
        UIView.animate(withDuration: 0.5, animations: {
            self.View_Buttons.transform = CGAffineTransform(translationX: 0, y: -120)
            self.Button_RESET.transform = CGAffineTransform(translationX: 0, y: -120)
            self.Button_url.transform = CGAffineTransform(translationX: 0, y: -120)
            self.viewDetail.alpha = 0
            
            self.Label_result4_show.alpha = 0
            self.Result_4.alpha = 0
            self.View_result4_line.alpha = 0
            self.Label_result4_show.transform = CGAffineTransform(translationX: 0, y: -10)
            self.Result_4.transform = CGAffineTransform(translationX: 0, y: -10)
            self.View_result4_line.transform = CGAffineTransform(translationX: 0, y: -10)
        })
    }
    
    func reset() {
        MONEY = ""
        temp = 0.0
        RESULT = 0
        MINUS = 0
        M = "?"
        detail_1 = 0.0
        detail_2 = 0.0
        detail_3 = 0.0
        detail_4 = 0.0
        Print_kakao = ""
        Text_m.text = ""
        Text_money.text = ""
        detailShow = true
        detailCount = 0
    }
    
    func resetColor() {
        self.Button_Result_outlet.backgroundColor = self.GRAY
    }
    
    func resetAlpha() {
        self.Label_result1_show.alpha = 0
        self.Label_result2_show.alpha = 0
        self.Label_result3_show.alpha = 0
        self.Label_result4_show.alpha = 0
        self.Result_1.alpha = 0
        self.Result_2.alpha = 0
        self.Result_3.alpha = 0
        self.Result_4.alpha = 0
        self.View_result1_line.alpha = 0
        self.View_result2_line.alpha = 0
        self.View_result3_line.alpha = 0
        self.View_result4_line.alpha = 0
        self.View_Buttons.alpha = 0
        self.Button_url.alpha = 0
        self.viewResult.alpha = 0
        self.viewDetail.alpha = 0
    }
    
    func resetTransform() {
        self.Label_result1_show.transform = CGAffineTransform(translationX: 0, y: -10)
        self.Label_result2_show.transform = CGAffineTransform(translationX: 0, y: -10)
        self.Label_result3_show.transform = CGAffineTransform(translationX: 0, y: -10)
        self.Label_result4_show.transform = CGAffineTransform(translationX: 0, y: -10)
        self.Result_1.transform = CGAffineTransform(translationX: 0, y: -10)
        self.Result_2.transform = CGAffineTransform(translationX: 0, y: -10)
        self.Result_3.transform = CGAffineTransform(translationX: 0, y: -10)
        self.Result_4.transform = CGAffineTransform(translationX: 0, y: -10)
        self.View_result1_line.transform = CGAffineTransform(translationX: 0, y: -10)
        self.View_result2_line.transform = CGAffineTransform(translationX: 0, y: -10)
        self.View_result3_line.transform = CGAffineTransform(translationX: 0, y: -10)
        self.View_result4_line.transform = CGAffineTransform(translationX: 0, y: -10)
        self.View_Buttons.transform = CGAffineTransform(translationX: 0, y: -130)
        self.Button_url.transform = CGAffineTransform(translationX: 0, y: -130)
        
        self.View_line.transform = CGAffineTransform(translationX: 0, y: -153)
        self.Button_RESET.transform = CGAffineTransform(translationX: 0, y: -340)
    }
}



extension Show8_2ViewController {
    
    func algoOfTextChange() {
        beforeCheck()
        detailCount = 0
        showResultButtonAnimation()
    }
    
    func algoOfResult() {
        beforeCheck()
        if(check()) {
            Print_kakao = M + "월 급여계산서"
            RESULT = Int(MONEY)!
            Print_kakao += "\n\n월급 : " + inputComma(innum: RESULT) + " 원"
            Result_1.text = inputComma(innum: RESULT) + " 원"
            
            calculate()
            
            MINUS = Int(temp)
            Print_kakao += "\n4대보험금 : - " + inputComma(innum: MINUS) + " 원"
            Result_2.text = "- " + inputComma(innum: MINUS) + " 원"
            Print_kakao += "\n최종월급 : " + inputComma(innum: (RESULT-MINUS)) + " 원"
            Result_3.text = inputComma(innum: (RESULT-MINUS)) + " 원"
            
            showResultAnimation()
            self.detailShow = true
            self.view.endEditing(true)
        }
    }
    
    func algoOfDetail() {
        if(check()) {
            if(detailCount == 0) {
                Result_4.text =
                    "국민연금 (4.5%) : " + inputComma(innum: Int(detail_1)) + " 원\n"
                + "건강보험 (3.4%) : " + inputComma(innum: Int(detail_2)) + " 원\n"
                + "장기요양 (0.4%) : " + inputComma(innum: Int(detail_3)) + " 원\n"
                + "고용보험 (0.8%) : " + inputComma(innum: Int(detail_4)) + " 원"
                Print_kakao += "\n\n4대보험금 상세내역 (9.1%)\n"
                + "국민연금 : " + inputComma(innum: Int(detail_1)) + " 원\n"
                + "건강보험 : " + inputComma(innum: Int(detail_2)) + " 원\n"
                + "장기요양 : " + inputComma(innum: Int(detail_3)) + " 원\n"
                + "고용보험 : " + inputComma(innum: Int(detail_4)) + " 원"
            }
    
            if(detailShow == true) {
                showDetailAnimation()
                detailShow = false
            } else {
                dismissDetailAnimation()
                detailShow = true
            }
        }
    }
}
