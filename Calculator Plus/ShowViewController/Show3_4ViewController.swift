//
//  View_2_4_ViewController.swift
//  Calculator Plus
//
//  Created by Min_MacBook Pro on 2020/03/13.
//  Copyright © 2020 FreeDeveloper. All rights reserved.
//

import UIKit

class Show3_4ViewController: UIViewController {
    
    @IBOutlet var Text_name_a: UITextField!
    @IBOutlet var Text_name_b: UITextField!
    @IBOutlet var Text_name_c: UITextField!
    @IBOutlet var Text_name_d: UITextField!
    @IBOutlet var Text_name_e: UITextField!
    
    @IBOutlet var Text_A: UITextField!
    @IBOutlet var Text_B: UITextField!
    @IBOutlet var Text_C: UITextField!
    @IBOutlet var Text_D: UITextField!
    @IBOutlet var Text_E: UITextField!
    
    @IBOutlet var Button_plus_a: UIButton!
    @IBOutlet var Button_plus_b: UIButton!
    @IBOutlet var Button_plus_c: UIButton!
    @IBOutlet var Button_plus_d: UIButton!
    @IBOutlet var Button_plus_e: UIButton!
    
    @IBOutlet weak var Label_sum1_show: UILabel!
    @IBOutlet weak var Label_sum2_show: UILabel!
    @IBOutlet weak var Label_sum3_show: UILabel!
    @IBOutlet weak var Label_sum4_show: UILabel!
    @IBOutlet weak var Label_sum5_show: UILabel!
    
    @IBOutlet var Text_sum_a: UILabel!
    @IBOutlet var Text_sum_b: UILabel!
    @IBOutlet var Text_sum_c: UILabel!
    @IBOutlet var Text_sum_d: UILabel!
    @IBOutlet var Text_sum_e: UILabel!
    
    @IBOutlet weak var View_sum1_line: UIView!
    @IBOutlet weak var View_sum2_line: UIView!
    @IBOutlet weak var View_sum3_line: UIView!
    @IBOutlet weak var View_sum4_line: UIView!
    @IBOutlet weak var View_sum5_line: UIView!
    
    @IBOutlet weak var Label_result1_show: UILabel!
    @IBOutlet weak var Label_result2_show: UILabel!
    @IBOutlet weak var Label_result3_show: UILabel!
    
    @IBOutlet var Result_1: UILabel!
    @IBOutlet var Result_2: UILabel!
    @IBOutlet var Result_3: UILabel!
    
    @IBOutlet weak var View_result1_line: UIView!
    @IBOutlet weak var View_result2_line: UIView!
    @IBOutlet weak var View_result3_line: UIView!
    
    @IBOutlet weak var View_line: UIView!
    @IBOutlet var Button_Result_outlet: UIButton!
    @IBOutlet var Kakao_outlet: UIButton!
    @IBOutlet weak var Button_RESET: UIButton!
    
    @IBOutlet weak var View_View: UIView!
    
    @IBOutlet weak var View_dottedline_1: UIView!
    @IBOutlet weak var View_dottedline_2: UIView!
    @IBOutlet weak var View_dottedline_3: UIView!
    @IBOutlet weak var View_dottedline_4: UIView!
    
    var A = ""
    var B = ""
    var C = ""
    var D = ""
    var E = ""
    var SUM = 0
    var DIV = 0
    var RESULT_A = 0
    var RESULT_B = 0
    var RESULT_C = 0
    var RESULT_D = 0
    var RESULT_E = 0
    var Print = ""
    var kakao_print = ""
    var State = 0
    var array_before: [Int] = []
    var array_after: [Int] = []
    var ONE = ""
    var TWO = ""
    var THREE = ""
    var FOUR = ""
    var FIVE = ""
    var A_sum = 0
    var B_sum = 0
    var C_sum = 0
    var D_sum = 0
    var E_sum = 0
    var A_name = "A"
    var B_name = "B"
    var C_name = "C"
    var D_name = "D"
    var E_name = "E"
    
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
    @objc func textFieldDidChange3(textField: UITextField){
        algoOfTextChange3()
    }
    @objc func textFieldDidChange4(textField: UITextField){
        algoOfTextChange4()
    }
    @objc func textFieldDidChange5(textField: UITextField){
        algoOfTextChange5()
    }
    
    @IBAction func Button_plus_a(_ sender: UIButton) {
        A = Text_A.text!
        if(A != "") {
            algoOfPlusA()
        }
    }
    @IBAction func Button_plus_b(_ sender: UIButton) {
        B = Text_B.text!
        if(B != "") {
            algoOfPlusB()
        }
    }
    @IBAction func Button_plus_c(_ sender: UIButton) {
        C = Text_C.text!
        if(C != "") {
            algoOfPlusC()
        }
    }
    @IBAction func Button_plus_d(_ sender: UIButton) {
        D = Text_D.text!
        if(D != "") {
            algoOfPlusD()
        }
    }
    @IBAction func Button_plus_e(_ sender: UIButton) {
        E = Text_E.text!
        if(E != "") {
            algoOfPlusE()
        }
    }
    @IBAction func Button_Result(_ sender: UIButton) {
        if(check()) {
            algoOfResult()
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
            self.reesetTransform()
        })
    }
}



extension Show3_4ViewController {
    
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
        if(A_sum != 0) {
            return true
        }
        if(B_sum != 0) {
            return true
        }
        if(C_sum != 0) {
            return true
        }
        if(D_sum != 0) {
            return true
        }
        if(E_sum != 0) {
            return true
        }
        return false
    }
    
    func inputComma(innum: Int) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        
        let RESULT_COMMA: String = numberFormatter.string(from:NSNumber(value: innum))!
        return RESULT_COMMA
    }
    
    func setColor() {
        self.Button_plus_a.backgroundColor = self.GRAY
        self.Button_plus_b.backgroundColor = self.GRAY
        self.Button_plus_c.backgroundColor = self.GRAY
        self.Button_plus_d.backgroundColor = self.GRAY
        self.Button_plus_e.backgroundColor = self.GRAY
        self.Label_sum1_show.textColor = self.GRAY
        self.Label_sum2_show.textColor = self.GRAY
        self.Label_sum3_show.textColor = self.GRAY
        self.Label_sum4_show.textColor = self.GRAY
        self.Label_sum5_show.textColor = self.GRAY
        self.Text_sum_a.textColor = self.GRAY
        self.Text_sum_b.textColor = self.GRAY
        self.Text_sum_c.textColor = self.GRAY
        self.Text_sum_d.textColor = self.GRAY
        self.Text_sum_e.textColor = self.GRAY
        self.View_sum1_line.backgroundColor = self.GRAY
        self.View_sum2_line.backgroundColor = self.GRAY
        self.View_sum3_line.backgroundColor = self.GRAY
        self.View_sum4_line.backgroundColor = self.GRAY
        self.View_sum5_line.backgroundColor = self.GRAY
        self.Button_Result_outlet.backgroundColor = self.GRAY
    }
    
    func setRadius() {
        Button_plus_a.layer.cornerRadius = 4
        Button_plus_b.layer.cornerRadius = 4
        Button_plus_c.layer.cornerRadius = 4
        Button_plus_d.layer.cornerRadius = 4
        Button_plus_e.layer.cornerRadius = 4
        Button_Result_outlet.layer.cornerRadius = 4
        Kakao_outlet.layer.cornerRadius = 4
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
        
        self.Kakao_outlet.alpha = 0
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
        
        self.View_line.transform = CGAffineTransform(translationX: 0, y: -155)
        self.Kakao_outlet.transform = CGAffineTransform(translationX: 0, y: -10)
        self.Button_RESET.transform = CGAffineTransform(translationX: 0, y: -200)
    }
    
    func showAnimation() {
        self.View_View.alpha = 0
        UIView.animate(withDuration: 0.5, animations: {
            self.View_View.alpha = 1
        })
    }
    
    func setInputType() {
        Text_A.keyboardType = .numberPad
        Text_B.keyboardType = .numberPad
        Text_C.keyboardType = .numberPad
        Text_D.keyboardType = .numberPad
        Text_E.keyboardType = .numberPad
    }
    
    func setInputChanged() {
        Text_A.addTarget(self, action: #selector(textFieldDidChange1(textField:)),
            for: UIControl.Event.editingChanged)
        Text_B.addTarget(self, action: #selector(textFieldDidChange2(textField:)),
            for: UIControl.Event.editingChanged)
        Text_C.addTarget(self, action: #selector(textFieldDidChange3(textField:)),
            for: UIControl.Event.editingChanged)
        Text_D.addTarget(self, action: #selector(textFieldDidChange4(textField:)),
            for: UIControl.Event.editingChanged)
        Text_E.addTarget(self, action: #selector(textFieldDidChange5(textField:)),
            for: UIControl.Event.editingChanged)
    }
    
    func setDottedLine() {
        View_dottedline_1.backgroundColor = UIColor.clear
        View_dottedline_2.backgroundColor = UIColor.clear
        View_dottedline_3.backgroundColor = UIColor.clear
        View_dottedline_4.backgroundColor = UIColor.clear
        View_dottedline_1.addDashedBorder()
        View_dottedline_2.addDashedBorder()
        View_dottedline_3.addDashedBorder()
        View_dottedline_4.addDashedBorder()
    }
    
    func showResultButtonAnimation() {
        if(check()) {
            UIView.animate(withDuration: 0.5, animations: {
                self.Button_Result_outlet.backgroundColor = self.BUTTON
            })
        }
    }
    
    func showPlusAAnimation() {
        UIView.animate(withDuration: 0.5, animations: {
            self.Label_sum1_show.textColor = self.BUTTON
            self.Text_sum_a.textColor = self.BUTTON
            self.View_sum1_line.backgroundColor = self.BUTTON
            self.Button_plus_a.backgroundColor = self.GRAY
        })
    }
    
    func showPlusBAnimation() {
        UIView.animate(withDuration: 0.5, animations: {
            self.Label_sum2_show.textColor = self.BUTTON
            self.Text_sum_b.textColor = self.BUTTON
            self.View_sum2_line.backgroundColor = self.BUTTON
            self.Button_plus_b.backgroundColor = self.GRAY
        })
    }
    
    func showPlusCAnimation() {
        UIView.animate(withDuration: 0.5, animations: {
            self.Label_sum3_show.textColor = self.BUTTON
            self.Text_sum_c.textColor = self.BUTTON
            self.View_sum3_line.backgroundColor = self.BUTTON
            self.Button_plus_c.backgroundColor = self.GRAY
        })
    }
    
    func showPlusDAnimation() {
        UIView.animate(withDuration: 0.5, animations: {
            self.Label_sum4_show.textColor = self.BUTTON
            self.Text_sum_d.textColor = self.BUTTON
            self.View_sum4_line.backgroundColor = self.BUTTON
            self.Button_plus_d.backgroundColor = self.GRAY
        })
    }
    
    func showPlusEAnimation() {
        UIView.animate(withDuration: 0.5, animations: {
            self.Label_sum5_show.textColor = self.BUTTON
            self.Text_sum_e.textColor = self.BUTTON
            self.View_sum5_line.backgroundColor = self.BUTTON
            self.Button_plus_e.backgroundColor = self.GRAY
        })
    }
    
    func checkName() {
        if Text_name_a.text != "" {
            A_name = Text_name_a.text!
        }
        if Text_name_b.text != "" {
            B_name = Text_name_b.text!
        }
        if Text_name_c.text != "" {
            C_name = Text_name_c.text!
        }
        if Text_name_d.text != "" {
            D_name = Text_name_d.text!
        }
        if Text_name_e.text != "" {
            E_name = Text_name_e.text!
        }
    }
    
    func showResultAnimation() {
        UIView.animate(withDuration: 0.5, animations: {
            self.View_line.transform = CGAffineTransform(translationX: 0, y: 0)
            self.Button_RESET.transform = CGAffineTransform(translationX: 0, y: 0)
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
            
            self.Label_result3_show.alpha = 1
            self.Label_result3_show.transform = CGAffineTransform(translationX: 0, y: 0)
            self.Result_3.alpha = 1
            self.Result_3.transform = CGAffineTransform(translationX: 0, y: 0)
            self.View_result3_line.alpha = 1
            self.View_result3_line.transform = CGAffineTransform(translationX: 0, y: 0)
            
            self.Kakao_outlet.alpha = 1
            self.Kakao_outlet.transform = CGAffineTransform(translationX: 0, y: 0)
        })
    }
    
    func reset() {
        A = ""
        B = ""
        C = ""
        D = ""
        E = ""
        SUM = 0
        DIV = 0
        RESULT_A = 0
        RESULT_B = 0
        RESULT_C = 0
        RESULT_D = 0
        RESULT_E = 0
        Print = ""
        kakao_print = ""
        State = 0
        array_before = []
        array_after = []
        ONE = ""
        TWO = ""
        THREE = ""
        FOUR = ""
        FIVE = ""
        A_sum = 0
        B_sum = 0
        C_sum = 0
        D_sum = 0
        E_sum = 0
        A_name = "A"
        B_name = "B"
        C_name = "C"
        D_name = "D"
        E_name = "E"
        Text_A.text = ""
        Text_B.text = ""
        Text_C.text = ""
        Text_D.text = ""
        Text_E.text = ""
        Text_sum_a.text = "원"
        Text_sum_b.text = "원"
        Text_sum_c.text = "원"
        Text_sum_d.text = "원"
        Text_sum_e.text = "원"
        Result_3.text = ""
        Text_name_a.text = ""
        Text_name_b.text = ""
        Text_name_c.text = ""
        Text_name_d.text = ""
        Text_name_e.text = ""
    }
    
    func resetColor() {
        self.Button_plus_a.backgroundColor = self.GRAY
        self.Button_plus_b.backgroundColor = self.GRAY
        self.Button_plus_c.backgroundColor = self.GRAY
        self.Button_plus_d.backgroundColor = self.GRAY
        self.Button_plus_e.backgroundColor = self.GRAY
        
        self.Label_sum1_show.textColor = self.GRAY
        self.Label_sum2_show.textColor = self.GRAY
        self.Label_sum3_show.textColor = self.GRAY
        self.Label_sum4_show.textColor = self.GRAY
        self.Label_sum5_show.textColor = self.GRAY
        
        self.Text_sum_a.textColor = self.GRAY
        self.Text_sum_b.textColor = self.GRAY
        self.Text_sum_c.textColor = self.GRAY
        self.Text_sum_d.textColor = self.GRAY
        self.Text_sum_e.textColor = self.GRAY
        
        self.View_sum1_line.backgroundColor = self.GRAY
        self.View_sum2_line.backgroundColor = self.GRAY
        self.View_sum3_line.backgroundColor = self.GRAY
        self.View_sum4_line.backgroundColor = self.GRAY
        self.View_sum5_line.backgroundColor = self.GRAY
        
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
        
        self.Kakao_outlet.alpha = 0
    }
    
    func reesetTransform() {
        self.Label_result1_show.transform = CGAffineTransform(translationX: 0, y: -10)
        self.Label_result2_show.transform = CGAffineTransform(translationX: 0, y: -10)
        self.Label_result3_show.transform = CGAffineTransform(translationX: 0, y: -10)
        
        self.Result_1.transform = CGAffineTransform(translationX: 0, y: -10)
        self.Result_2.transform = CGAffineTransform(translationX: 0, y: -10)
        self.Result_3.transform = CGAffineTransform(translationX: 0, y: -10)
        
        self.View_result1_line.transform = CGAffineTransform(translationX: 0, y: -10)
        self.View_result2_line.transform = CGAffineTransform(translationX: 0, y: -10)
        self.View_result3_line.transform = CGAffineTransform(translationX: 0, y: -10)
        
        self.View_line.transform = CGAffineTransform(translationX: 0, y: -155)
        self.Kakao_outlet.transform = CGAffineTransform(translationX: 0, y: -10)
        self.Button_RESET.transform = CGAffineTransform(translationX: 0, y: -200)
    }
}



extension Show3_4ViewController {
    
    func algoOfTextChange1() {
        if(Text_A.text != "") {
            UIView.animate(withDuration: 0.5, animations: {
                self.Button_plus_a.backgroundColor = self.BUTTON
            })
        } else {
            UIView.animate(withDuration: 0.5, animations: {
                self.Button_plus_a.backgroundColor = self.GRAY
            })
        }
    }
    
    func algoOfTextChange2() {
        if(Text_B.text != "") {
            UIView.animate(withDuration: 0.5, animations: {
                self.Button_plus_b.backgroundColor = self.BUTTON
            })
        } else {
            UIView.animate(withDuration: 0.5, animations: {
                self.Button_plus_b.backgroundColor = self.GRAY
            })
        }
    }
    
    func algoOfTextChange3() {
        if(Text_C.text != "") {
            UIView.animate(withDuration: 0.5, animations: {
                self.Button_plus_c.backgroundColor = self.BUTTON
            })
        } else {
            UIView.animate(withDuration: 0.5, animations: {
                self.Button_plus_c.backgroundColor = self.GRAY
            })
        }
    }
    
    func algoOfTextChange4() {
        if(Text_D.text != "") {
            UIView.animate(withDuration: 0.5, animations: {
                self.Button_plus_d.backgroundColor = self.BUTTON
            })
        } else {
            UIView.animate(withDuration: 0.5, animations: {
                self.Button_plus_d.backgroundColor = self.GRAY
            })
        }
    }
    
    func algoOfTextChange5() {
        if(Text_E.text != "") {
            UIView.animate(withDuration: 0.5, animations: {
                self.Button_plus_e.backgroundColor = self.BUTTON
            })
        } else {
            UIView.animate(withDuration: 0.5, animations: {
                self.Button_plus_e.backgroundColor = self.GRAY
            })
        }
    }
    
    func algoOfPlusA() {
        A_sum += Int(A)!
        Text_sum_a.text = inputComma(innum: A_sum) + " 원"
        Text_A.text = ""
        
        showPlusAAnimation()
        showResultButtonAnimation()
    }
    
    func algoOfPlusB() {
        B_sum += Int(B)!
        Text_sum_b.text = inputComma(innum: B_sum) + " 원"
        Text_B.text = ""
        
        showPlusBAnimation()
        showResultButtonAnimation()
    }
    
    func algoOfPlusC() {
        C_sum += Int(C)!
        Text_sum_c.text = inputComma(innum: C_sum) + " 원"
        Text_C.text = ""
        
        showPlusCAnimation()
        showResultButtonAnimation()
    }
    
    func algoOfPlusD() {
        D_sum += Int(D)!
        Text_sum_d.text = inputComma(innum: D_sum) + " 원"
        Text_D.text = ""
        
        showPlusDAnimation()
        showResultButtonAnimation()
    }
    
    func algoOfPlusE() {
        E_sum += Int(E)!
        Text_sum_e.text = inputComma(innum: E_sum) + " 원"
        Text_E.text = ""
        
        showPlusEAnimation()
        showResultButtonAnimation()
    }
    
    func algoOfResult() {
        checkName()
        
        kakao_print = "5명 더치페이정산"
        kakao_print += "\n\n" + A_name + " : " + inputComma(innum: A_sum) + " 원"
        kakao_print += "\n" + B_name + " : " + inputComma(innum: B_sum) + " 원"
        kakao_print += "\n" + C_name + " : " + inputComma(innum: C_sum) + " 원"
        kakao_print += "\n" + D_name + " : " + inputComma(innum: D_sum) + " 원"
        kakao_print += "\n" + E_name + " : " + inputComma(innum: E_sum) + " 원"
        
        SUM = A_sum + B_sum + C_sum + D_sum + E_sum
        DIV = SUM / 5
        RESULT_A = A_sum - DIV
        RESULT_B = B_sum - DIV
        RESULT_C = C_sum - DIV
        RESULT_D = D_sum - DIV
        RESULT_E = E_sum - DIV
        
        kakao_print += "\n\n총 사용금액 : " + inputComma(innum: SUM) + " 원"
        Result_1.text = inputComma(innum: SUM) + " 원"
        kakao_print += "\n더치페이금액 : " + inputComma(innum: DIV) + " 원"
        Result_2.text = inputComma(innum: DIV) + " 원"
        
        let data: [String: Any] = [
            "A_name": A_name,
            "B_name": B_name,
            "C_name": C_name,
            "D_name": D_name,
            "E_name": E_name,
            "RESULT_A": RESULT_A,
            "RESULT_B": RESULT_B,
            "RESULT_C": RESULT_C,
            "RESULT_D": RESULT_D,
            "RESULT_E": RESULT_E]
        Print = Calculate.fiveAlgorithm(data: data)
        
        kakao_print += "\n\n정산결과\n"
        kakao_print += Print
        Result_3.text = Print
        
        showResultAnimation()
        self.view.endEditing(true)
    }
}
