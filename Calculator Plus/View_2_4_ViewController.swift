//
//  View_2_4_ViewController.swift
//  Calculator Plus
//
//  Created by Min_MacBook Pro on 2020/03/13.
//  Copyright © 2020 FreeDeveloper. All rights reserved.
//

import UIKit

class View_2_4_ViewController: UIViewController {

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
          self.view.endEditing(true)
    }
    
    @IBOutlet var View_A: UIView!
    @IBOutlet var View_B: UIView!
    @IBOutlet var View_C: UIView!
    @IBOutlet var View_D: UIView!
    @IBOutlet var View_E: UIView!
    @IBOutlet var Text_A: UITextField!
    @IBOutlet var Text_B: UITextField!
    @IBOutlet var Text_C: UITextField!
    @IBOutlet var Text_D: UITextField!
    @IBOutlet var Text_E: UITextField!
    @IBOutlet var Button_Result_outlet: UIButton!
    @IBOutlet var View_Result: UIView!
    @IBOutlet var Kakao_outlet: UIButton!
    @IBOutlet var Result_1: UILabel!
    @IBOutlet var Result_2: UILabel!
    @IBOutlet var Result_3: UILabel!
    
    @IBOutlet var Button_plus_a: UIButton!
    @IBOutlet var Button_plus_b: UIButton!
    @IBOutlet var Button_plus_c: UIButton!
    @IBOutlet var Button_plus_d: UIButton!
    @IBOutlet var Button_plus_e: UIButton!
    @IBOutlet var Text_sum_a: UILabel!
    @IBOutlet var Text_sum_b: UILabel!
    @IBOutlet var Text_sum_c: UILabel!
    @IBOutlet var Text_sum_d: UILabel!
    @IBOutlet var Text_sum_e: UILabel!
    @IBOutlet var Text_name_a: UITextField!
    @IBOutlet var Text_name_b: UITextField!
    @IBOutlet var Text_name_c: UITextField!
    @IBOutlet var Text_name_d: UITextField!
    @IBOutlet var Text_name_e: UITextField!
    
    
    
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
    
    let brown = UIColor(named: "Dynamic_brown")
    let kakao = UIColor(named: "Dynamic_kakao")
    let button = UIColor(named: "Dynamic_button")
    
    
    override func viewDidLoad() {
        
        View_A.layer.cornerRadius = 18
//        View_A.layer.borderWidth = 2
//        View_A.layer.borderColor = brown?.cgColor
        
        View_B.layer.cornerRadius = 18
//        View_B.layer.borderWidth = 2
//        View_B.layer.borderColor = brown?.cgColor
        
        View_C.layer.cornerRadius = 18
//        View_C.layer.borderWidth = 2
//        View_C.layer.borderColor = brown?.cgColor
        
        View_D.layer.cornerRadius = 18
//        View_D.layer.borderWidth = 2
//        View_D.layer.borderColor = brown?.cgColor
        
        View_E.layer.cornerRadius = 18
//        View_E.layer.borderWidth = 2
//        View_E.layer.borderColor = brown?.cgColor
        Button_plus_a.layer.cornerRadius = 13
        Button_plus_b.layer.cornerRadius = 13
        Button_plus_c.layer.cornerRadius = 13
        Button_plus_d.layer.cornerRadius = 13
        Button_plus_e.layer.cornerRadius = 13
        
        Button_Result_outlet.layer.cornerRadius = 13
//        Button_Result_outlet.layer.borderWidth = 2
//        Button_Result_outlet.layer.borderColor = button?.cgColor
        
        View_Result.layer.cornerRadius = 13
//        View_Result.layer.borderWidth = 2
//        View_Result.layer.borderColor = brown?.cgColor
        
        Kakao_outlet.layer.cornerRadius = 13
//        Kakao_outlet.layer.borderWidth = 2
//        Kakao_outlet.layer.borderColor = kakao?.cgColor
        
        Text_A.keyboardType = .numberPad
        Text_B.keyboardType = .numberPad
        Text_C.keyboardType = .numberPad
        Text_D.keyboardType = .numberPad
        Text_E.keyboardType = .numberPad
        
        Text_A.attributedPlaceholder = NSAttributedString(string: "금액입력후 +버튼", attributes: [NSAttributedString.Key.foregroundColor: brown?.cgColor])
        Text_B.attributedPlaceholder = NSAttributedString(string: "금액입력후 +버튼", attributes: [NSAttributedString.Key.foregroundColor: brown?.cgColor])
        Text_C.attributedPlaceholder = NSAttributedString(string: "금액입력후 +버튼", attributes: [NSAttributedString.Key.foregroundColor: brown?.cgColor])
        Text_D.attributedPlaceholder = NSAttributedString(string: "금액입력후 +버튼", attributes: [NSAttributedString.Key.foregroundColor: brown?.cgColor])
        Text_E.attributedPlaceholder = NSAttributedString(string: "금액입력후 +버튼", attributes: [NSAttributedString.Key.foregroundColor: brown?.cgColor])
        
        self.hideKeyboard()
        super.viewDidLoad()
    }
    
    @IBAction func Button_plus_a(_ sender: UIButton) {
        A = Text_A.text!
        if(A != "")
        {
            A_sum += Int(A)!
            Text_sum_a.text = "누적금액 : " + String(A_sum) + "원"
            Text_A.text = ""
        }
    }
    @IBAction func Button_plus_b(_ sender: UIButton) {
        B = Text_B.text!
        if(B != "")
        {
            B_sum += Int(B)!
            Text_sum_b.text = "누적금액 : " + String(B_sum) + "원"
            Text_B.text = ""
        }
    }
    @IBAction func Button_plus_c(_ sender: UIButton) {
        C = Text_C.text!
        if(C != "")
        {
            C_sum += Int(C)!
            Text_sum_c.text = "누적금액 : " + String(C_sum) + "원"
            Text_C.text = ""
        }
    }
    @IBAction func Button_plus_d(_ sender: UIButton) {
        D = Text_D.text!
        if(D != "")
        {
            D_sum += Int(D)!
            Text_sum_d.text = "누적금액 : " + String(D_sum) + "원"
            Text_D.text = ""
        }
    }
    @IBAction func Button_plus_e(_ sender: UIButton) {
        E = Text_E.text!
        if(E != "")
        {
            E_sum += Int(E)!
            Text_sum_e.text = "누적금액 : " + String(E_sum) + "원"
            Text_E.text = ""
        }
    }
    
    
    
    
    @IBAction func Button_Result(_ sender: UIButton) {
        if(check())
        {
            if Text_name_a.text != ""
            {
                A_name = Text_name_a.text!
            }
            if Text_name_b.text != ""
            {
                B_name = Text_name_b.text!
            }
            if Text_name_c.text != ""
            {
                C_name = Text_name_c.text!
            }
            if Text_name_d.text != ""
            {
                D_name = Text_name_d.text!
            }
            if Text_name_e.text != ""
            {
                E_name = Text_name_e.text!
            }
            kakao_print = A_name + " : " + A + " 원"
            kakao_print += "\n" + B_name + " : " + B + " 원"
            kakao_print += "\n" + C_name + " : " + C + " 원"
            kakao_print += "\n" + D_name + " : " + D + " 원"
            kakao_print += "\n" + E_name + " : " + E + " 원"
            
            SUM = A_sum + B_sum + C_sum + D_sum + E_sum
            DIV = SUM / 5
            RESULT_A = A_sum - DIV
            RESULT_B = B_sum - DIV
            RESULT_C = C_sum - DIV
            RESULT_D = D_sum - DIV
            RESULT_E = E_sum - DIV
            
            kakao_print += "\n\n총 사용금액 : " + String(SUM) + " 원"
            Result_1.text = String(SUM) + " 원"
            kakao_print += "\n더치페이금액 : " + String(DIV) + " 원"
            Result_2.text = String(DIV) + " 원"
            
            bubble()
            kakao_print += "\n\n정산결과\n"
            kakao_print += Print
            Result_3.text = Print
            array_before = []
            array_after = []
            State = 0
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
        Text_sum_a.text = "누적금액 : 0원"
        Text_sum_b.text = "누적금액 : 0원"
        Text_sum_c.text = "누적금액 : 0원"
        Text_sum_d.text = "누적금액 : 0원"
        Text_sum_e.text = "누적금액 : 0원"
        Result_1.text = ""
        Result_2.text = ""
        Result_3.text = ""
        Text_name_a.text = ""
        Text_name_b.text = ""
        Text_name_c.text = ""
        Text_name_d.text = ""
        Text_name_e.text = ""
    }
    
    func check() -> Bool
    {
        if A_sum == 0
        {
            return false
        }
        else if B_sum == 0
        {
            return false
        }
        else if C_sum == 0
        {
            return false
        }
        else if D_sum == 0
        {
            return false
        }
        else if E_sum == 0
        {
            return false
        }
        return true
    }
    
    func bubble()
    {
        if RESULT_A > 0
        {
            State+=1
        }
        if RESULT_B > 0
        {
            State+=1
        }
        if RESULT_C > 0
        {
            State+=1
        }
        if RESULT_D > 0
        {
            State+=1
        }
        if RESULT_E > 0
        {
            State+=1
        }
        
        switch State {
        case 1:
            case1()
        case 2:
            case2()
        case 3:
            case3()
        case 4:
            case4()
        default:
            Print = "Error"
        }
    }
    
    func case1()
    {
        //나머지 네명이 한명한테 송금한다
        if RESULT_A > 0
        {
            if RESULT_B != 0
            {
                Print = B_name + " → " + A_name + " " + String(-RESULT_B) + " 원 송금\n"
            }
            if RESULT_C != 0
            {
                Print += C_name + " → " + A_name + " " + String(-RESULT_C) + " 원 송금\n"
            }
            if RESULT_D != 0
            {
                Print += D_name + " → " + A_name + " " + String(-RESULT_D) + " 원 송금\n"
            }
            if RESULT_E != 0
            {
                Print += E_name + " → " + A_name + " " + String(-RESULT_E) + " 원 송금"
            }
        }
        else if RESULT_B > 0
        {
            if RESULT_A != 0
            {
                Print = A_name + " → " + B_name + " " + String(-RESULT_A) + " 원 송금\n"
            }
            if RESULT_C != 0
            {
                Print += C_name + " → " + B_name + " " + String(-RESULT_C) + " 원 송금\n"
            }
            if RESULT_D != 0
            {
                Print += D_name + " → " + B_name + " " + String(-RESULT_D) + " 원 송금\n"
            }
            if RESULT_E != 0
            {
                Print += E_name + " → " + B_name + " " + String(-RESULT_E) + " 원 송금"
            }
        }
        else if RESULT_C > 0
        {
            if RESULT_A != 0
            {
                Print = A_name + " → " + C_name + " " + String(-RESULT_A) + " 원 송금\n"
            }
            if RESULT_B != 0
            {
                Print += B_name + " → " + C_name + " " + String(-RESULT_B) + " 원 송금\n"
            }
            if RESULT_D != 0
            {
                Print += D_name + " → " + C_name + " " + String(-RESULT_D) + " 원 송금\n"
            }
            if RESULT_E != 0
            {
                Print += E_name + " → " + C_name + " " + String(-RESULT_E) + " 원 송금"
            }
        }
        else if RESULT_D > 0
        {
            if RESULT_A != 0
            {
                Print = A_name + " → " + D_name + " " + String(-RESULT_A) + " 원 송금\n"
            }
            if RESULT_B != 0
            {
                Print += B_name + " → " + D_name + " " + String(-RESULT_B) + " 원 송금\n"
            }
            if RESULT_C != 0
            {
                Print += C_name + " → " + D_name + " " + String(-RESULT_C) + " 원 송금\n"
            }
            if RESULT_E != 0
            {
                Print += E_name + " → " + D_name + " " + String(-RESULT_E) + " 원 송금"
            }
        }
        else if RESULT_E > 0
        {
            if RESULT_A != 0
            {
                Print = A_name + " → " + E_name + " " + String(-RESULT_A) + " 원 송금\n"
            }
            if RESULT_B != 0
            {
                Print += B_name + " → " + E_name + " " + String(-RESULT_B) + " 원 송금\n"
            }
            if RESULT_C != 0
            {
                Print += C_name + " → " + E_name + " " + String(-RESULT_C) + " 원 송금\n"
            }
            if RESULT_D != 0
            {
                Print += D_name + " → " + E_name + " " + String(-RESULT_D) + " 원 송금"
            }
        }
    }
    
    func case2()
    {
        //받는사람2 주는사람3
        find()
        
        if array_after[0] > -(array_after[4])
        {
            if array_after[1] > -(array_after[2])
            {
                var temp = array_after[0] + array_after[4]
                Print = FIVE + " → " + ONE + " " + String(-array_after[4]) + " 원 송금\n"
                        + FOUR + " → " + ONE + " " + String(temp) + " 원 송금\n"
                        + FOUR + " → " + TWO + " " + String(-temp - array_after[3]) + " 원 송금\n"
                        + THREE + " → " + TWO + " " + String(-array_after[2]) + " 원 송금"
            }
            else if array_after[1] == -(array_after[2])
            {
                Print = FIVE + " → " + ONE + " " + String(-array_after[4]) + " 원 송금\n"
                        + FOUR + " → " + ONE + " " + String(-array_after[3]) + " 원 송금\n"
                        + THREE + " → " + TWO + " " + String(array_after[1]) + " 원 송금"
            }
            else if array_after[1] < -(array_after[2])
            {
                var temp = array_after[0] + array_after[3] + array_after[4]
                Print = FIVE + " → " + ONE + " " + String(-array_after[4]) + " 원 송금\n"
                        + FOUR + " → " + ONE + " " + String(-array_after[3]) + " 원 송금\n"
                        + THREE + " → " + ONE + " " + String(temp) + " 원 송금\n"
                        + THREE + " → " + TWO + " " + String(array_after[1]) + " 원 송금"
            }
        }
        else if array_after[0] < -(array_after[4])
        {
            var temp = -(array_after[0] + array_after[4])
            Print = FIVE + " → " + ONE + " " + String(array_after[0]) + " 원 송금\n"
                    + FIVE + " → " + TWO + " " + String(temp) + " 원 송금\n"
                    + FOUR + " → " + TWO + " " + String(-array_after[3]) + " 원 송금\n"
                    + THREE + " → " + TWO + " " + String(-array_after[2]) + " 원 송금"
        }
        else if array_after[0] == -(array_after[4])
        {
            Print = FIVE + " → " + ONE + " " + String(array_after[0]) + " 원 송금\n"
                    + FOUR + " → " + TWO + " " + String(-array_after[3]) + " 원 송금\n"
                    + THREE + " → " + TWO + " " + String(-array_after[2]) + " 원 송금"
        }
    }
    
    func case3()
    {
        //받는사람3 주는사람2
        find()
        
        if array_after[0] < -(array_after[4])
        {
            if array_after[2] < -(array_after[3])
            {
                var temp = -(array_after[0] + array_after[4])
                Print = FIVE + " → " + ONE + " " + String(array_after[0]) + " 원 송금\n"
                        + FIVE + " → " + TWO + " " + String(temp) + " 원 송금\n"
                        + FOUR + " → " + TWO + " " + String(array_after[1]-temp) + " 원 송금\n"
                        + FOUR + " → " + THREE + " " + String(array_after[2]) + " 원 송금"
            }
            else if array_after[2] > -(array_after[3])
            {
                var temp = -(array_after[0] + array_after[1] + array_after[4])
                Print = FIVE + " → " + ONE + " " + String(array_after[0]) + " 원 송금\n"
                        + FIVE + " → " + TWO + " " + String(array_after[1]) + " 원 송금\n"
                        + FIVE + " → " + THREE + " " + String(temp) + " 원 송금\n"
                        + FOUR + " → " + THREE + " " + String(array_after[2]-temp) + " 원 송금"
            }
            else if array_after[2] == -(array_after[3])
            {
                Print = FIVE + " → " + ONE + " " + String(array_after[0]) + " 원 송금\n"
                        + FIVE + " → " + TWO + " " + String(array_after[1]) + " 원 송금\n"
                        + FOUR + " → " + THREE + " " + String(array_after[2]) + " 원 송금"
            }
        }
        else if array_after[0] > -(array_after[4])
        {
            var temp = array_after[0] + array_after[4]
            Print = FIVE + " → " + ONE + " " + String(-array_after[4]) + " 원 송금\n"
                    + FOUR + " → " + ONE + " " + String(temp) + " 원 송금\n"
                    + FOUR + " → " + TWO + " " + String(array_after[1]) + " 원 송금\n"
                    + FOUR + " → " + THREE + " " + String(array_after[2]) + " 원 송금"
        }
        else if array_after[0] == -(array_after[4])
        {
            Print = FIVE + " → " + ONE + " " + String(array_after[0]) + " 원 송금\n"
                    + FOUR + " → " + TWO + " " + String(array_after[1]) + " 원 송금\n"
                    + FOUR + " → " + THREE + " " + String(array_after[2]) + " 원 송금"
        }
    }
    
    func case4()
    {
        //한명이 나머지 네명한테 송금한다
        if RESULT_A < 0
        {
            Print = A_name + " → " + B_name + " " + String(RESULT_B) + " 원 송금\n"
                    + A_name + " → " + C_name + " " + String(RESULT_C) + " 원 송금\n"
                    + A_name + " → " + D_name + " " + String(RESULT_D) + " 원 송금\n"
                    + A_name + " → " + E_name + " " + String(RESULT_E) + " 원 송금"
        }
        else if RESULT_B < 0
        {
            Print = B_name + " → " + A_name + " " + String(RESULT_A) + " 원 송금\n"
                    + B_name + " → " + C_name + " " + String(RESULT_C) + " 원 송금\n"
                    + B_name + " → " + D_name + " " + String(RESULT_D) + " 원 송금\n"
                    + B_name + " → " + E_name + " " + String(RESULT_E) + " 원 송금"
        }
        else if RESULT_C < 0
        {
            Print = C_name + " → " + A_name + " " + String(RESULT_A) + " 원 송금\n"
                    + C_name + " → " + B_name + " " + String(RESULT_B) + " 원 송금\n"
                    + C_name + " → " + D_name + " " + String(RESULT_D) + " 원 송금\n"
                    + C_name + " → " + E_name + " " + String(RESULT_E) + " 원 송금"
        }
        else if RESULT_D < 0
        {
            Print = D_name + " → " + A_name + " " + String(RESULT_A) + " 원 송금\n"
                    + D_name + " → " + B_name + " " + String(RESULT_B) + " 원 송금\n"
                    + D_name + " → " + C_name + " " + String(RESULT_C) + " 원 송금\n"
                    + D_name + " → " + E_name + " " + String(RESULT_E) + " 원 송금"
        }
        else if RESULT_E < 0
        {
            Print = E_name + " → " + A_name + " " + String(RESULT_A) + " 원 송금\n"
                    + E_name + " → " + B_name + " " + String(RESULT_B) + " 원 송금\n"
                    + E_name + " → " + C_name + " " + String(RESULT_C) + " 원 송금\n"
                    + E_name + " → " + D_name + " " + String(RESULT_D) + " 원 송금"
        }
    }
    
    func find()
    {
        array_before.append(RESULT_A)
        array_before.append(RESULT_B)
        array_before.append(RESULT_C)
        array_before.append(RESULT_D)
        array_before.append(RESULT_E)
        array_after = array_before.sorted(by: >)
        
        for i in stride(from:0, to: 5, by: 1)
        {
            var num = i+1
            if array_after[i] == RESULT_A
            {
                switch num {
                case 1:
                    ONE = A_name
                case 2:
                    TWO = A_name
                case 3:
                    THREE = A_name
                case 4:
                    FOUR = A_name
                case 5:
                    FIVE = A_name
                default:
                    Print = "Error"
                }
            }
            else if array_after[i] == RESULT_B
            {
                switch num {
                case 1:
                    ONE = B_name
                case 2:
                    TWO = B_name
                case 3:
                    THREE = B_name
                case 4:
                    FOUR = B_name
                case 5:
                    FIVE = B_name
                default:
                    Print = "Error"
                }
            }
            else if array_after[i] == RESULT_C
            {
                switch num {
                case 1:
                    ONE = C_name
                case 2:
                    TWO = C_name
                case 3:
                    THREE = C_name
                case 4:
                    FOUR = C_name
                case 5:
                    FIVE = C_name
                default:
                    Print = "Error"
                }
            }
            else if array_after[i] == RESULT_D
            {
                switch num {
                case 1:
                    ONE = D_name
                case 2:
                    TWO = D_name
                case 3:
                    THREE = D_name
                case 4:
                    FOUR = D_name
                case 5:
                    FIVE = D_name
                default:
                    Print = "Error"
                }
            }
            else if array_after[i] == RESULT_E
            {
                switch num {
                case 1:
                    ONE = E_name
                case 2:
                    TWO = E_name
                case 3:
                    THREE = E_name
                case 4:
                    FOUR = E_name
                case 5:
                    FIVE = E_name
                default:
                    Print = "Error"
                }
            }
        }
    }

}
