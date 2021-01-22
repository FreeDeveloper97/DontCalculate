//
//  Calculate.swift
//  Calculator Plus
//
//  Created by Kang Minsang on 2021/01/22.
//  Copyright © 2021 FreeDeveloper. All rights reserved.
//

import Foundation

class Calculate {
    
    static var A_name: String = ""
    static var B_name: String = ""
    static var C_name: String = ""
    static var D_name: String = ""
    static var E_name: String = ""
    static var RESULT_A: Int = 0
    static var RESULT_B: Int = 0
    static var RESULT_C: Int = 0
    static var RESULT_D: Int = 0
    static var RESULT_E: Int = 0
    static var Print: String = ""
    static var array_before: [Int] = []
    static var array_after: [Int] = []
    
    static func twoAlgorithm(data: [String: Any]) -> String {
        A_name = data["A_name"] as! String
        B_name = data["B_name"] as! String
        RESULT_A = data["RESULT_A"] as! Int
        RESULT_B = data["RESULT_B"] as! Int
        
        if RESULT_A > RESULT_B {
            Print = B_name + " → " + A_name + " " + inputComma(innum: RESULT_A) + " 원 송금"
        } else if RESULT_A < RESULT_B {
            Print = A_name + " → " + B_name + " " + inputComma(innum: RESULT_B) + " 원 송금"
        } else {
            Print = "Error"
        }
        return Print
    }
    
    static func threeAlgorithm(data: [String: Any]) -> String {
        A_name = data["A_name"] as! String
        B_name = data["B_name"] as! String
        C_name = data["C_name"] as! String
        RESULT_A = data["RESULT_A"] as! Int
        RESULT_B = data["RESULT_B"] as! Int
        RESULT_C = data["RESULT_C"] as! Int
        
        var State: Int = 0
        
        if RESULT_A > 0 {
            State+=1
        }
        if RESULT_B > 0 {
            State+=1
        }
        if RESULT_C > 0 {
            State+=1
        }

        array_before.append(RESULT_A)
        array_before.append(RESULT_B)
        array_before.append(RESULT_C)
        array_after = array_before.sorted(by: >)

        switch State {
        case 1:
            two_case1()
        case 2:
            two_case2()
        default:
            Print = "Error"
        }
        
        return Print
    }
    
    static func fourAlgorithm(data: [String: Any]) -> String {
        
        return Print
    }
    
    static func fiveAlgorithm(data: [String: Any]) -> String {
        
        return Print
    }
    
    static func two_case1() {
        //양수가 하나 : 나머지 두명이 한명한테 송금해야 한다
        if array_after[1] == 0
        {
            if RESULT_A > 0
            {
                if RESULT_B == array_after[2]
                {
                    Print = B_name + " → " + A_name + " " + inputComma(innum: RESULT_A) + " 원 송금"
                }
                else if RESULT_C == array_after[2]
                {
                    Print = C_name + " → " + A_name + " " + inputComma(innum: RESULT_A) + " 원 송금"
                }
            }
            else if RESULT_B > 0
            {
                if RESULT_A == array_after[2]
                {
                    Print = A_name + " → " + B_name + " " + inputComma(innum: RESULT_B) + " 원 송금"
                }
                else if RESULT_C == array_after[2]
                {
                    Print = C_name + " → " + B_name + " " + inputComma(innum: RESULT_B) + " 원 송금"
                }
            }
            else if RESULT_C > 0
            {
                if RESULT_A == array_after[2]
                {
                    Print = A_name + " → " + C_name + " " + inputComma(innum: RESULT_C) + " 원 송금"
                }
                else if RESULT_B == array_after[2]
                {
                    Print = B_name + " → " + C_name + " " + inputComma(innum: RESULT_C) + " 원 송금"
                }
            }
        }
        else if RESULT_A > 0
        {
            Print = B_name + " → " + A_name + " " + inputComma(innum: (-RESULT_B)) + " 원 송금\n"
                    + C_name + " → " + A_name + " " + inputComma(innum: (-RESULT_C)) + " 원 송금"
        }
        else if RESULT_B > 0
        {
            Print = A_name + " → " + B_name + " " + inputComma(innum: (-RESULT_A)) + " 원 송금\n"
                    + C_name + " → " + B_name + " " + inputComma(innum: (-RESULT_C)) + " 원 송금"
        }
        else if RESULT_C > 0
        {
            Print = A_name + " → " + C_name + " " + inputComma(innum: (-RESULT_A)) + " 원 송금\n"
                    + B_name + " → " + C_name + " " + inputComma(innum: (-RESULT_B)) + " 원 송금"
        }
    }
    
    static func two_case2() {
        //양수가 둘 : 한명이 나머지 두명한테 송금해야 한다
        //[0] > [1] > [2]
        if(RESULT_A == array_after[2])
        {
            Print = A_name + " → " + B_name + " " + inputComma(innum: (-RESULT_B)) + " 원 송금\n"
                    + A_name + " → " + C_name + " " + inputComma(innum: (-RESULT_C)) + " 원 송금"
        }
        else if(RESULT_B == array_after[2])
        {
            Print = B_name + " → " + A_name + " " + inputComma(innum: RESULT_A) + " 원 송금\n"
                    + B_name + " → " + C_name + " " + inputComma(innum: RESULT_C) + " 원 송금"
        }
        else if(RESULT_C == array_after[2])
        {
            Print = C_name + " → " + A_name + " " + inputComma(innum: RESULT_A) + " 원 송금\n"
                    + C_name + " → " + B_name + " " + inputComma(innum: RESULT_B) + " 원 송금"
        }
    }
    
    static func inputComma(innum: Int) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        
        let RESULT_COMMA: String = numberFormatter.string(from:NSNumber(value: innum))!
        return RESULT_COMMA
    }
}
