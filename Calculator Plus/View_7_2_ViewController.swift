//
//  View_7_2_ViewController.swift
//  Calculator Plus
//
//  Created by Min_MacBook Pro on 2020/04/02.
//  Copyright © 2020 FreeDeveloper. All rights reserved.
//

import UIKit

class View_7_2_ViewController: UIViewController {

    @IBOutlet var View_1: UIView!
    @IBOutlet var Button_Result_outlet: UIButton!
    @IBOutlet var View_Result: UIView!
    @IBOutlet var Result_1: UILabel!
    @IBOutlet var Result_2: UILabel!
    @IBOutlet var Result_3: UILabel!
    @IBOutlet var Button_url_outlet: UIButton!
    @IBOutlet var Text_money: UITextField!
    @IBOutlet var Text_m: UITextField!
    @IBOutlet var Result_show: UILabel!
    @IBOutlet var Result_detail: UILabel!
    @IBOutlet var Button_detail_outlet: UIButton!
    @IBOutlet var Button_kakao_outlet: UIButton!
    
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
    
    let brown = UIColor(named: "Dynamic_brown")
    let button = UIColor(named: "Dynamic_button")
    let kakao = UIColor(named: "Dynamic_kakao")
    
    override func viewDidLoad() {
        
        View_1.layer.cornerRadius = 18
//        View_1.layer.borderWidth = 2
//        View_1.layer.borderColor = brown?.cgColor

        Button_Result_outlet.layer.cornerRadius = 13
//        Button_Result_outlet.layer.borderWidth = 2
//        Button_Result_outlet.layer.borderColor = button?.cgColor
        
        Button_detail_outlet.layer.cornerRadius = 13
//        Button_detail_outlet.layer.borderWidth = 2
//        Button_detail_outlet.layer.borderColor = button?.cgColor

        View_Result.layer.cornerRadius = 18
//        View_Result.layer.borderWidth = 2
//        View_Result.layer.borderColor = brown?.cgColor
        
        Button_url_outlet.layer.cornerRadius = 13
//        Button_url_outlet.layer.borderWidth = 2
//        Button_url_outlet.layer.borderColor = brown?.cgColor
        
        Button_kakao_outlet.layer.cornerRadius = 13
//        Button_kakao_outlet.layer.borderWidth = 2
//        Button_kakao_outlet.layer.borderColor = kakao?.cgColor
        
        Text_m.keyboardType = .numberPad
        Text_money.keyboardType = .numberPad
        
        self.hideKeyboard()
        super.viewDidLoad()
    }
    
    @IBAction func Button_Result(_ sender: UIButton) {
        MONEY = Text_money.text!
        M = Text_m.text!
        if(check())
        {
            Print_kakao = M + "월 월급계산서"
            RESULT = Int(MONEY)!
            Print_kakao += "\n\n월급 : " + String(RESULT) + " 원"
            Result_1.text = String(RESULT) + " 원"
            //계산
            calculate()
            MINUS = Int(temp)
            Print_kakao += "\n4대보험금 결과 : - " + String(MINUS) + " 원"
            Result_2.text = "- " + String(MINUS) + " 원"
            Print_kakao += "\n월급 최종결과 : " + String(RESULT - MINUS) + " 원"
            Result_3.text = String(RESULT - MINUS) + " 원"
        }
    }
    
    @IBAction func Button_detail(_ sender: UIButton) {
        if(temp != 0.0)
        {
            Result_show.text = "상세내역 :"
            Result_detail.text =
                "\n국민연금 : " + String(Int(detail_1)) + " 원\n"
            + "건강보험 : " + String(Int(detail_2)) + " 원\n"
            + "장기요양 : " + String(Int(detail_3)) + " 원\n"
            + "고용보험 : " + String(Int(detail_4)) + " 원"
            Print_kakao += "\n\n상세내역\n"
            + "국민연금 : " + String(Int(detail_1)) + " 원\n"
            + "건강보험 : " + String(Int(detail_2)) + " 원\n"
            + "장기요양 : " + String(Int(detail_3)) + " 원\n"
            + "고용보험 : " + String(Int(detail_4)) + " 원"
        }
    }
    
    @IBAction func Button_kakao(_ sender: UIButton) {
        if(temp != 0.0)
        {
            let template = KMTTextTemplate { (KMTTextTemplateBuilder) in
                KMTTextTemplateBuilder.text = self.Print_kakao
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
    
    
    @IBAction func Button_url(_ sender: UIButton) {
        if let url = URL(string: "http://insure.fpvhxm.com")
        {
            UIApplication.shared.open(url, options: [:])
        }
    }
    
    @IBAction func Button_reset(_ sender: UIButton) {
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
        Result_1.text = "원"
        Result_2.text = "원"
        Result_3.text = "원"
        Result_show.text = ""
        Result_detail.text = ""
    }
    
    func check() -> Bool
    {
        if MONEY == ""
        {
            return false
        }
        return true
    }
    
    func calculate()
    {
        detail_1 = Double(RESULT) * 0.045
        detail_2 = Double(RESULT) * 0.03335
        detail_3 = detail_2 * 0.05125 * 2
        detail_4 = Double(RESULT) * 0.008
        temp = detail_1 + detail_2 + detail_3 + detail_4
    }
    

}
