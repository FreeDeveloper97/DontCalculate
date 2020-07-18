//
//  View_2_1_ViewController.swift
//  Calculator Plus
//
//  Created by Min_MacBook Pro on 2020/03/13.
//  Copyright © 2020 FreeDeveloper. All rights reserved.
//

import UIKit


class View_2_1_ViewController: UIViewController {
    
    
    @IBOutlet var View_A: UIView!
    @IBOutlet var View_B: UIView!
    @IBOutlet var Text_A: UITextField!
    @IBOutlet var Text_B: UITextField!
    @IBOutlet var Button_Result_outlet: UIButton!
    @IBOutlet var View_Result: UIView!
    @IBOutlet var Result_1: UILabel!
    @IBOutlet var Result_2: UILabel!
    @IBOutlet var Result_3: UILabel!
    @IBOutlet var Button_plus_a_outlet: UIButton!
    @IBOutlet var Button_plus_b_outlet: UIButton!
    @IBOutlet var Show_a: UILabel!
    @IBOutlet var Show_b: UILabel!
    @IBOutlet var Kakao_outlet: UIButton!
    
    @IBOutlet var Text_name_A: UITextField!
    @IBOutlet var Text_name_B: UITextField!
    
    var A = ""
    var B = ""
    var SUM = 0
    var DIV = 0
    var RESULT_A = 0
    var RESULT_B = 0
    var Print = ""
    var kakao_print = ""
    var A_sum = 0
    var B_sum = 0
    var A_name = "A"
    var B_name = "B"
    
    let brown = UIColor(named: "Dynamic_brown")
    let kakao = UIColor(named: "Dynamic_kakao")
    let button = UIColor(named: "Dynamic_button")
    
    override func viewDidLoad() {
        
        View_A.layer.cornerRadius = 18
        View_B.layer.cornerRadius = 18
        Button_Result_outlet.layer.cornerRadius = 13
        Button_plus_a_outlet.layer.cornerRadius = 13
        Button_plus_b_outlet.layer.cornerRadius = 13
        View_Result.layer.cornerRadius = 13
        Kakao_outlet.layer.cornerRadius = 13
        Text_A.keyboardType = .numberPad
        Text_B.keyboardType = .numberPad
       
        Text_A.attributedPlaceholder = NSAttributedString(string: "금액입력후 +버튼", attributes: [NSAttributedString.Key.foregroundColor: brown?.cgColor])
        Text_B.attributedPlaceholder = NSAttributedString(string: "금액입력후 +버튼", attributes: [NSAttributedString.Key.foregroundColor: brown?.cgColor])
        
        self.hideKeyboard()
        super.viewDidLoad()
    }
    
    @IBAction func Button_plus_a(_ sender: UIButton) {
        A = Text_A.text!
        if(A != "")
        {
            A_sum += Int(A)!
            Show_a.text = "누적금액 : " + inputComma(innum: A_sum) + "원"
            Text_A.text = ""
        }
    }
    @IBAction func Button_plus_b(_ sender: UIButton) {
        B = Text_B.text!
        if(B != "")
        {
            B_sum += Int(B)!
            Show_b.text = "누적금액 : " + inputComma(innum: B_sum) + "원"
            Text_B.text = ""
        }
    }
    
    

    @IBAction func Button_Result(_ sender: UIButton) {
        if(check())
        {
            if Text_name_A.text != ""
            {
                A_name = Text_name_A.text!
            }
            if Text_name_B.text != ""
            {
                B_name = Text_name_B.text!
            }
            kakao_print = A_name + " : " + inputComma(innum: A_sum) + " 원"
            kakao_print += "\n" + B_name + " : " + inputComma(innum: B_sum) + " 원"
            
            SUM = A_sum + B_sum
            DIV = SUM / 2
            RESULT_A = A_sum - DIV
            RESULT_B = B_sum - DIV
            
            kakao_print += "\n\n총 사용금액 : " + inputComma(innum: SUM) + " 원"
            Result_1.text = inputComma(innum: SUM) + " 원"
            kakao_print += "\n더치페이금액 : " + inputComma(innum: DIV) + " 원"
            Result_2.text = inputComma(innum: DIV) + " 원"
            
            bubble()
            kakao_print += "\n\n정산결과\n"
            kakao_print += Print
            Result_3.text = Print
        }
        
                
    }
    
    @IBAction func Button_kakao(_ sender: UIButton) {
        if kakao_print != ""
        {
            
            let template = KMTTextTemplate { (KMTTextTemplateBuilder) in
                KMTTextTemplateBuilder.text = self.kakao_print
                //KMTTextTemplateBuilder.buttonTitle = "Title"
                KMTTextTemplateBuilder.link = KMTLinkObject(builderBlock: { (linkBuilder) in
                    linkBuilder.mobileWebURL = URL(string: "https://developers.kakao.com")
                })
            }
            
            // 서버에서 콜백으로 받을 정보
            let serverCallbackArgs = ["user_id": "FDEE",
                                      "product_id": "415849"]
            
            // 카카오링크 실행
            KLKTalkLinkCenter.shared().sendDefault(with: template, serverCallbackArgs: serverCallbackArgs, success: { (warningMsg, argumentMsg) in
                
                // 성공
                print("warning message: \(String(describing: warningMsg))")
                print("argument message: \(String(describing: argumentMsg))")
                
            }, failure: { (error) in
                
                // 실패
                UIAlertController.showMessage(error.localizedDescription)
                print("error \(error)")
            })
        }
    }
    
    @IBAction func Button_reset(_ sender: UIButton) {
        A = ""
        B = ""
        SUM = 0
        DIV = 0
        RESULT_A = 0
        RESULT_B = 0
        Print = ""
        kakao_print = ""
        A_sum = 0
        B_sum = 0
        A_name = "A"
        B_name = "B"
        Text_A.text = ""
        Text_B.text = ""
        Show_a.text = "누적금액 : 0원"
        Show_b.text = "누적금액 : 0원"
        Result_1.text = ""
        Result_2.text = ""
        Result_3.text = ""
        Text_name_A.text = ""
        Text_name_B.text = ""
        
    }
    func check() -> Bool
    {
//        if A_sum == 0
//        {
//            return false
//        }
//        else if B_sum == 0
//        {
//            return false
//        }
        return true
    }
    
    func bubble()
    {
        if RESULT_A > RESULT_B
        {
            Print = B_name + " → " + A_name + " " + inputComma(innum: RESULT_A) + " 원 송금"
        }
        else if RESULT_A < RESULT_B
        {
            Print = A_name + " → " + B_name + " " + inputComma(innum: RESULT_B) + " 원 송금"
        }
        else
        {
            Print = "Error"
        }
    }
    
    //ver1.1 콤마 추가
    func inputComma(innum: Int) -> String
    {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        
        let RESULT_COMMA: String = numberFormatter.string(from:NSNumber(value: innum))!
        return RESULT_COMMA
    }
}
