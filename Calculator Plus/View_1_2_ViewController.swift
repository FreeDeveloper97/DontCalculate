//
//  View_1_2_ViewController.swift
//  Calculator Plus
//
//  Created by Min_MacBook Pro on 2020/03/21.
//  Copyright © 2020 FreeDeveloper. All rights reserved.
//

import UIKit

class View_1_2_ViewController: UIViewController {
    
    @IBOutlet var View_1: UIView!
    @IBOutlet var View_2: UIView!
    @IBOutlet var Text_1_money: UITextField!
    @IBOutlet var Text_1_num: UITextField!
    @IBOutlet var Text_2_money: UITextField!
    @IBOutlet var Text_2_num: UITextField!
    @IBOutlet var Button_Result_outlet: UIButton!
    @IBOutlet var View_Result: UIView!
    @IBOutlet var Kakao_outlet: UIButton!
    @IBOutlet var Result_1: UILabel!
    @IBOutlet var Result_2: UILabel!
    @IBOutlet var Result_3: UILabel!
    
    @IBOutlet var Button_plus_1_outlet: UIButton!
    @IBOutlet var Text_1_sum: UILabel!
    @IBOutlet var Button_plus_2_outlet: UIButton!
    
    @IBOutlet var Text_2_sum: UILabel!
    
    @IBOutlet var Text_show: UILabel!
    @IBOutlet var Text_detail: UILabel!
    @IBOutlet var Button_detail_outlet: UIButton!
    
    var Money_1 = ""
    var MONEY_1 = 0
    var N_1 = ""
    var Money_2 = ""
    var MONEY_2 = 0
    var N_2 = ""
    var RESULT_1 = 0
    var RESULT_2 = 0
    var kakao_print = ""
    var DETAIL_1 = ""
    var DETAIL_2 = ""
    
    let brown = UIColor(named: "Dynamic_brown")
    let kakao = UIColor(named: "Dynamic_kakao")
    let button = UIColor(named: "Dynamic_button")
    let hint = UIColor(named: "button")
    
    override func viewDidLoad() {
        
        View_1.layer.cornerRadius = 18
//        View_1.layer.borderWidth = 2
//        View_1.layer.borderColor = brown?.cgColor
        
        View_2.layer.cornerRadius = 18
//        View_2.layer.borderWidth = 2
//        View_2.layer.borderColor = brown?.cgColor
        
        Button_plus_1_outlet.layer.cornerRadius = 13
//        Button_plus_1_outlet.layer.borderWidth = 2
//        Button_plus_1_outlet.layer.borderColor = button?.cgColor
        
        Button_plus_2_outlet.layer.cornerRadius = 13
//        Button_plus_2_outlet.layer.borderWidth = 2
//        Button_plus_2_outlet.layer.borderColor = button?.cgColor

        Button_Result_outlet.layer.cornerRadius = 13
//        Button_Result_outlet.layer.borderWidth = 2
//        Button_Result_outlet.layer.borderColor = button?.cgColor

        View_Result.layer.cornerRadius = 13
//        View_Result.layer.borderWidth = 2
//        View_Result.layer.borderColor = brown?.cgColor

        Button_detail_outlet.layer.cornerRadius = 13
//        Button_detail_outlet.layer.borderWidth = 2
//        Button_detail_outlet.layer.borderColor = button?.cgColor
        
        Kakao_outlet.layer.cornerRadius = 13
//        Kakao_outlet.layer.borderWidth = 2
//        Kakao_outlet.layer.borderColor = kakao?.cgColor
        
        Text_1_money.keyboardType = .numberPad
        Text_1_num.keyboardType = .numberPad
        Text_2_money.keyboardType = .numberPad
        Text_2_num.keyboardType = .numberPad
        
        Text_1_money.attributedPlaceholder = NSAttributedString(string: "금액입력후 +버튼", attributes: [NSAttributedString.Key.foregroundColor: brown?.cgColor])
        Text_2_money.attributedPlaceholder = NSAttributedString(string: "금액입력후 +버튼", attributes: [NSAttributedString.Key.foregroundColor: brown?.cgColor])
        
        self.hideKeyboard()
        super.viewDidLoad()
    }
    
    @IBAction func Button_plus_1(_ sender: UIButton) {
        Money_1 = Text_1_money.text!
        if(Money_1 != "")
        {
            MONEY_1 += Int(Money_1)!
            Text_1_money.text = ""
            Text_1_sum.text = "누적금액 : " + String(MONEY_1) + "원"
            if(DETAIL_1 == "")
            {
                DETAIL_1 = Money_1 + " 원"
            }
            else if (DETAIL_1 != "")
            {
                DETAIL_1 += "\n" + Money_1 + " 원"
            }
        }
    }
    
    @IBAction func Button_plus_2(_ sender: UIButton) {
        Money_2 = Text_2_money.text!
        if(Money_2 != "")
        {
            MONEY_2 += Int(Money_2)!
            Text_2_money.text = ""
            Text_2_sum.text = "누적금액 : " + String(MONEY_2) + "원"
            if(DETAIL_2 == "")
            {
                DETAIL_2 = Money_2 + " 원"
            }
            else if (DETAIL_2 != "")
            {
                DETAIL_2 += "\n" + Money_2 + " 원"
            }
        }
    }
    
    @IBAction func Button_detail(_ sender: UIButton) {
        if RESULT_1 != 0
        {
            Text_show.text = "상세내역 :"
            Text_detail.text = "\n" + DETAIL_1 + "\n\n" + DETAIL_2
        }
    }
    
    @IBAction func Button_Result(_ sender: UIButton) {
        N_1 = Text_1_num.text!
        N_2 = Text_2_num.text!
        if(check())
        {
            kakao_print = "더치페이1 총액 : " + String(MONEY_1) + " 원"
            kakao_print += "\n더치페이1 계산인원 : " + N_1 + " 명"
            RESULT_1 = MONEY_1 / Int(N_1)!
            kakao_print += "\n더치페이1 결과 : " + String(RESULT_1) + " 원"
            Result_1.text = String(RESULT_1) + " 원"
            
            kakao_print += "\n\n더치페이2 총액 : " + String(MONEY_2) + " 원"
            kakao_print += "\n더치페이2 계산인원 : " + N_2 + " 명"
            RESULT_2 = MONEY_2 / Int(N_2)!
            kakao_print += "\n더치페이2 결과 : " + String(RESULT_2) + " 원"
            Result_2.text = String(RESULT_2) + " 원"
            
            kakao_print += "\n\n더치페이1 : " + String(RESULT_1) + " 원"
            kakao_print += "\n더치페이2 : " + String(RESULT_2) + " 원"
            kakao_print += "\n둘다해당 : " + String(RESULT_1 + RESULT_2) + " 원"
            Result_3.text = String(RESULT_1 + RESULT_2) + " 원"
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
        Money_1 = ""
        MONEY_1 = 0
        N_1 = ""
        Money_2 = ""
        MONEY_2 = 0
        N_2 = ""
        RESULT_1 = 0
        RESULT_2 = 0
        kakao_print = ""
        DETAIL_1 = ""
        DETAIL_2 = ""
        Text_1_money.text = ""
        Text_1_num.text = ""
        Text_1_sum.text = "누적금액 : 0원"
        Text_2_money.text = ""
        Text_2_num.text = ""
        Text_2_sum.text = "누적금액 : 0원"
        Result_1.text = ""
        Result_2.text = ""
        Result_3.text = ""
        Text_show.text = ""
        Text_detail.text = ""
    }
    
    func check() -> Bool
    {
        if Text_1_sum.text == "누적금액 : 0원"
        {
            return false
        }
        else if N_1 == ""
        {
            return false
        }
        else if Text_2_sum.text == "누적금액 : 0원"
        {
            return false
        }
        else if N_2 == ""
        {
            return false
        }
        return true
    }
    

}
extension UIViewController {
    func hideKeyboard() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self,
            action: #selector(UIViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
