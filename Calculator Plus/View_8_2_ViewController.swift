//
//  View_8_2_ViewController.swift
//  Calculator Plus
//
//  Created by Min_MacBook Pro on 2020/03/26.
//  Copyright © 2020 FreeDeveloper. All rights reserved.
//

import UIKit

class View_8_2_ViewController: UIViewController {

    @IBOutlet var Text_now: UITextField!
    @IBOutlet var Text_plus: UITextField!
    @IBOutlet var Text_card: UITextField!
    @IBOutlet var Text_save: UITextField!
    @IBOutlet var Button_Result_outlet: UIButton!
    @IBOutlet var Button_plus_outlet: UIButton!
    @IBOutlet var Text_M: UITextField!
    
    @IBOutlet var Label_sum_show: UILabel!
    @IBOutlet var Show_card: UILabel!
    @IBOutlet var View_sum_line: UIView!
    
    @IBOutlet var Label_result1_show: UILabel!
    @IBOutlet var Label_result2_show: UILabel!
    @IBOutlet var Label_result3_show: UILabel!
    
    @IBOutlet var Result_1: UILabel!
    @IBOutlet var Result_2: UILabel!
    @IBOutlet var Result_3: UILabel!
    
    @IBOutlet var View_result1_line: UIView!
    @IBOutlet var View_result2_line: UIView!
    @IBOutlet var View_result3_line: UIView!
    
    @IBOutlet var View_line: UIView!
    @IBOutlet var Button_kakao_outlet: UIButton!
    @IBOutlet var Button_RESET: UIButton!
    
    @IBOutlet var View_View: UIView!
    
    @IBOutlet weak var View_dottedline: UIView!
    
    
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
    
    let GRAY = UIColor(named: "ColorGray")
    let BUTTON = UIColor(named: "button")
    
    override func viewDidLoad() {
        
        self.View_View.alpha = 0
        UIView.animate(withDuration: 0.5, animations: {
            self.View_View.alpha = 1
        })
        
        Button_plus_outlet.layer.cornerRadius = 4
        Button_Result_outlet.layer.cornerRadius = 4
        Button_kakao_outlet.layer.cornerRadius = 4
        
        Text_M.keyboardType = .numberPad
        Text_now.keyboardType = .numberPad
        Text_plus.keyboardType = .numberPad
        Text_card.keyboardType = .numberPad
        Text_save.keyboardType = .numberPad
        
        self.hideKeyboard()
        super.viewDidLoad()
        
        //animation
        self.Label_result1_show.alpha = 0
        self.Label_result2_show.alpha = 0
        self.Label_result3_show.alpha = 0
        self.Result_1.alpha = 0
        self.Result_2.alpha = 0
        self.Result_3.alpha = 0
        self.View_result1_line.alpha = 0
        self.View_result2_line.alpha = 0
        self.View_result3_line.alpha = 0
        self.Button_kakao_outlet.alpha = 0
        
        self.Label_result1_show.transform = CGAffineTransform(translationX: 0, y: -10)
        self.Label_result2_show.transform = CGAffineTransform(translationX: 0, y: -10)
        self.Label_result3_show.transform = CGAffineTransform(translationX: 0, y: -10)
        self.Result_1.transform = CGAffineTransform(translationX: 0, y: -10)
        self.Result_2.transform = CGAffineTransform(translationX: 0, y: -10)
        self.Result_3.transform = CGAffineTransform(translationX: 0, y: -10)
        self.View_result1_line.transform = CGAffineTransform(translationX: 0, y: -10)
        self.View_result2_line.transform = CGAffineTransform(translationX: 0, y: -10)
        self.View_result3_line.transform = CGAffineTransform(translationX: 0, y: -10)
        self.Button_kakao_outlet.transform = CGAffineTransform(translationX: 0, y: -10)
        
        self.View_line.transform = CGAffineTransform(translationX: 0, y: -154)
        self.Button_RESET.transform = CGAffineTransform(translationX: 0, y: -180)
        
        //color
        self.Button_plus_outlet.backgroundColor = self.GRAY
        self.Label_sum_show.textColor = self.GRAY
        self.Show_card.textColor = self.GRAY
        self.View_sum_line.backgroundColor = self.GRAY
        self.Button_Result_outlet.backgroundColor = self.GRAY
        
        //action
        Text_M.addTarget(self, action: #selector(textFieldDidChange1(textField:)), for: UIControl.Event.editingChanged)
        Text_now.addTarget(self, action: #selector(textFieldDidChange1(textField:)), for: UIControl.Event.editingChanged)
        Text_plus.addTarget(self, action: #selector(textFieldDidChange1(textField:)), for: UIControl.Event.editingChanged)
        Text_save.addTarget(self, action: #selector(textFieldDidChange1(textField:)), for: UIControl.Event.editingChanged)
        Text_card.addTarget(self, action: #selector(textFieldDidChange2(textField:)), for: UIControl.Event.editingChanged)
        
        View_dottedline.backgroundColor = UIColor.clear
        View_dottedline.addDashedBorder()
        
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
    
    @objc func textFieldDidChange1(textField: UITextField){
        M = Text_M.text!
        NOW = Text_now.text!
        Plus = Text_plus.text!
        SAVE = Text_save.text!
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
    
    @objc func textFieldDidChange2(textField: UITextField){
        M = Text_M.text!
        NOW = Text_now.text!
        Plus = Text_plus.text!
        SAVE = Text_save.text!
        CARD = Text_card.text!
        if(CARD != "")
        {
            UIView.animate(withDuration: 0.5, animations: {
                self.Button_plus_outlet.backgroundColor = self.BUTTON
            })
        }
        else
        {
            UIView.animate(withDuration: 0.5, animations: {
                self.Button_plus_outlet.backgroundColor = self.GRAY
            })
        }
    }
    
    @IBAction func Button_plus(_ sender: UIButton) {
        CARD = Text_card.text!
        if(CARD != "")
        {
            MINUS += Int(CARD)!
            Show_card.text = inputComma(innum: MINUS) + " 원"
            Text_card.text = ""
            if(detail == "")
            {
                detail = "- " + inputComma(innum: Int(CARD)!) + " 원"
            }
            else if(detail != "")
            {
                detail += "\n- " + inputComma(innum: Int(CARD)!) + " 원"
            }
            
            UIView.animate(withDuration: 0.5, animations: {
                self.Button_plus_outlet.backgroundColor = self.GRAY
                self.Label_sum_show.textColor = self.BUTTON
                self.Show_card.textColor = self.BUTTON
                self.View_sum_line.backgroundColor = self.BUTTON
            })
            
            if(check())
            {
                UIView.animate(withDuration: 0.5, animations: {
                    self.Button_Result_outlet.backgroundColor = self.BUTTON
                })
            }
            self.view.endEditing(true)
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
            KAKAO_PRINT += "\n\nA 현재 : " + inputComma(innum: Int(NOW)!) + " 원"
            KAKAO_PRINT += "\nB 수입 : " + inputComma(innum: Int(Plus)!) + " 원"
            
            PLUS = Int(NOW)! + Int(Plus)!
            MINUS += Int(SAVE)!
            
            KAKAO_PRINT += "\nC 지출 : -" + inputComma(innum: MINUS) + " 원"
            
            Result_1.text = inputComma(innum: PLUS) + " 원"
            Result_2.text = "- " + inputComma(innum: MINUS) + " 원"
            Result_3.text = inputComma(innum: (PLUS-MINUS)) + " 원"
            
            KAKAO_PRINT += "\n\n결과"
            KAKAO_PRINT += "\n A + B : " + inputComma(innum: PLUS) + " 원"
            KAKAO_PRINT += "\n A + B - C : " + inputComma(innum: (PLUS-MINUS)) + " 원"
            KAKAO_PRINT += "\n\n지출 상세내역\n" + detail
            KAKAO_PRINT += "\n- " + inputComma(innum: Int(SAVE)!) + " 원(적금)"
            
            UIView.animate(withDuration: 0.5, animations: {
                self.View_line.transform = CGAffineTransform(translationX: 0, y: 0)
                self.Button_RESET.transform = CGAffineTransform(translationX: 0, y: 0)
                self.Button_plus_outlet.backgroundColor = self.GRAY
                self.Button_Result_outlet.backgroundColor = self.GRAY
            })
            
            UIView.animate(withDuration: 0.7, animations: {
                self.Label_result1_show.alpha = 1
                self.Label_result2_show.alpha = 1
                self.Label_result3_show.alpha = 1
                self.Result_1.alpha = 1
                self.Result_2.alpha = 1
                self.Result_3.alpha = 1
                self.View_result1_line.alpha = 1
                self.View_result2_line.alpha = 1
                self.View_result3_line.alpha = 1
                self.Button_kakao_outlet.alpha = 1
                
                self.Label_result1_show.transform = CGAffineTransform(translationX: 0, y: 0)
                self.Label_result2_show.transform = CGAffineTransform(translationX: 0, y: 0)
                self.Label_result3_show.transform = CGAffineTransform(translationX: 0, y: 0)
                self.Result_1.transform = CGAffineTransform(translationX: 0, y: 0)
                self.Result_2.transform = CGAffineTransform(translationX: 0, y: 0)
                self.Result_3.transform = CGAffineTransform(translationX: 0, y: 0)
                self.View_result1_line.transform = CGAffineTransform(translationX: 0, y: 0)
                self.View_result2_line.transform = CGAffineTransform(translationX: 0, y: 0)
                self.View_result3_line.transform = CGAffineTransform(translationX: 0, y: 0)
                self.Button_kakao_outlet.transform = CGAffineTransform(translationX: 0, y: 0)
            })
            self.view.endEditing(true)
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
        Show_card.text = "원"
//        Result_1.text = "원"
//        Result_2.text = "원"
//        Result_3.text = "원"
        Text_M.text = ""
        
        UIView.animate(withDuration: 0.5, animations: {
            self.Label_result1_show.alpha = 0
            self.Label_result2_show.alpha = 0
            self.Label_result3_show.alpha = 0
            self.Result_1.alpha = 0
            self.Result_2.alpha = 0
            self.Result_3.alpha = 0
            self.View_result1_line.alpha = 0
            self.View_result2_line.alpha = 0
            self.View_result3_line.alpha = 0
            self.Button_kakao_outlet.alpha = 0
            
            self.Label_result1_show.transform = CGAffineTransform(translationX: 0, y: -10)
            self.Label_result2_show.transform = CGAffineTransform(translationX: 0, y: -10)
            self.Label_result3_show.transform = CGAffineTransform(translationX: 0, y: -10)
            self.Result_1.transform = CGAffineTransform(translationX: 0, y: -10)
            self.Result_2.transform = CGAffineTransform(translationX: 0, y: -10)
            self.Result_3.transform = CGAffineTransform(translationX: 0, y: -10)
            self.View_result1_line.transform = CGAffineTransform(translationX: 0, y: -10)
            self.View_result2_line.transform = CGAffineTransform(translationX: 0, y: -10)
            self.View_result3_line.transform = CGAffineTransform(translationX: 0, y: -10)
            self.Button_kakao_outlet.transform = CGAffineTransform(translationX: 0, y: -10)
            
            self.View_line.transform = CGAffineTransform(translationX: 0, y: -154)
            self.Button_RESET.transform = CGAffineTransform(translationX: 0, y: -180)
            
            //color
            self.Button_plus_outlet.backgroundColor = self.GRAY
            self.Label_sum_show.textColor = self.GRAY
            self.Show_card.textColor = self.GRAY
            self.View_sum_line.backgroundColor = self.GRAY
            self.Button_Result_outlet.backgroundColor = self.GRAY
        })
        self.view.endEditing(true)
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
    
    //ver1.1 콤마 추가
    func inputComma(innum: Int) -> String
    {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        
        let RESULT_COMMA: String = numberFormatter.string(from:NSNumber(value: innum))!
        return RESULT_COMMA
    }
    

}
