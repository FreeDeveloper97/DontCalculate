//
//  View_nomal_ViewController.swift
//  Calculator Plus
//
//  Created by Min_MacBook Pro on 2020/03/26.
//  Copyright © 2020 FreeDeveloper. All rights reserved.
//

import UIKit

class View_nomal_ViewController: UIViewController {

    @IBOutlet var Button_AC: UIButton!
    @IBOutlet var Button_DEL: UIButton!
    @IBOutlet var Button_div: UIButton!
    @IBOutlet var Button_mul: UIButton!
    
    @IBOutlet var Button_7: UIButton!
    @IBOutlet var Button_8: UIButton!
    @IBOutlet var Button_9: UIButton!
    @IBOutlet var Button_min: UIButton!
    
    @IBOutlet var Button_4: UIButton!
    @IBOutlet var Button_5: UIButton!
    @IBOutlet var Button_6: UIButton!
    @IBOutlet var Button_plus: UIButton!
    
    @IBOutlet var Button_1: UIButton!
    @IBOutlet var Button_2: UIButton!
    @IBOutlet var Button_3: UIButton!
    @IBOutlet var Button_0: UIButton!
    @IBOutlet var Button_dot: UIButton!
    @IBOutlet var Button_Result: UIButton!
    
    @IBOutlet var Text_result_1: UILabel!
    @IBOutlet var Text_result_2: UILabel!
    
    @IBOutlet weak var View_line1: UIView!
    @IBOutlet weak var View_line2: UIView!
    
    @IBOutlet var View_View: UIView!
    
    var type = ""
    var count = 0
    var PLUS = 0
    var MINUS = 1
    var MUL = 2
    var DIV = 3
    var sum = 0.0
    var RESULT = 0.0
    
    var history = ""
    var number = ""
    
    var NUMBER = 0.0
    
    var sum_int = 0
    var sum_str = ""
    
    let GRAY = UIColor(named: "ColorGray_light")
    let REVERSE = UIColor(named: "Dynamic_reverse")
    let BUTTON = UIColor(named: "button")
    
    
    override func viewDidLoad() {
        
        self.View_View.alpha = 0
        UIView.animate(withDuration: 0.5, animations: {
            self.View_View.alpha = 1
        })
        
        Button_AC.layer.cornerRadius = 4
        Button_DEL.layer.cornerRadius = 4
        Button_div.layer.cornerRadius = 4
        Button_mul.layer.cornerRadius = 4
        
        Button_7.layer.cornerRadius = 4
        Button_8.layer.cornerRadius = 4
        Button_9.layer.cornerRadius = 4
        Button_min.layer.cornerRadius = 4
        
        Button_4.layer.cornerRadius = 4
        Button_5.layer.cornerRadius = 4
        Button_6.layer.cornerRadius = 4
        Button_plus.layer.cornerRadius = 4
        
        Button_1.layer.cornerRadius = 4
        Button_2.layer.cornerRadius = 4
        Button_3.layer.cornerRadius = 4
        Button_0.layer.cornerRadius = 4
        Button_dot.layer.cornerRadius = 4
        Button_Result.layer.cornerRadius = 4

        super.viewDidLoad()
        
        self.View_line1.alpha = 0
        self.View_line2.alpha = 0
    }
    
    @IBAction func button(sender: UIButton) {
        let digit = sender.currentTitle!
        var result = Text_result_2.text!
        result += String(digit)
        Text_result_2.text = result
        
        UIView.animate(withDuration: 0.3, animations: {
            self.View_line2.alpha = 1
            self.View_line2.backgroundColor = self.BUTTON
            self.View_line1.backgroundColor = self.GRAY
        })
    }
    @IBAction func ENTER(_ sender: UIButton) {
        if count > 0
        {
            number = Text_result_2.text!
            if(number != "")
            {
                NUMBER = Double(number)!
                history = history + Text_result_2.text!
                Text_result_1.text = history
                
                if type == "PLUS"
                {
                    RESULT = sum + NUMBER
                }
                else if type == "MINUS"
                {
                    RESULT = sum - NUMBER
                }
                else if type == "MUL"
                {
                    RESULT = sum * NUMBER
                }
                else if type == "DIV"
                {
                    RESULT = sum / NUMBER
                }
                //
                if(doubleToInt(sum: RESULT))
                {
                    Text_result_2.text = String(sum_int)
                }
                else
                {
                    Text_result_2.text = String(RESULT)
                }
                //
                sum = 0
                count = 0
                number = ""
                
                UIView.animate(withDuration: 0.3, animations: {
                    self.View_line2.alpha = 1
                    self.View_line2.backgroundColor = self.BUTTON
                    self.View_line1.alpha = 0
                })
            }
            
        }
        else
        {
//            Text_result_2.text = "FINISH"
        }
    }
    @IBAction func PLUS(_ sender: UIButton) {
        if Text_result_2.text == "" {
//            Text_result_2.text = "Error"
        }
        else {
            number = Text_result_2.text!
            if count == 0 {
                sum = Double(number)!
                count = count + 1
            }
            else {
                cal()
                count = count + 1
            }
            //
            
            if (doubleToInt(sum: sum))
            {
                history = String(sum_int) + " + "
            }
            else
            {
                history = String(sum) + " + "
            }
            //
            Text_result_1.text = history
            Text_result_2.text = ""
            
            type = "PLUS"
            
            UIView.animate(withDuration: 0.3, animations: {
                self.View_line1.alpha = 1
                self.View_line1.backgroundColor = self.BUTTON
                self.View_line2.backgroundColor = self.GRAY
            })
        }
    }
    @IBAction func MINUS(_ sender: UIButton) {
        if Text_result_2.text == "" {
//            Text_result_2.text = "Error"
        }
        else {
            number = Text_result_2.text!
            if count == 0 {
                sum = Double(number)!
                count = count + 1
            }
            else {
                cal()
                count = count + 1
            }
            //
            if (doubleToInt(sum: sum))
            {
                history = String(sum_int) + " - "
            }
            else
            {
                history = String(sum) + " - "
            }
            //
            Text_result_1.text = history
            Text_result_2.text = ""
            
            type = "MINUS"
            
            UIView.animate(withDuration: 0.3, animations: {
                self.View_line1.alpha = 1
                self.View_line1.backgroundColor = self.BUTTON
                self.View_line2.backgroundColor = self.GRAY
            })
        }
    }
    @IBAction func MULTIPLE(_ sender: UIButton) {
        if Text_result_2.text == "" {
//            Text_result_2.text = "Error"
        }
        else {
            number = Text_result_2.text!
            if count == 0 {
                sum = Double(number)!
                count = count + 1
            }
            else {
                cal()
                count = count + 1
            }
            if (doubleToInt(sum: sum))
            {
                history = String(sum_int) + " X "
            }
            else
            {
                history = String(sum) + " X "
            }
            Text_result_1.text = history
            Text_result_2.text = ""
            
            type = "MUL"
            
            UIView.animate(withDuration: 0.3, animations: {
                self.View_line1.alpha = 1
                self.View_line1.backgroundColor = self.BUTTON
                self.View_line2.backgroundColor = self.GRAY
            })
        }
    }
    @IBAction func DIV(_ sender: UIButton) {
        if Text_result_2.text == "" {
//            Text_result_2.text = "Error"
        }
        else {
            number = Text_result_2.text!
            if count == 0 {
                sum = Double(number)!
                count = count + 1
            }
            else {
                cal()
                count = count + 1
            }
            if (doubleToInt(sum: sum))
            {
                history = String(sum_int) + " / "
            }
            else
            {
                history = String(sum) + " / "
            }
            Text_result_1.text = history
            Text_result_2.text = ""
            
            type = "DIV"
            
            UIView.animate(withDuration: 0.3, animations: {
                self.View_line1.alpha = 1
                self.View_line1.backgroundColor = self.BUTTON
                self.View_line2.backgroundColor = self.GRAY
            })
        }
    }
    @IBAction func DEL(_ sender: UIButton) {
        let del_number = Text_result_2.text!
        if(del_number != "")
        {
            let range = del_number.startIndex..<del_number.index(before: del_number.endIndex)
            Text_result_2.text = String(del_number[range])  // Hello, playgroun
        }
    }
    @IBAction func AC(_ sender: UIButton) {
        Text_result_1.text = ""
        Text_result_2.text = ""
        sum = 0
        count = 0
        history = ""
        number = ""
        
        UIView.animate(withDuration: 0.3, animations: {
            self.View_line1.alpha = 0
            self.View_line2.alpha = 0
        })
    }
    
    func cal()
    {
        if type == "PLUS" {
            sum += Double(number)!
        }
        else if type == "MINUS" {
            sum -= Double(number)!
        }
        else if type == "MUL" {
            sum *= Double(number)!
        }
        else if type == "DIV" {
            sum /= Double(number)!
        }
    }
    
    func doubleToInt(sum : Double) -> Bool
    {
        sum_int = Int(sum)
        sum_str = String(sum_int) + ".0"
        if(sum_str == String(sum))
        {
            return true
        }
        else
        {
            return false
        }
    }
    
    

}
