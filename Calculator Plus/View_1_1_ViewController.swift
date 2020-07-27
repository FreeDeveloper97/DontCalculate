//
//  View_1_1_ViewController.swift
//  Calculator Plus
//
//  Created by Min_MacBook Pro on 2020/03/19.
//  Copyright © 2020 FreeDeveloper. All rights reserved.
//

import UIKit

class View_1_1_ViewController: UIViewController {
    
    @IBOutlet var Input_money: UITextField!
    @IBOutlet var Button_plus_outlet: UIButton!
    @IBOutlet var Text_n: UITextField!
    @IBOutlet var Text_bank: UITextField!
    
    //animation
    @IBOutlet weak var Label_money_show: UILabel!
    @IBOutlet var Text_money: UILabel!
    @IBOutlet weak var View_money_line: UIView!
    
    @IBOutlet var Button_Result_outlet: UIButton!
    
    @IBOutlet weak var Label_result1_show: UILabel!
    @IBOutlet var Result_1: UILabel!
    @IBOutlet weak var View_result1_line: UIView!
    
    
    @IBOutlet weak var Label_result2_show: UILabel!
    @IBOutlet var Result_2: UILabel!
    @IBOutlet weak var View_result2_line: UIView!
    
    
    @IBOutlet var Label_result3_show: UILabel!
    @IBOutlet var Result_3: UILabel!
    @IBOutlet weak var View_result3_line: UIView!
    
    @IBOutlet weak var View_Line: UIView!
    
    @IBOutlet var Button_detail_outlet: UIButton!
    @IBOutlet var Button_kakao_outlet: UIButton!
    @IBOutlet weak var Button_RESET: UIButton!
    
    
    @IBOutlet weak var View_Buttons: UIView!
    
    
    
    var InputMoney = ""
    var MONEY = 0
    var N = ""
    var RESULT = 0
    var kakao_print = ""
    var DETAIL = ""
    
    let GRAY = UIColor(named: "ColorGray")
    let REVERSE = UIColor(named: "Dynamic_reverse")
    let BUTTON = UIColor(named: "button")
    
    override func viewDidLoad() {
        Button_plus_outlet.layer.cornerRadius = 4
        Button_Result_outlet.layer.cornerRadius = 4
        Button_kakao_outlet.layer.cornerRadius = 4
        Button_detail_outlet.layer.cornerRadius = 4
        
        Input_money.keyboardType = .numberPad
        Text_n.keyboardType = .numberPad
        
        self.hideKeyboard()
        super.viewDidLoad()
        
        //color
        Label_money_show.textColor = GRAY
        Text_money.textColor = GRAY
        View_money_line.backgroundColor = GRAY
        
        //animation
        self.Label_result1_show.alpha = 0
        self.Label_result1_show.transform = CGAffineTransform(translationX: 0, y: -10)
        self.Result_1.alpha = 0
        self.Result_1.transform = CGAffineTransform(translationX: 0, y: -10)
        self.View_result1_line.alpha = 0
        self.View_result1_line.transform = CGAffineTransform(translationX: 0, y: -10)
        
        self.Label_result2_show.alpha = 0
        self.Label_result2_show.transform = CGAffineTransform(translationX: 0, y: -10)
        self.Result_2.alpha = 0
        self.Result_2.transform = CGAffineTransform(translationX: 0, y: -10)
        self.View_result2_line.alpha = 0
        self.View_result2_line.transform = CGAffineTransform(translationX: 0, y: -10)
        
        self.Label_result3_show.alpha = 0
        self.Label_result3_show.transform = CGAffineTransform(translationX: 0, y: -10)
        self.Result_3.alpha = 0
        self.Result_3.transform = CGAffineTransform(translationX: 0, y: -10)
        self.View_result3_line.alpha = 0
        self.View_result3_line.transform = CGAffineTransform(translationX: 0, y: -10)
        
        self.View_Line.alpha = 0
        self.View_Line.transform = CGAffineTransform(translationX: 0, y: -155)
        
        self.Button_RESET.alpha = 0
        self.Button_RESET.transform = CGAffineTransform(translationX: 0, y: -60)
        
        self.View_Buttons.alpha = 0
        self.View_Buttons.transform = CGAffineTransform(translationX: 0, y: -60)
        
        self.Button_plus_outlet.backgroundColor = GRAY
        self.Button_Result_outlet.backgroundColor = GRAY
        //입력 반응
        Input_money.addTarget(self, action: #selector(textFieldDidChange1(textField:)), for: UIControl.Event.editingChanged)
        Text_n.addTarget(self, action: #selector(textFieldDidChange2(textField:)), for: UIControl.Event.editingChanged)
    }
    @objc func textFieldDidChange1(textField: UITextField){
        UIView.animate(withDuration: 0.5, animations: {
            self.Button_plus_outlet.backgroundColor = self.BUTTON
        })
    }
    
    @objc func textFieldDidChange2(textField: UITextField){
        UIView.animate(withDuration: 0.5, animations: {
            self.Button_Result_outlet.backgroundColor = self.BUTTON
        })
    }
    
    @IBAction func Button_plus(_ sender: UIButton) {
        InputMoney = Input_money.text!
        if(InputMoney != "")
        {
            MONEY += Int(InputMoney)!
            Input_money.text = ""
            Text_money.text = inputComma(innum: MONEY) + " 원"
            if(DETAIL == "")
            {
                DETAIL = inputComma(innum: Int(InputMoney)!) + " 원"
            }
            else if (DETAIL != "")
            {
                DETAIL += "\n" + inputComma(innum: Int(InputMoney)!) + " 원"
            }
        }
        UIView.animate(withDuration: 0.5, animations: {
            self.Label_money_show.textColor = self.BUTTON
            self.Text_money.textColor = self.BUTTON
            self.View_money_line.backgroundColor = self.BUTTON
        })
    }
    
    
    
    @IBAction func Button_Result(_ sender: UIButton) {
        //1. string 가져오기
        N = Text_n.text!
        if(check())
        {
            kakao_print = "총 사용금액 : " + inputComma(innum: MONEY) + " 원"
            kakao_print += "\n더치페이 인원수 : " + N + " 명"

            RESULT = MONEY / Int(N)!
            Result_1.text = inputComma(innum: RESULT) + " 원"
            Result_2.text = Text_bank.text!


            kakao_print += "\n\n더치페이 결과 : " + inputComma(innum: RESULT) + " 원"
            kakao_print += "\n계좌 : " + Text_bank.text!
        }
        UIView.animate(withDuration: 0.5, animations: {
            self.View_Line.alpha = 1
            self.View_Line.transform = CGAffineTransform(translationX: 0, y: -50)
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
            
            self.Button_RESET.alpha = 1
            self.Button_RESET.transform = CGAffineTransform(translationX: 0, y: -50)
            
            self.View_Buttons.alpha = 1
            self.View_Buttons.transform = CGAffineTransform(translationX: 0, y: -50)
        })

    }
    
    @IBAction func Button_detail(_ sender: UIButton) {
        if(RESULT != 0)
        {
            UIView.animate(withDuration: 0.5, animations: {
                self.View_Line.transform = CGAffineTransform(translationX: 0, y: 0)
                self.Button_RESET.transform = CGAffineTransform(translationX: 0, y: 0)
                
                self.View_Buttons.transform = CGAffineTransform(translationX: 0, y: 0)
            })
            
            UIView.animate(withDuration: 0.7, animations: {
                self.Label_result3_show.alpha = 1
                self.Label_result3_show.transform = CGAffineTransform(translationX: 0, y: 0)
                self.Result_3.alpha = 1
                self.Result_3.transform = CGAffineTransform(translationX: 0, y: 0)
                self.View_result3_line.alpha = 1
                self.View_result3_line.transform = CGAffineTransform(translationX: 0, y: 0)

                self.Result_3.text = self.DETAIL
                self.kakao_print += "\n\n상세내역\n" + self.DETAIL
            })
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
        InputMoney = ""
        MONEY = 0
        N = ""
        RESULT = 0
        kakao_print = ""
        DETAIL = ""
        Input_money.text = ""
        Text_money.text = "원"
        Text_n.text = ""
        Result_1.text = ""
        Result_3.text = ""
        Result_2.text = ""
        Text_bank.text = ""
        
        UIView.animate(withDuration: 0.5, animations: {
            self.Label_result1_show.alpha = 0
            self.Label_result1_show.transform = CGAffineTransform(translationX: 0, y: -10)
            self.Result_1.alpha = 0
            self.Result_1.transform = CGAffineTransform(translationX: 0, y: -10)
            self.View_result1_line.alpha = 0
            self.View_result1_line.transform = CGAffineTransform(translationX: 0, y: -10)
            
            self.Label_result2_show.alpha = 0
            self.Label_result2_show.transform = CGAffineTransform(translationX: 0, y: -10)
            self.Result_2.alpha = 0
            self.Result_2.transform = CGAffineTransform(translationX: 0, y: -10)
            self.View_result2_line.alpha = 0
            self.View_result2_line.transform = CGAffineTransform(translationX: 0, y: -10)
            
            self.Label_result3_show.alpha = 0
            self.Label_result3_show.transform = CGAffineTransform(translationX: 0, y: -10)
            self.Result_3.alpha = 0
            self.Result_3.transform = CGAffineTransform(translationX: 0, y: -10)
            self.View_result3_line.alpha = 0
            self.View_result3_line.transform = CGAffineTransform(translationX: 0, y: -10)
            
            self.View_Line.alpha = 0
            self.View_Line.transform = CGAffineTransform(translationX: 0, y: -155)
            
            self.Button_RESET.alpha = 0
            self.Button_RESET.transform = CGAffineTransform(translationX: 0, y: -60)
            
            self.View_Buttons.alpha = 0
            self.View_Buttons.transform = CGAffineTransform(translationX: 0, y: -60)
            
            self.Label_money_show.textColor = self.GRAY
            self.Text_money.textColor = self.GRAY
            self.View_money_line.backgroundColor = self.GRAY
            
            self.Button_plus_outlet.backgroundColor = self.GRAY
            self.Button_Result_outlet.backgroundColor = self.GRAY
        })
        
    }
    
    func check() -> Bool
    {
        if Text_money.text == "원"
        {
            return false
        }
        else if N == ""
        {
            return false
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
