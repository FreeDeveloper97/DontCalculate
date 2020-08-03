//
//  View_8_1_ViewController.swift
//  Calculator Plus
//
//  Created by Min_MacBook Pro on 2020/03/26.
//  Copyright © 2020 FreeDeveloper. All rights reserved.
//

import UIKit

class View_8_1_ViewController: UIViewController {

    @IBOutlet var Text_now: UITextField!
    @IBOutlet var Text_plus: UITextField!
    @IBOutlet var Text_card: UITextField!
    @IBOutlet var Button_Result_outlet: UIButton!
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
    var MINUS = 0
    var RESULT = 0
    
    var M = "?"
    var KAKAO_PRINT = ""
    var detail = ""
    
    let brown = UIColor(named: "Dynamic_brown")
    let button = UIColor(named: "Dynamic_button")
    
    override func viewDidLoad() {
        
        Button_Result_outlet.layer.cornerRadius = 4
        Button_plus_outlet.layer.cornerRadius = 4
        Button_kakao_outlet.layer.cornerRadius = 4
        
        Text_M.keyboardType = .numberPad
        Text_now.keyboardType = .numberPad
        Text_plus.keyboardType = .numberPad
        Text_card.keyboardType = .numberPad
        
        self.hideKeyboard()
        super.viewDidLoad()
    }
    
    @IBAction func Button_plus(_ sender: UIButton) {
        CARD = Text_card.text!
        if(CARD != "")
        {
            MINUS += Int(CARD)!
            Show_card.text = inputComma(innum: MINUS) + "원"
            Text_card.text = ""
            if(detail == "")
            {
                detail = "- " + inputComma(innum: Int(CARD)!) + " 원"
            }
            else if(detail != "")
            {
                detail += "\n- " + inputComma(innum: Int(CARD)!) + " 원"
            }
        }
    }
    
    @IBAction func Button_Result(_ sender: UIButton) {
        M = Text_M.text!
        NOW = Text_now.text!
        Plus = Text_plus.text!
        if(check())
        {
            KAKAO_PRINT = M + "월 카드대금납부"
            KAKAO_PRINT += "\n\nA 현재 : " + inputComma(innum: Int(NOW)!) + " 원"
            KAKAO_PRINT += "\nB 수입 : " + inputComma(innum: Int(Plus)!) + " 원"
            KAKAO_PRINT += "\nC 지출 : -" + inputComma(innum: MINUS) + " 원"
            
            PLUS = Int(NOW)! + Int(Plus)!
            Result_1.text = inputComma(innum: PLUS) + " 원"
            Result_2.text = "- " + inputComma(innum: MINUS) + " 원"
            Result_3.text = inputComma(innum: PLUS-MINUS) + " 원"
            
            KAKAO_PRINT += "\n\n결과"
            KAKAO_PRINT += "\n A + B : " + inputComma(innum: PLUS) + " 원"
            KAKAO_PRINT += "\n A + B - C : " + inputComma(innum: (PLUS-MINUS)) + " 원"
            KAKAO_PRINT += "\n\n지출 상세내역\n" + detail
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
        MINUS = 0
        RESULT = 0
        M = "?"
        KAKAO_PRINT = ""
        Text_now.text = ""
        Text_plus.text = ""
        Text_card.text = ""
        Show_card.text = "원"
        Result_1.text = "원"
        Result_2.text = "원"
        Result_3.text = "원"
        Text_M.text = ""
        detail = ""
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
        if M == ""
        {
            M = "?"
        }
        return true
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
