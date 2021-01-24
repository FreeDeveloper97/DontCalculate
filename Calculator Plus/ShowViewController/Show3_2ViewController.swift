//
//  View_2_2_ViewController.swift
//  Calculator Plus
//
//  Created by Min_MacBook Pro on 2020/03/13.
//  Copyright © 2020 FreeDeveloper. All rights reserved.
//

import UIKit

class Show3_2ViewController: UIViewController {
    
    @IBOutlet var Text_A: UITextField!
    @IBOutlet var Text_B: UITextField!
    @IBOutlet var Text_C: UITextField!
    @IBOutlet var Text_name_a: UITextField!
    @IBOutlet var Text_name_b: UITextField!
    @IBOutlet var Text_name_c: UITextField!
    
    @IBOutlet var Button_plus_a_outlet: UIButton!
    @IBOutlet var Label_sum1_show: UILabel!
    @IBOutlet var Sum_a: UILabel!
    @IBOutlet var View_sum1_line: UIView!
    
    @IBOutlet var Button_plus_b_outlet: UIButton!
    @IBOutlet var Label_sum2_show: UILabel!
    @IBOutlet var Sum_b: UILabel!
    @IBOutlet var View_sum2_line: UIView!
    
    @IBOutlet var Button_plus_c_outlet: UIButton!
    @IBOutlet var Label_sum3_show: UILabel!
    @IBOutlet var Sum_c: UILabel!
    @IBOutlet var View_sum3_line: UIView!
    
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
    
    @IBOutlet var View_line: UIView!
    
    @IBOutlet var Kakao_outlet: UIButton!
    @IBOutlet var Button_RESET: UIButton!
    
    @IBOutlet var View_View: UIView!

    @IBOutlet var View_dottedline_1: UIView!
    @IBOutlet var View_dottedline_2: UIView!
    
    var A = ""
    var B = ""
    var C = ""
    var SUM = 0
    var DIV = 0
    var RESULT_A = 0
    var RESULT_B = 0
    var RESULT_C = 0
    var Print = ""
    var kakao_print = ""
    var A_sum = 0
    var B_sum = 0
    var C_sum = 0
    var A_name = "A"
    var B_name = "B"
    var C_name = "C"
    
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
            self.resetTransform()
        })
    }
}



extension Show3_2ViewController {
    
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
        return false
    }
    
    func setColor() {
        self.Button_plus_a_outlet.backgroundColor = self.GRAY
        self.Label_sum1_show.textColor = self.GRAY
        self.Sum_a.textColor = self.GRAY
        self.View_sum1_line.backgroundColor = self.GRAY
        
        self.Button_plus_b_outlet.backgroundColor = self.GRAY
        self.Label_sum2_show.textColor = self.GRAY
        self.Sum_b.textColor = self.GRAY
        self.View_sum2_line.backgroundColor = self.GRAY
        
        self.Button_plus_c_outlet.backgroundColor = self.GRAY
        self.Label_sum3_show.textColor = self.GRAY
        self.Sum_c.textColor = self.GRAY
        self.View_sum3_line.backgroundColor = self.GRAY
        
        self.Button_Result_outlet.backgroundColor = self.GRAY
    }
    
    func setRadius() {
        Button_Result_outlet.layer.cornerRadius = 4
        Button_plus_a_outlet.layer.cornerRadius = 4
        Button_plus_b_outlet.layer.cornerRadius = 4
        Button_plus_c_outlet.layer.cornerRadius = 4
        Kakao_outlet.layer.cornerRadius = 4
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
        
        self.Kakao_outlet.alpha = 0
    }
    
    func setTransform() {
        self.View_line.transform = CGAffineTransform(translationX: 0, y: -155)
    
        self.Label_result1_show.transform = CGAffineTransform(translationX: 0, y: -10)
        self.Result_1.transform = CGAffineTransform(translationX: 0, y: -10)
        self.View_result1_line.transform = CGAffineTransform(translationX: 0, y: -10)
        
        self.Label_result2_show.transform = CGAffineTransform(translationX: 0, y: -10)
        self.Result_2.transform = CGAffineTransform(translationX: 0, y: -10)
        self.View_result2_line.transform = CGAffineTransform(translationX: 0, y: -10)
        
        self.Label_result3_show.transform = CGAffineTransform(translationX: 0, y: -10)
        self.Result_3.transform = CGAffineTransform(translationX: 0, y: -10)
        self.View_result3_line.transform = CGAffineTransform(translationX: 0, y: -10)
        
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
    }
    
    func setInputChanged() {
        Text_A.addTarget(self, action: #selector(textFieldDidChange1(textField:)),
            for: UIControl.Event.editingChanged)
        Text_B.addTarget(self, action: #selector(textFieldDidChange2(textField:)),
            for: UIControl.Event.editingChanged)
        Text_C.addTarget(self, action: #selector(textFieldDidChange3(textField:)),
            for: UIControl.Event.editingChanged)
    }
    
    func setDottedLine() {
        View_dottedline_1.backgroundColor = UIColor.clear
        View_dottedline_2.backgroundColor = UIColor.clear
        View_dottedline_1.addDashedBorder()
        View_dottedline_2.addDashedBorder()
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
            self.Sum_a.textColor = self.BUTTON
            self.View_sum1_line.backgroundColor = self.BUTTON
            self.Button_plus_a_outlet.backgroundColor = self.GRAY
        })
    }
    
    func showPlusBAnimation() {
        UIView.animate(withDuration: 0.5, animations: {
            self.Label_sum2_show.textColor = self.BUTTON
            self.Sum_b.textColor = self.BUTTON
            self.View_sum2_line.backgroundColor = self.BUTTON
            self.Button_plus_b_outlet.backgroundColor = self.GRAY
        })
    }
    
    func showPlusCAnimation() {
        UIView.animate(withDuration: 0.5, animations: {
            self.Label_sum3_show.textColor = self.BUTTON
            self.Sum_c.textColor = self.BUTTON
            self.View_sum3_line.backgroundColor = self.BUTTON
            self.Button_plus_c_outlet.backgroundColor = self.GRAY
        })
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
        SUM = 0
        DIV = 0
        RESULT_A = 0
        RESULT_B = 0
        RESULT_C = 0
        Print = ""
        kakao_print = ""
        A_sum = 0
        B_sum = 0
        C_sum = 0
        A_name = "A"
        B_name = "B"
        C_name = "C"
        Text_A.text = ""
        Text_B.text = ""
        Text_C.text = ""
        Sum_a.text = "원"
        Sum_b.text = "원"
        Sum_c.text = "원"
        Result_3.text = ""
        Text_name_a.text = ""
        Text_name_b.text = ""
        Text_name_c.text = ""
    }
    
    func resetColor() {
        self.Button_plus_a_outlet.backgroundColor = self.GRAY
        self.Label_sum1_show.textColor = self.GRAY
        self.Sum_a.textColor = self.GRAY
        self.View_sum1_line.backgroundColor = self.GRAY
        
        self.Button_plus_b_outlet.backgroundColor = self.GRAY
        self.Label_sum2_show.textColor = self.GRAY
        self.Sum_b.textColor = self.GRAY
        self.View_sum2_line.backgroundColor = self.GRAY
        
        self.Button_plus_c_outlet.backgroundColor = self.GRAY
        self.Label_sum3_show.textColor = self.GRAY
        self.Sum_c.textColor = self.GRAY
        self.View_sum3_line.backgroundColor = self.GRAY
        
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
        
        self.Kakao_outlet.alpha = 0
    }
    
    func resetTransform() {
        self.View_line.transform = CGAffineTransform(translationX: 0, y: -155)
        
        self.Label_result1_show.transform = CGAffineTransform(translationX: 0, y: -10)
        self.Result_1.transform = CGAffineTransform(translationX: 0, y: -10)
        self.View_result1_line.transform = CGAffineTransform(translationX: 0, y: -10)
        
        self.Label_result2_show.transform = CGAffineTransform(translationX: 0, y: -10)
        self.Result_2.transform = CGAffineTransform(translationX: 0, y: -10)
        self.View_result2_line.transform = CGAffineTransform(translationX: 0, y: -10)
        
        self.Label_result3_show.transform = CGAffineTransform(translationX: 0, y: -10)
        self.Result_3.transform = CGAffineTransform(translationX: 0, y: -10)
        self.View_result3_line.transform = CGAffineTransform(translationX: 0, y: -10)
        
        self.Kakao_outlet.transform = CGAffineTransform(translationX: 0, y: -10)
        self.Button_RESET.transform = CGAffineTransform(translationX: 0, y: -200)
    }
    
    func inputComma(innum: Int) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        
        let RESULT_COMMA: String = numberFormatter.string(from:NSNumber(value: innum))!
        return RESULT_COMMA
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
    }
}



extension Show3_2ViewController {
    
    func algoOfTextChange1() {
        if(Text_A.text != "") {
            UIView.animate(withDuration: 0.5, animations: {
                self.Button_plus_a_outlet.backgroundColor = self.BUTTON
            })
        } else {
            UIView.animate(withDuration: 0.5, animations: {
                self.Button_plus_a_outlet.backgroundColor = self.GRAY
            })
        }
    }
    
    func algoOfTextChange2() {
        if(Text_B.text != "") {
            UIView.animate(withDuration: 0.5, animations: {
                self.Button_plus_b_outlet.backgroundColor = self.BUTTON
            })
        } else {
            UIView.animate(withDuration: 0.5, animations: {
                self.Button_plus_b_outlet.backgroundColor = self.GRAY
            })
        }
    }
    
    func algoOfTextChange3() {
        if(Text_C.text != "") {
            UIView.animate(withDuration: 0.5, animations: {
                self.Button_plus_c_outlet.backgroundColor = self.BUTTON
            })
        } else {
            UIView.animate(withDuration: 0.5, animations: {
                self.Button_plus_c_outlet.backgroundColor = self.GRAY
            })
        }
    }
    
    func algoOfPlusA() {
        A_sum += Int(A)!
        Sum_a.text = inputComma(innum: A_sum) + " 원"
        Text_A.text = ""
        
        showPlusAAnimation()
        showResultButtonAnimation()
    }
    
    func algoOfPlusB() {
        B_sum += Int(B)!
        Sum_b.text = inputComma(innum: B_sum) + " 원"
        Text_B.text = ""
        
        showPlusBAnimation()
        showResultButtonAnimation()
    }
    
    func algoOfPlusC() {
        C_sum += Int(C)!
        Sum_c.text = inputComma(innum: C_sum) + " 원"
        Text_C.text = ""
        
        showPlusCAnimation()
        showResultButtonAnimation()
    }
    
    func algoOfResult() {
        checkName()
        
        kakao_print = "3명 더치페이정산"
        kakao_print += "\n\n" + A_name + " : " + inputComma(innum: A_sum) + " 원"
        kakao_print += "\n" + B_name + " : " + inputComma(innum: B_sum) + " 원"
        kakao_print += "\n" + C_name + " : " + inputComma(innum: C_sum) + " 원"
        
        SUM = A_sum + B_sum + C_sum
        DIV = SUM / 3
        RESULT_A = A_sum - DIV
        RESULT_B = B_sum - DIV
        RESULT_C = C_sum - DIV
        
        kakao_print += "\n\n총 사용금액 : " + inputComma(innum: SUM) + " 원"
        Result_1.text = inputComma(innum: SUM) + " 원"
        kakao_print += "\n더치페이금액 : " + inputComma(innum: DIV) + " 원"
        Result_2.text = inputComma(innum: DIV) + " 원"
        
        let data: [String: Any] = [
            "A_name": A_name,
            "B_name": B_name,
            "C_name": C_name,
            "RESULT_A": RESULT_A,
            "RESULT_B": RESULT_B,
            "RESULT_C": RESULT_C]
        Print = Calculate.threeAlgorithm(data: data)
        
        kakao_print += "\n\n정산결과\n"
        kakao_print += Print
        Result_3.text = Print
        
        showResultAnimation()
        self.view.endEditing(true)
    }
    
    
}
