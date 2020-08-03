//
//  View_7_ViewController.swift
//  Calculator Plus
//
//  Created by Min_MacBook Pro on 2020/03/26.
//  Copyright © 2020 FreeDeveloper. All rights reserved.
//

import UIKit

class View_7_1_ViewController: UIViewController{

    @IBOutlet var Text_m: UITextField!
    @IBOutlet var Text_h: UITextField!
    @IBOutlet var Text_pay: UITextField!
    @IBOutlet var Button_Result_outlet: UIButton!
    @IBOutlet var Button_url_outlet: UIButton!
    @IBOutlet var Result_1: UILabel!
    @IBOutlet var Result_2: UILabel!
    @IBOutlet var Result_3: UILabel!
    @IBOutlet var Result_4: UILabel!
    @IBOutlet var Button_detail_outlet: UIButton!
    @IBOutlet var Button_kakao_outlet: UIButton!
    
    let brown = UIColor(named: "Dynamic_brown")
    let kakao = UIColor(named: "Dynamic_kakao")
    let button = UIColor(named: "Dynamic_button")
    
    var H = ""
    var PAY = ""
    var temp = 0.0
    var RESULT = 0
    var MINUS = 0
    var M = "?"
    var detail_1 = 0.0
    var detail_2 = 0.0
    var detail_3 = 0.0
    var detail_4 = 0.0
    var Print_kakao = ""
    
    override func viewDidLoad() {
        
        Button_Result_outlet.layer.cornerRadius = 4
        Button_url_outlet.layer.cornerRadius = 4
        Button_detail_outlet.layer.cornerRadius = 4
        Button_kakao_outlet.layer.cornerRadius = 4
        Text_h.keyboardType = .decimalPad
        Text_pay.keyboardType = .numberPad
        Text_m.keyboardType = .numberPad
        
        self.hideKeyboard()
        super.viewDidLoad()
    }
    
    @IBAction func Button_Result(_ sender: UIButton) {
        H = Text_h.text!
        PAY = Text_pay.text!
        M = Text_m.text!
        if(check())
        {
            Print_kakao = M + "월 월급계산서"
            Print_kakao += "\n\n일한시간 : " + H + " 시간"
            Print_kakao += "\n시급 : " + inputComma(innum: Int(PAY)!) + " 원"
            RESULT = Int(Double(H)! * Double(PAY)!)
            Print_kakao += "\n\n월급결과 : " + inputComma(innum: RESULT) + " 원"
            Result_1.text = inputComma(innum: RESULT) + " 원"
            //상세한 네가지값을 각각 구한 후 더한다
            calculate()
            MINUS = Int(temp)
            Print_kakao += "\n4대보험금 결과 : - " + inputComma(innum: MINUS) + " 원"
            Result_2.text = "- " + inputComma(innum: MINUS) + " 원"
            Print_kakao += "\n월급 최종결과 : " + inputComma(innum: (RESULT-MINUS)) + " 원"
            Result_3.text = inputComma(innum: (RESULT-MINUS)) + " 원"
            
            Print_kakao += "\n\n※주휴수당 미포함※"
        }
    }
    
    @IBAction func Button_detail(_ sender: UIButton) {
        if(temp != 0.0)
        {
            Result_4.text =
                "국민연금 : " + inputComma(innum: Int(detail_1)) + " 원\n"
            + "건강보험 : " + inputComma(innum: Int(detail_2)) + " 원\n"
            + "장기요양 : " + inputComma(innum: Int(detail_3)) + " 원\n"
            + "고용보험 : " + inputComma(innum: Int(detail_4)) + " 원"
            Print_kakao += "\n\n상세내역\n"
            + "국민연금 : " + inputComma(innum: Int(detail_1)) + " 원\n"
            + "건강보험 : " + inputComma(innum: Int(detail_2)) + " 원\n"
            + "장기요양 : " + inputComma(innum: Int(detail_3)) + " 원\n"
            + "고용보험 : " + inputComma(innum: Int(detail_4)) + " 원"
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
    
    
    
    
    func check() -> Bool
    {
        if H == ""
        {
            return false
        }
        else if PAY == ""
        {
            return false
        }
        return true
    }
    
    @IBAction func Button_url(_ sender: UIButton) {
        if let url = URL(string: "http://insure.fpvhxm.com")
        {
            UIApplication.shared.open(url, options: [:])
        }
        
    }
    
    @IBAction func Button_reset(_ sender: UIButton) {
        H = ""
        PAY = ""
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
        Text_h.text = ""
        Text_pay.text = ""
        Result_1.text = "원"
        Result_2.text = "원"
        Result_3.text = "원"
        Result_4.text = "원\n원\n원\n원"
    }
    
    func calculate()
    {
        detail_1 = Double(RESULT) * 0.045
        detail_2 = Double(RESULT) * 0.03335
        detail_3 = detail_2 * 0.05125 * 2
        detail_4 = Double(RESULT) * 0.008
        temp = detail_1 + detail_2 + detail_3 + detail_4
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
