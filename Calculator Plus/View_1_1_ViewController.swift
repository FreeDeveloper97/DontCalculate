//
//  View_1_1_ViewController.swift
//  Calculator Plus
//
//  Created by Min_MacBook Pro on 2020/03/19.
//  Copyright © 2020 FreeDeveloper. All rights reserved.
//

import UIKit

class View_1_1_ViewController: UIViewController {
    
//    @IBOutlet var View_1: UIView!
    @IBOutlet var Input_money: UITextField!
//    @IBOutlet var Button_plus_outlet: UIButton!
//    @IBOutlet var Text_money: UILabel!
//    @IBOutlet var Text_n: UITextField!
//    @IBOutlet var Button_Result_outlet: UIButton!
//    @IBOutlet var Result_1: UILabel!
//    @IBOutlet var View_Result: UIView!
//    @IBOutlet var Button_kakao_outlet: UIButton!
////    @IBOutlet var View_2: UIView!
//    @IBOutlet var Button_detail_outlet: UIButton!
//    @IBOutlet var Text_detail: UILabel!
//    @IBOutlet var Text_show: UILabel!
//
//    @IBOutlet var View_bank: UIView!
//    @IBOutlet var Text_bank: UITextField!
//
//    @IBOutlet var Text_bank_show: UILabel!
    
    @IBOutlet var Button_Plus: UIButton!
    @IBOutlet var Button_Result: UIButton!
    @IBOutlet var View_Sum: UIView!
    @IBOutlet var Button_Detail: UIButton!
    @IBOutlet var Button_Kakao: UIButton!
    
    
    var InputMoney = ""
    var MONEY = 0
    var N = ""
    var RESULT = 0
    var kakao_print = ""
    var DETAIL = ""
    var RESULT_COMMA = ""
    
    let brown = UIColor(named: "Dynamic_brown")
    let kakao = UIColor(named: "Dynamic_kakao")
    let button = UIColor(named: "Dynamic_button")
    let GRAY = UIColor(named: "ColorGray")
    
    
    override func viewDidLoad() {
        
//        View_1.layer.cornerRadius = 18
//
//        Button_plus_outlet.layer.cornerRadius = 13
//
//        Button_Result_outlet.layer.cornerRadius = 13
//
//        View_Result.layer.cornerRadius = 13
//
//        View_bank.layer.cornerRadius = 18
//
//        Button_kakao_outlet.layer.cornerRadius = 13
//
//        Button_detail_outlet.layer.cornerRadius = 13
//
//        Input_money.keyboardType = .numberPad
//        Text_n.keyboardType = .numberPad
//
        Input_money.attributedPlaceholder = NSAttributedString(string: "금액입력후 +버튼", attributes: [NSAttributedString.Key.foregroundColor: GRAY?.cgColor])
//
//        Text_bank.attributedPlaceholder = NSAttributedString(string: "은행, 계좌번호 입력", attributes: [NSAttributedString.Key.foregroundColor: brown?.cgColor])
//
        self.hideKeyboard()
        
        
        
//        Button_Plus.layer.cornerRadius = Button_Plus.layer.frame.size.width/2
//        Button_Plus.clipsToBounds = true
        Button_Plus.layer.cornerRadius = 4
        Button_Plus.clipsToBounds = true
        
//        Button_Result.layer.cornerRadius = Button_Result.layer.frame.size.width/2
//        Button_Result.clipsToBounds = true
        Button_Result.layer.cornerRadius = 4
        Button_Result.clipsToBounds = true
        
//        View_Sum.layer.cornerRadius = 8
        
        Button_Detail.layer.cornerRadius = 4
        Button_Detail.clipsToBounds = true
        
        Button_Kakao.layer.cornerRadius = 4
        Button_Kakao.clipsToBounds = true
        
        super.viewDidLoad()
    }
    
//    @IBAction func Button_plus(_ sender: UIButton) {
//        InputMoney = Input_money.text!
//        if(InputMoney != "")
//        {
//            MONEY += Int(InputMoney)!
//            Input_money.text = ""
//            Text_money.text = "누적금액 : " + String(MONEY) + "원"
//            if(DETAIL == "")
//            {
//                DETAIL = String(InputMoney) + " 원"
//            }
//            else if (DETAIL != "")
//            {
//                DETAIL += "\n" + String(InputMoney) + " 원"
//            }
//        }
//    }
    
    
    
//    @IBAction func Button_Result(_ sender: UIButton) {
//        //1. string 가져오기
//        N = Text_n.text!
//        if(check())
//        {
//            kakao_print = "총 사용금액 : " + String(MONEY) + " 원"
//            kakao_print += "\n더치페이 인원수 : " + N + " 명"
//
//            RESULT = MONEY / Int(N)!
//
//            inputComma()
//            Result_1.text = String(RESULT_COMMA) + " 원"
////            Result_1.text = String(RESULT) + " 원"
//            Text_bank_show.text = Text_bank.text!
//
//
//            kakao_print += "\n\n더치페이 결과 : " + String(RESULT_COMMA) + " 원"
////            kakao_print += "\n\n더치페이 결과 : " + String(RESULT) + " 원"
//            kakao_print += "\n계좌 : " + Text_bank.text!
//        }
//
//    }
    
//    @IBAction func Button_detail(_ sender: UIButton) {
//        if(RESULT != 0)
//        {
//            Text_show.text = "상세내역 :"
//            Text_detail.text = "\n" + DETAIL
//            kakao_print += "\n\n상세내역\n" + DETAIL
//        }
//    }
    
    
//    @IBAction func Button_kakao(_ sender: UIButton) {
//        if kakao_print != ""
//        {
//
//            let template = KMTTextTemplate { (KMTTextTemplateBuilder) in
//                KMTTextTemplateBuilder.text = self.kakao_print
//                //KMTTextTemplateBuilder.buttonTitle = "Title"
//                KMTTextTemplateBuilder.link = KMTLinkObject(builderBlock: { (linkBuilder) in
//                    linkBuilder.mobileWebURL = URL(string: "https://developers.kakao.com")
//                })
//            }
//
//            // 서버에서 콜백으로 받을 정보
//            let serverCallbackArgs = ["user_id": "FDEE",
//                                      "product_id": "415849"]
//
//            // 카카오링크 실행
//            KLKTalkLinkCenter.shared().sendDefault(with: template, serverCallbackArgs: serverCallbackArgs, success: { (warningMsg, argumentMsg) in
//
//                // 성공
//                print("warning message: \(String(describing: warningMsg))")
//                print("argument message: \(String(describing: argumentMsg))")
//
//            }, failure: { (error) in
//
//                // 실패
//                UIAlertController.showMessage(error.localizedDescription)
//                print("error \(error)")
//            })
//
//        }
//    }
    
//    @IBAction func Button_reset(_ sender: UIButton) {
//        InputMoney = ""
//        MONEY = 0
//        N = ""
//        RESULT = 0
//        kakao_print = ""
//        DETAIL = ""
//        Input_money.text = ""
//        Text_money.text = "누적금액 : 0원"
//        Text_n.text = ""
//        Result_1.text = ""
//        Text_detail.text = ""
//        Text_show.text = ""
//        Text_bank.text = ""
//        Text_bank_show.text = ""
//    }
    
//    func check() -> Bool
//    {
//        if Text_money.text == "누적금액 : 0원"
//        {
//            return false
//        }
//        else if N == ""
//        {
//            return false
//        }
//        return true
//    }
//
//    func inputComma()
//    {
//        let numberFormatter = NumberFormatter()
//        numberFormatter.numberStyle = .decimal
//
//        RESULT_COMMA = numberFormatter.string(from:NSNumber(value: RESULT))!
//    }
    
    
}
