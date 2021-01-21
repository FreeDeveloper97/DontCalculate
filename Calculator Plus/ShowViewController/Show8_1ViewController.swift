//
//  View_7_ViewController.swift
//  Calculator Plus
//
//  Created by Min_MacBook Pro on 2020/03/26.
//  Copyright © 2020 FreeDeveloper. All rights reserved.
//

import UIKit

class Show8_1ViewController: UIViewController{

    @IBOutlet var Text_m: UITextField!
    @IBOutlet var Text_h: UITextField!
    @IBOutlet var Text_pay: UITextField!
    @IBOutlet var Button_Result_outlet: UIButton!
    @IBOutlet var Button_url_outlet: UIButton!

    @IBOutlet var Button_detail_outlet: UIButton!
    @IBOutlet var Button_kakao_outlet: UIButton!
    
    @IBOutlet var Label_result1_show: UILabel!
    @IBOutlet var Label_result2_show: UILabel!
    @IBOutlet var Label_result3_show: UILabel!
    @IBOutlet var Label_result4_show: UILabel!
    
    @IBOutlet var Result_1: UILabel!
    @IBOutlet var Result_2: UILabel!
    @IBOutlet var Result_3: UILabel!
    @IBOutlet var Result_4: UILabel!
    
    @IBOutlet var View_result1_line: UIView!
    @IBOutlet var View_result2_line: UIView!
    @IBOutlet var View_result3_line: UIView!
    @IBOutlet var View_result4_line: UIView!
    
    @IBOutlet var View_line: UIView!
    
    @IBOutlet var View_Buttons: UIView!
    @IBOutlet var Button_url: UIButton!
    @IBOutlet var Button_RESET: UIButton!
    
    @IBOutlet var View_View: UIView!
    
    
    let GRAY = UIColor(named: "ColorGray")
    let BUTTON = UIColor(named: "button")
    
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
    //detail 버튼 클릭 저장
    var detailShow: Bool = true
    var detailCount: Int = 0
    
    override func viewDidLoad() {
        
        self.View_View.alpha = 0
        UIView.animate(withDuration: 0.5, animations: {
            self.View_View.alpha = 1
        })
        
        Button_Result_outlet.layer.cornerRadius = 4
        Button_url_outlet.layer.cornerRadius = 4
        Button_detail_outlet.layer.cornerRadius = 4
        Button_kakao_outlet.layer.cornerRadius = 4
        Text_h.keyboardType = .decimalPad
        Text_pay.keyboardType = .numberPad
        Text_m.keyboardType = .numberPad
        
        self.hideKeyboard()
        super.viewDidLoad()
        
        //animation
        self.Label_result1_show.alpha = 0
        self.Label_result2_show.alpha = 0
        self.Label_result3_show.alpha = 0
        self.Label_result4_show.alpha = 0
        self.Result_1.alpha = 0
        self.Result_2.alpha = 0
        self.Result_3.alpha = 0
        self.Result_4.alpha = 0
        self.View_result1_line.alpha = 0
        self.View_result2_line.alpha = 0
        self.View_result3_line.alpha = 0
        self.View_result4_line.alpha = 0
        self.View_Buttons.alpha = 0
        self.Button_url.alpha = 0
        
        self.Label_result1_show.transform = CGAffineTransform(translationX: 0, y: -10)
        self.Label_result2_show.transform = CGAffineTransform(translationX: 0, y: -10)
        self.Label_result3_show.transform = CGAffineTransform(translationX: 0, y: -10)
        self.Label_result4_show.transform = CGAffineTransform(translationX: 0, y: -10)
        self.Result_1.transform = CGAffineTransform(translationX: 0, y: -10)
        self.Result_2.transform = CGAffineTransform(translationX: 0, y: -10)
        self.Result_3.transform = CGAffineTransform(translationX: 0, y: -10)
        self.Result_4.transform = CGAffineTransform(translationX: 0, y: -10)
        self.View_result1_line.transform = CGAffineTransform(translationX: 0, y: -10)
        self.View_result2_line.transform = CGAffineTransform(translationX: 0, y: -10)
        self.View_result3_line.transform = CGAffineTransform(translationX: 0, y: -10)
        self.View_result4_line.transform = CGAffineTransform(translationX: 0, y: -10)
        self.View_Buttons.transform = CGAffineTransform(translationX: 0, y: -110)
        self.Button_url.transform = CGAffineTransform(translationX: 0, y: -110)
        
        self.View_line.transform = CGAffineTransform(translationX: 0, y: -255)
        self.Button_RESET.transform = CGAffineTransform(translationX: 0, y: -330)
        //color
        self.Button_Result_outlet.backgroundColor = self.GRAY
        //action
        Text_m.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: UIControl.Event.editingChanged)
        Text_h.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: UIControl.Event.editingChanged)
        Text_pay.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: UIControl.Event.editingChanged)
        
        //우측상단버튼 생성
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "icon_bar"), for: .normal)
        button.addTarget(self, action: #selector(fbButtonPressed), for: .touchUpInside)
        button.frame = CGRect(x: 0, y: 0, width: 43, height: 51)
        let barButton = UIBarButtonItem(customView: button)
        self.navigationItem.rightBarButtonItem = barButton
    }
    //This method will call when you press button.
    @objc func fbButtonPressed() {
        performSegue(withIdentifier: "showNomal", sender: self)
    }
    
    @objc func textFieldDidChange(textField: UITextField){
        H = Text_h.text!
        PAY = Text_pay.text!
        M = Text_m.text!
        detailCount = 0
        if(check())
        {
            UIView.animate(withDuration: 0.5, animations: {
                self.Button_Result_outlet.backgroundColor = self.BUTTON
            })
        }
        else
        {
            UIView.animate(withDuration: 0.5, animations: {
                self.Button_Result_outlet.backgroundColor = self.GRAY
            })
        }
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
            
            UIView.animate(withDuration: 0.5, animations: {
                self.View_line.transform = CGAffineTransform(translationX: 0, y: -100)
                self.Button_RESET.transform = CGAffineTransform(translationX: 0, y: -100)
                self.Button_Result_outlet.backgroundColor = self.GRAY
            })
            
            UIView.animate(withDuration: 0.7, animations: {
                self.Label_result1_show.alpha = 1
                self.Label_result2_show.alpha = 1
                self.Label_result3_show.alpha = 1
                self.Label_result4_show.alpha = 0
                self.Result_1.alpha = 1
                self.Result_2.alpha = 1
                self.Result_3.alpha = 1
                self.Result_4.alpha = 0
                self.View_result1_line.alpha = 1
                self.View_result2_line.alpha = 1
                self.View_result3_line.alpha = 1
                self.View_result4_line.alpha = 0
                self.View_Buttons.alpha = 1
                self.Button_url.alpha = 1
                
                self.Label_result1_show.transform = CGAffineTransform(translationX: 0, y: 0)
                self.Label_result2_show.transform = CGAffineTransform(translationX: 0, y: 0)
                self.Label_result3_show.transform = CGAffineTransform(translationX: 0, y: 0)
                self.Label_result4_show.transform = CGAffineTransform(translationX: 0, y: -10)
                self.Result_1.transform = CGAffineTransform(translationX: 0, y: 0)
                self.Result_2.transform = CGAffineTransform(translationX: 0, y: 0)
                self.Result_3.transform = CGAffineTransform(translationX: 0, y: 0)
                self.Result_4.transform = CGAffineTransform(translationX: 0, y: -10)
                self.View_result1_line.transform = CGAffineTransform(translationX: 0, y: 0)
                self.View_result2_line.transform = CGAffineTransform(translationX: 0, y: 0)
                self.View_result3_line.transform = CGAffineTransform(translationX: 0, y: 0)
                self.View_result4_line.transform = CGAffineTransform(translationX: 0, y: -10)
                self.View_Buttons.transform = CGAffineTransform(translationX: 0, y: -100)
                self.Button_url.transform = CGAffineTransform(translationX: 0, y: -100)
                
                self.detailShow = true
            })
            self.view.endEditing(true)
        }
    }
    
    @IBAction func Button_detail(_ sender: UIButton) {
        if(check())
        {
            if(detailCount == 0)
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
                
                detailCount = 1
            }
            
            if(detailShow == true)
            {
                UIView.animate(withDuration: 0.5, animations: {
                    self.View_line.transform = CGAffineTransform(translationX: 0, y: 0)
                    self.View_Buttons.transform = CGAffineTransform(translationX: 0, y: 0)
                    self.Button_RESET.transform = CGAffineTransform(translationX: 0, y: 0)
                    self.Button_url.transform = CGAffineTransform(translationX: 0, y: 0)
                })
                
                UIView.animate(withDuration: 0.7, animations: {
                    self.Label_result4_show.alpha = 1
                    self.Result_4.alpha = 1
                    self.View_result4_line.alpha = 1
                    self.Label_result4_show.transform = CGAffineTransform(translationX: 0, y: 0)
                    self.Result_4.transform = CGAffineTransform(translationX: 0, y: 0)
                    self.View_result4_line.transform = CGAffineTransform(translationX: 0, y: 0)
                })
                detailShow = false
            }
            else
            {
                UIView.animate(withDuration: 0.5, animations: {
                    self.View_line.transform = CGAffineTransform(translationX: 0, y: -100)
                    self.View_Buttons.transform = CGAffineTransform(translationX: 0, y: -100)
                    self.Button_RESET.transform = CGAffineTransform(translationX: 0, y: -100)
                    self.Button_url.transform = CGAffineTransform(translationX: 0, y: -100)
                    
                    self.Label_result4_show.alpha = 0
                    self.Result_4.alpha = 0
                    self.View_result4_line.alpha = 0
                    self.Label_result4_show.transform = CGAffineTransform(translationX: 0, y: -10)
                    self.Result_4.transform = CGAffineTransform(translationX: 0, y: -10)
                    self.View_result4_line.transform = CGAffineTransform(translationX: 0, y: -10)
                })
                detailShow = true
            }
        }
        
        
    }
    
    @IBAction func Button_kakao(_ sender: UIButton) {
        if(check())
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
//        Result_1.text = "원"
//        Result_2.text = "원"
//        Result_3.text = "원"
//        Result_4.text = "원\n원\n원\n원"
        detailShow = true
        detailCount = 0
        
        UIView.animate(withDuration: 0.5, animations: {
            self.Label_result1_show.alpha = 0
            self.Label_result2_show.alpha = 0
            self.Label_result3_show.alpha = 0
            self.Label_result4_show.alpha = 0
            self.Result_1.alpha = 0
            self.Result_2.alpha = 0
            self.Result_3.alpha = 0
            self.Result_4.alpha = 0
            self.View_result1_line.alpha = 0
            self.View_result2_line.alpha = 0
            self.View_result3_line.alpha = 0
            self.View_result4_line.alpha = 0
            self.View_Buttons.alpha = 0
            self.Button_url.alpha = 0
            
            self.Label_result1_show.transform = CGAffineTransform(translationX: 0, y: -10)
            self.Label_result2_show.transform = CGAffineTransform(translationX: 0, y: -10)
            self.Label_result3_show.transform = CGAffineTransform(translationX: 0, y: -10)
            self.Label_result4_show.transform = CGAffineTransform(translationX: 0, y: -10)
            self.Result_1.transform = CGAffineTransform(translationX: 0, y: -10)
            self.Result_2.transform = CGAffineTransform(translationX: 0, y: -10)
            self.Result_3.transform = CGAffineTransform(translationX: 0, y: -10)
            self.Result_4.transform = CGAffineTransform(translationX: 0, y: -10)
            self.View_result1_line.transform = CGAffineTransform(translationX: 0, y: -10)
            self.View_result2_line.transform = CGAffineTransform(translationX: 0, y: -10)
            self.View_result3_line.transform = CGAffineTransform(translationX: 0, y: -10)
            self.View_result4_line.transform = CGAffineTransform(translationX: 0, y: -10)
            self.View_Buttons.transform = CGAffineTransform(translationX: 0, y: -110)
            self.Button_url.transform = CGAffineTransform(translationX: 0, y: -110)
            
            self.View_line.transform = CGAffineTransform(translationX: 0, y: -255)
            self.Button_RESET.transform = CGAffineTransform(translationX: 0, y: -330)
            //color
            self.Button_Result_outlet.backgroundColor = self.GRAY
        })
        self.view.endEditing(true)
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
