//
//  View_1_2_ViewController.swift
//  Calculator Plus
//
//  Created by Min_MacBook Pro on 2020/03/21.
//  Copyright © 2020 FreeDeveloper. All rights reserved.
//

import UIKit

class View_1_2_ViewController: UIViewController {
    
    @IBOutlet var Text_1_money: UITextField!
    @IBOutlet var Text_1_num: UITextField!
    @IBOutlet var Text_2_money: UITextField!
    @IBOutlet var Text_2_num: UITextField!
    @IBOutlet var Button_Result_outlet: UIButton!
    @IBOutlet var Kakao_outlet: UIButton!
    
    @IBOutlet var Button_plus_1_outlet: UIButton!
    @IBOutlet var Button_plus_2_outlet: UIButton!
    @IBOutlet var Button_detail_outlet: UIButton!
    
    //animation
    
    @IBOutlet weak var Label_sum1_show: UILabel!
    @IBOutlet var Text_1_sum: UILabel!
    @IBOutlet weak var View_sum1_line: UIView!
    
    
    @IBOutlet weak var Label_sum2_show: UILabel!
    @IBOutlet var Text_2_sum: UILabel!
    @IBOutlet weak var View_sum2_line: UIView!
    
    @IBOutlet weak var Label_Result1_show: UILabel!
    @IBOutlet var Result_1: UILabel!
    @IBOutlet weak var View_Result1_Line: UIView!
    
    @IBOutlet weak var Label_Result2_show: UILabel!
    @IBOutlet var Result_2: UILabel!
    @IBOutlet weak var View_Result2_Line: UIView!
    
    @IBOutlet weak var Label_Result3_show: UILabel!
    @IBOutlet var Result_3: UILabel!
    @IBOutlet weak var View_Result3_Line: UIView!
    
    @IBOutlet var Text_show: UILabel!
    @IBOutlet var Text_detail: UILabel!
    @IBOutlet weak var View_result4_line: UIView!
    
    @IBOutlet weak var View_line: UIView!
    @IBOutlet weak var View_Buttons: UIView!
    @IBOutlet weak var Button_RESET: UIButton!
    
    @IBOutlet var View_View: UIView!
    
    @IBOutlet var View_dottedline: UIView!
    
    
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
    
    //detail 버튼 클릭 저장
    var detailShow: Bool = true
    var detailCount: Int = 0
    
    let GRAY = UIColor(named: "ColorGray")
    let BUTTON = UIColor(named: "button")
    
    
    
    override func viewDidLoad() {
        
        self.View_View.alpha = 0
        UIView.animate(withDuration: 0.5, animations: {
            self.View_View.alpha = 1
        })
        
        Button_plus_1_outlet.layer.cornerRadius = 4
        Button_plus_2_outlet.layer.cornerRadius = 4
        Button_Result_outlet.layer.cornerRadius = 4
        Button_detail_outlet.layer.cornerRadius = 4
        Kakao_outlet.layer.cornerRadius = 4
        Text_1_money.keyboardType = .numberPad
        Text_1_num.keyboardType = .numberPad
        Text_2_money.keyboardType = .numberPad
        Text_2_num.keyboardType = .numberPad
        
        self.hideKeyboard()
        super.viewDidLoad()
        
        //animation
        self.View_line.transform = CGAffineTransform(translationX: 0, y: -200)
        
        self.Label_Result1_show.alpha = 0
        self.Label_Result1_show.transform = CGAffineTransform(translationX: 0, y: -10)
        self.Result_1.alpha = 0
        self.Result_1.transform = CGAffineTransform(translationX: 0, y: -10)
        self.View_Result1_Line.alpha = 0
        self.View_Result1_Line.transform = CGAffineTransform(translationX: 0, y: -10)
        
        self.Label_Result2_show.alpha = 0
        self.Label_Result2_show.transform = CGAffineTransform(translationX: 0, y: -10)
        self.Result_2.alpha = 0
        self.Result_2.transform = CGAffineTransform(translationX: 0, y: -10)
        self.View_Result2_Line.alpha = 0
        self.View_Result2_Line.transform = CGAffineTransform(translationX: 0, y: -10)
        
        self.Label_Result3_show.alpha = 0
        self.Label_Result3_show.transform = CGAffineTransform(translationX: 0, y: -10)
        self.Result_3.alpha = 0
        self.Result_3.transform = CGAffineTransform(translationX: 0, y: -10)
        self.View_Result3_Line.alpha = 0
        self.View_Result3_Line.transform = CGAffineTransform(translationX: 0, y: -10)
        
        self.Text_show.alpha = 0
        self.Text_show.transform = CGAffineTransform(translationX: 0, y: -10)
        self.Text_detail.alpha = 0
        self.Text_detail.transform = CGAffineTransform(translationX: 0, y: -10)
        self.View_result4_line.alpha = 0
        self.View_result4_line.transform = CGAffineTransform(translationX: 0, y: -10)
        
        self.View_Buttons.alpha = 0
        self.View_Buttons.transform = CGAffineTransform(translationX: 0, y: -60)
        
        self.Button_RESET.transform = CGAffineTransform(translationX: 0, y: -230)
        
        //색상
        self.Button_plus_1_outlet.backgroundColor = self.GRAY
        self.Button_plus_2_outlet.backgroundColor = self.GRAY
        self.Button_Result_outlet.backgroundColor = self.GRAY
        
        self.Label_sum1_show.textColor = self.GRAY
        self.Text_1_sum.textColor = self.GRAY
        self.View_sum1_line.backgroundColor = self.GRAY
        
        self.Label_sum2_show.textColor = self.GRAY
        self.Text_2_sum.textColor = self.GRAY
        self.View_sum2_line.backgroundColor = self.GRAY
        
        //입력 반응
        Text_1_money.addTarget(self, action: #selector(textFieldDidChange1(textField:)), for: UIControl.Event.editingChanged)
        Text_2_money.addTarget(self, action: #selector(textFieldDidChange2(textField:)), for: UIControl.Event.editingChanged)
        Text_2_num.addTarget(self, action: #selector(textFieldDidChange3(textField:)), for: UIControl.Event.editingChanged)
        
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
        if(Text_1_money.text != "")
        {
            UIView.animate(withDuration: 0.5, animations: {
                self.Button_plus_1_outlet.backgroundColor = self.BUTTON
            })
        }
        else
        {
            UIView.animate(withDuration: 0.5, animations: {
                self.Button_plus_1_outlet.backgroundColor = self.GRAY
            })
        }
        
    }
    
    @objc func textFieldDidChange2(textField: UITextField){
        if(Text_2_money.text != "")
        {
            UIView.animate(withDuration: 0.5, animations: {
                self.Button_plus_2_outlet.backgroundColor = self.BUTTON
            })
        }
        else
        {
            UIView.animate(withDuration: 0.5, animations: {
                self.Button_plus_2_outlet.backgroundColor = self.GRAY
            })
        }
        
    }
    
    @objc func textFieldDidChange3(textField: UITextField){
        N_1 = Text_1_num.text!
        N_2 = Text_2_num.text!
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
    
    @IBAction func Button_plus_1(_ sender: UIButton) {
        kakao_print = ""
        detailCount = 0
        detailShow = true
        Money_1 = Text_1_money.text!
        if(Money_1 != "")
        {
            MONEY_1 += Int(Money_1)!
            Text_1_money.text = ""
            Text_1_sum.text = inputComma(innum: MONEY_1) + " 원"
            if(DETAIL_1 == "")
            {
                DETAIL_1 = inputComma(innum: Int(Money_1)!) + " 원"
            }
            else if (DETAIL_1 != "")
            {
                DETAIL_1 += "\n" + inputComma(innum: Int(Money_1)!) + " 원"
            }
            
            UIView.animate(withDuration: 0.5, animations: {
                self.Label_sum1_show.textColor = self.BUTTON
                self.Text_1_sum.textColor = self.BUTTON
                self.View_sum1_line.backgroundColor = self.BUTTON
                self.Button_plus_1_outlet.backgroundColor = self.GRAY
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
    
    @IBAction func Button_plus_2(_ sender: UIButton) {
        kakao_print = ""
        detailCount = 0
        detailShow = true
        Money_2 = Text_2_money.text!
        if(Money_2 != "")
        {
            MONEY_2 += Int(Money_2)!
            Text_2_money.text = ""
            Text_2_sum.text = inputComma(innum: MONEY_2) + " 원"
            if(DETAIL_2 == "")
            {
                DETAIL_2 = inputComma(innum: Int(Money_2)!) + " 원"
            }
            else if (DETAIL_2 != "")
            {
                DETAIL_2 += "\n" + inputComma(innum: Int(Money_2)!) + " 원"
            }
            
            UIView.animate(withDuration: 0.5, animations: {
                self.Label_sum2_show.textColor = self.BUTTON
                self.Text_2_sum.textColor = self.BUTTON
                self.View_sum2_line.backgroundColor = self.BUTTON
                self.Button_plus_2_outlet.backgroundColor = self.GRAY
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
    
    @IBAction func Button_detail(_ sender: UIButton) {
        if RESULT_1 != 0
        {
            Text_detail.text = DETAIL_1 + "\n--------\n" + DETAIL_2
        }
        if(detailShow == true)
        {
            //animation
            UIView.animate(withDuration: 0.5, animations: {
                self.View_line.transform = CGAffineTransform(translationX: 0, y: 0)
                
                self.View_Buttons.transform = CGAffineTransform(translationX: 0, y: 0)
                self.Button_RESET.transform = CGAffineTransform(translationX: 0, y: 0)
            })
            
            UIView.animate(withDuration: 0.7, animations: {
                self.Text_show.alpha = 1
                self.Text_show.transform = CGAffineTransform(translationX: 0, y: 0)
                self.Text_detail.alpha = 1
                self.Text_detail.transform = CGAffineTransform(translationX: 0, y: 0)
                self.View_result4_line.alpha = 1
                self.View_result4_line.transform = CGAffineTransform(translationX: 0, y: 0)
            })
            detailShow = false
        }
        else
        {
            //animation
            UIView.animate(withDuration: 0.5, animations: {
                self.View_line.transform = CGAffineTransform(translationX: 0, y: -50)
                
                self.View_Buttons.transform = CGAffineTransform(translationX: 0, y: -50)
                self.Button_RESET.transform = CGAffineTransform(translationX: 0, y: -50)
            })
            
            UIView.animate(withDuration: 0.5, animations: {
                self.Text_show.alpha = 0
                self.Text_show.transform = CGAffineTransform(translationX: 0, y: 0)
                self.Text_detail.alpha = 0
                self.Text_detail.transform = CGAffineTransform(translationX: 0, y: 0)
                self.View_result4_line.alpha = 0
                self.View_result4_line.transform = CGAffineTransform(translationX: 0, y: 0)
            })
            detailShow = true
        }
        
    }
    
    @IBAction func Button_Result(_ sender: UIButton) {
//        N_1 = Text_1_num.text!
//        N_2 = Text_2_num.text!
        if(check())
        {
            kakao_print = "더치페이1 총액 : " + inputComma(innum: MONEY_1) + " 원"
            kakao_print += "\n더치페이1 계산인원 : " + N_1 + " 명"
            RESULT_1 = MONEY_1 / Int(N_1)!
            kakao_print += "\n더치페이1 결과 : " + inputComma(innum: RESULT_1) + " 원"
            Result_1.text = inputComma(innum: RESULT_1) + " 원"
            
            kakao_print += "\n\n더치페이2 총액 : " + inputComma(innum: MONEY_2) + " 원"
            kakao_print += "\n더치페이2 계산인원 : " + N_2 + " 명"
            RESULT_2 = MONEY_2 / Int(N_2)!
            kakao_print += "\n더치페이2 결과 : " + inputComma(innum: RESULT_2) + " 원"
            Result_2.text = inputComma(innum: RESULT_2) + " 원"
            
            kakao_print += "\n\n더치페이1 : " + inputComma(innum: RESULT_1) + " 원"
            kakao_print += "\n더치페이2 : " + inputComma(innum: RESULT_2) + " 원"
            kakao_print += "\n둘다해당 : " + inputComma(innum: (RESULT_1+RESULT_2)) + " 원"
            Result_3.text = inputComma(innum: (RESULT_1+RESULT_2)) + " 원"
            
            //animation
            UIView.animate(withDuration: 0.5, animations: {
                self.View_line.transform = CGAffineTransform(translationX: 0, y: -50)
                self.Button_RESET.transform = CGAffineTransform(translationX: 0, y: -50)
                self.Button_Result_outlet.backgroundColor = self.GRAY
            })
            
            UIView.animate(withDuration: 0.7, animations: {
                self.Label_Result1_show.alpha = 1
                self.Label_Result1_show.transform = CGAffineTransform(translationX: 0, y: 0)
                self.Result_1.alpha = 1
                self.Result_1.transform = CGAffineTransform(translationX: 0, y: 0)
                self.View_Result1_Line.alpha = 1
                self.View_Result1_Line.transform = CGAffineTransform(translationX: 0, y: 0)
                
                self.Label_Result2_show.alpha = 1
                self.Label_Result2_show.transform = CGAffineTransform(translationX: 0, y: 0)
                self.Result_2.alpha = 1
                self.Result_2.transform = CGAffineTransform(translationX: 0, y: 0)
                self.View_Result2_Line.alpha = 1
                self.View_Result2_Line.transform = CGAffineTransform(translationX: 0, y: 0)
                
                self.Label_Result3_show.alpha = 1
                self.Label_Result3_show.transform = CGAffineTransform(translationX: 0, y: 0)
                self.Result_3.alpha = 1
                self.Result_3.transform = CGAffineTransform(translationX: 0, y: 0)
                self.View_Result3_Line.alpha = 1
                self.View_Result3_Line.transform = CGAffineTransform(translationX: 0, y: 0)
                
                self.View_Buttons.alpha = 1
                self.View_Buttons.transform = CGAffineTransform(translationX: 0, y: -50)
                
                self.Text_show.alpha = 0
                self.Text_show.transform = CGAffineTransform(translationX: 0, y: -10)
                self.Text_detail.alpha = 0
                self.Text_detail.transform = CGAffineTransform(translationX: 0, y: -10)
                self.View_result4_line.alpha = 0
                self.View_result4_line.transform = CGAffineTransform(translationX: 0, y: -10)
            })
            self.view.endEditing(true)
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
        Text_1_sum.text = "원"
        Text_2_money.text = ""
        Text_2_num.text = ""
        Text_2_sum.text = "원"
//        Result_1.text = ""
//        Result_2.text = ""
        Result_3.text = ""
        Text_detail.text = ""
        
        detailShow = true
        detailCount = 0
        
        UIView.animate(withDuration: 0.5, animations: {
            //animation
            self.View_line.transform = CGAffineTransform(translationX: 0, y: -200)
            
            self.Label_Result1_show.alpha = 0
            self.Label_Result1_show.transform = CGAffineTransform(translationX: 0, y: -10)
            self.Result_1.alpha = 0
            self.Result_1.transform = CGAffineTransform(translationX: 0, y: -10)
            self.View_Result1_Line.alpha = 0
            self.View_Result1_Line.transform = CGAffineTransform(translationX: 0, y: -10)
            
            self.Label_Result2_show.alpha = 0
            self.Label_Result2_show.transform = CGAffineTransform(translationX: 0, y: -10)
            self.Result_2.alpha = 0
            self.Result_2.transform = CGAffineTransform(translationX: 0, y: -10)
            self.View_Result2_Line.alpha = 0
            self.View_Result2_Line.transform = CGAffineTransform(translationX: 0, y: -10)
            
            self.Label_Result3_show.alpha = 0
            self.Label_Result3_show.transform = CGAffineTransform(translationX: 0, y: -10)
            self.Result_3.alpha = 0
            self.Result_3.transform = CGAffineTransform(translationX: 0, y: -10)
            self.View_Result3_Line.alpha = 0
            self.View_Result3_Line.transform = CGAffineTransform(translationX: 0, y: -10)
            
            self.Text_show.alpha = 0
            self.Text_show.transform = CGAffineTransform(translationX: 0, y: -10)
            self.Text_detail.alpha = 0
            self.Text_detail.transform = CGAffineTransform(translationX: 0, y: -10)
            self.View_result4_line.alpha = 0
            self.View_result4_line.transform = CGAffineTransform(translationX: 0, y: -10)
            
            self.View_Buttons.alpha = 0
            self.View_Buttons.transform = CGAffineTransform(translationX: 0, y: -60)
            self.Button_RESET.transform = CGAffineTransform(translationX: 0, y: -230)
            
            //색상
            self.Button_plus_1_outlet.backgroundColor = self.GRAY
            self.Button_plus_2_outlet.backgroundColor = self.GRAY
            self.Button_Result_outlet.backgroundColor = self.GRAY
            
            self.Label_sum1_show.textColor = self.GRAY
            self.Text_1_sum.textColor = self.GRAY
            self.View_sum1_line.backgroundColor = self.GRAY
            
            self.Label_sum2_show.textColor = self.GRAY
            self.Text_2_sum.textColor = self.GRAY
            self.View_sum2_line.backgroundColor = self.GRAY
        })
    }
    
    func check() -> Bool
    {
        if Text_1_sum.text == "원"
        {
            return false
        }
        else if N_1 == ""
        {
            return false
        }
        else if Text_2_sum.text == "원"
        {
            return false
        }
        else if N_2 == ""
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
