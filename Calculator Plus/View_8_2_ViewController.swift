//
//  View_8_2_ViewController.swift
//  Calculator Plus
//
//  Created by Min_MacBook Pro on 2020/03/26.
//  Copyright © 2020 FreeDeveloper. All rights reserved.
//

import UIKit

class View_8_2_ViewController: UIViewController {

    @IBOutlet var View_1: UIView!
    @IBOutlet var Text_now: UITextField!
    @IBOutlet var Text_plus: UITextField!
    @IBOutlet var View_2: UIView!
    @IBOutlet var Text_card: UITextField!
    @IBOutlet var Text_save: UITextField!
    @IBOutlet var Button_Result_outlet: UIButton!
    @IBOutlet var View_Result: UIView!
    @IBOutlet var Result_1: UILabel!
    @IBOutlet var Result_2: UILabel!
    @IBOutlet var Result_3: UILabel!
    @IBOutlet var Button_plus_outlet: UIButton!
    @IBOutlet var Show_card: UILabel!
    @IBOutlet var Text_M: UITextField!
    
    @IBOutlet var Button_kakao_outlet: UIButton!
    
    
    var NOW = ""
    var Plus = ""
    var PLUS = 0
    var CARD = ""
    var SAVE = ""
    var MINUS = 0
    var RESULT = 0
    
    var M = "?"
    var KAKAO_PRINT = ""
    var detail = ""
    
    let brown = UIColor(named: "Dynamic_brown")
    let button = UIColor(named: "Dynamic_button")
    
    override func viewDidLoad() {
        
        View_1.layer.cornerRadius = 18
//        View_1.layer.borderWidth = 2
//        View_1.layer.borderColor = brown?.cgColor
        
        View_2.layer.cornerRadius = 18
//        View_2.layer.borderWidth = 2
//        View_2.layer.borderColor = brown?.cgColor
        
        Button_plus_outlet.layer.cornerRadius = 13

        Button_Result_outlet.layer.cornerRadius = 13
//        Button_Result_outlet.layer.borderWidth = 2
//        Button_Result_outlet.layer.borderColor = button?.cgColor

        View_Result.layer.cornerRadius = 13
//        View_Result.layer.borderWidth = 2
//        View_Result.layer.borderColor = brown?.cgColor
        
        Button_kakao_outlet.layer.cornerRadius = 13
        
        Text_M.keyboardType = .numberPad
        Text_now.keyboardType = .numberPad
        Text_plus.keyboardType = .numberPad
        Text_card.keyboardType = .numberPad
        Text_save.keyboardType = .numberPad
        
        Text_card.attributedPlaceholder = NSAttributedString(string: "금액입력후 +버튼", attributes: [NSAttributedString.Key.foregroundColor: brown?.cgColor])
        
        self.hideKeyboard()
        super.viewDidLoad()
    }
    
    @IBAction func Button_plus(_ sender: UIButton) {
        CARD = Text_card.text!
        if(CARD != "")
        {
            MINUS += Int(CARD)!
            Show_card.text = "누적금액 : " + String(MINUS) + "원"
            Text_card.text = ""
            if(detail == "")
            {
                detail = "- " + String(CARD) + " 원"
            }
            else if(detail != "")
            {
                detail += "\n- " + String(CARD) + " 원"
            }
        }
    }
    
    @IBAction func Button_Result(_ sender: UIButton) {
        M = Text_M.text!
        NOW = Text_now.text!
        Plus = Text_plus.text!
        SAVE = Text_save.text!
        if(check())
        {
            KAKAO_PRINT = M + "월 카드대금납부"
            KAKAO_PRINT += "\n\nA 현재 : " + NOW + " 원"
            KAKAO_PRINT += "\nB 수입 : " + Plus + " 원"
            
            PLUS = Int(NOW)! + Int(Plus)!
            MINUS += Int(SAVE)!
            
            KAKAO_PRINT += "\nC 지출 : -" + String(MINUS) + " 원"
            
            Result_1.text = String(PLUS) + " 원"
            Result_2.text = "- " + String(MINUS) + " 원"
            Result_3.text = String(PLUS - MINUS) + " 원"
            
            KAKAO_PRINT += "\n\n결과"
            KAKAO_PRINT += "\n A + B : " + String(PLUS) + " 원"
            KAKAO_PRINT += "\n A + B - C : " + String(PLUS - MINUS) + " 원"
            KAKAO_PRINT += "\n\n지출 상세내역\n" + detail
            KAKAO_PRINT += "\n- " + SAVE + " 원(적금)"
        }
    }
    
    @IBAction func Button_kakao(_ sender: UIButton) {
        if KAKAO_PRINT != ""
        {
            
            let template = KMTTextTemplate { (KMTTextTemplateBuilder) in
                KMTTextTemplateBuilder.text = self.KAKAO_PRINT
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
        NOW = ""
        Plus = ""
        PLUS = 0
        CARD = ""
        SAVE = ""
        MINUS = 0
        RESULT = 0
        M = "?"
        KAKAO_PRINT = ""
        detail = ""
        Text_now.text = ""
        Text_plus.text = ""
        Text_card.text = ""
        Text_save.text = ""
        Show_card.text = "누적금액 : 0원"
        Result_1.text = "원"
        Result_2.text = "원"
        Result_3.text = "원"
        Text_M.text = ""
    }
    
    func check() -> Bool
    {
        if NOW == ""
        {
            return false
        }
        else if Plus == ""
        {
            return false
        }
        else if MINUS == 0
        {
            return false
        }
        else if SAVE == ""
        {
            return false
        }
        if M == ""
        {
            M = "?"
        }
        return true
    }
    

}
