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
    static var ONE: String = ""
    static var TWO: String = ""
    static var THREE: String = ""
    static var FOUR: String = ""
    static var FIVE: String = ""
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
            Print = "같은금액 입니다 :)"
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
            three_case1()
        case 2:
            three_case2()
        default:
            Print = "같은금액 입니다 :)"
        }
        
        return Print
    }
    
    static func fourAlgorithm(data: [String: Any]) -> String {
        A_name = data["A_name"] as! String
        B_name = data["B_name"] as! String
        C_name = data["C_name"] as! String
        D_name = data["D_name"] as! String
        RESULT_A = data["RESULT_A"] as! Int
        RESULT_B = data["RESULT_B"] as! Int
        RESULT_C = data["RESULT_C"] as! Int
        RESULT_D = data["RESULT_D"] as! Int
        
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
        if RESULT_D > 0 {
            State+=1
        }

        switch State {
        case 1:
            four_case1()
        case 2:
            four_case2()
        case 3:
            four_case3()
        default:
            Print = "같은금액 입니다 :)"
        }
        
        return Print
    }
    
    static func fiveAlgorithm(data: [String: Any]) -> String {
        A_name = data["A_name"] as! String
        B_name = data["B_name"] as! String
        C_name = data["C_name"] as! String
        D_name = data["D_name"] as! String
        E_name = data["E_name"] as! String
        RESULT_A = data["RESULT_A"] as! Int
        RESULT_B = data["RESULT_B"] as! Int
        RESULT_C = data["RESULT_C"] as! Int
        RESULT_D = data["RESULT_D"] as! Int
        RESULT_E = data["RESULT_E"] as! Int
        
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
        if RESULT_D > 0 {
            State+=1
        }
        if RESULT_E > 0 {
            State+=1
        }
        
        switch State {
        case 1:
            five_case1()
        case 2:
            five_case2()
        case 3:
            five_case3()
        case 4:
            five_case4()
        default:
            Print = "같은금액 입니다 :)"
        }
        
        return Print
    }
    
    static func three_case1() {
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
    
    static func three_case2() {
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
    
    static func four_case1() {
        //양수 하나 : 나머지 셋이 한사람에게 송금
        if RESULT_A > 0
        {
            if RESULT_B != 0
            {
                Print = B_name + " → " + A_name + " " + inputComma(innum: (-RESULT_B)) + " 원 송금\n"
            }
            if RESULT_C != 0
            {
                Print += C_name + " → " + A_name + " " + inputComma(innum: (-RESULT_C)) + " 원 송금\n"
            }
            if RESULT_D != 0
            {
                Print += D_name + " → " + A_name + " " + inputComma(innum: (-RESULT_D)) + " 원 송금"
            }
        }
        else if RESULT_B > 0
        {
            if RESULT_A != 0
            {
                Print = A_name + " → " + B_name + " " + inputComma(innum: (-RESULT_A)) + " 원 송금\n"
            }
            if RESULT_C != 0
            {
                Print += C_name + " → " + B_name + " " + inputComma(innum: (-RESULT_C)) + " 원 송금\n"
            }
            if RESULT_D != 0
            {
                Print += D_name + " → " + B_name + " " + inputComma(innum: (-RESULT_D)) + " 원 송금"
            }
        }
        else if RESULT_C > 0
        {
            if RESULT_A != 0
            {
                Print = A_name + " → " + C_name + " " + inputComma(innum: (-RESULT_A)) + " 원 송금\n"
            }
            if RESULT_B != 0
            {
                Print += B_name + " → " + C_name + " " + inputComma(innum: (-RESULT_B)) + " 원 송금\n"
            }
            if RESULT_D != 0
            {
                Print += D_name + " → " + C_name + " " + inputComma(innum: (-RESULT_D)) + " 원 송금"
            }
        }
        else if RESULT_D > 0
        {
            if RESULT_A != 0
            {
                Print = A_name + " → " + D_name + " " + inputComma(innum: (-RESULT_A)) + " 원 송금\n"
            }
            if RESULT_B != 0
            {
                Print += B_name + " → " + D_name + " " + inputComma(innum: (-RESULT_B)) + " 원 송금\n"
            }
            if RESULT_C != 0
            {
                Print += C_name + " → " + D_name + " " + inputComma(innum: (-RESULT_C)) + " 원 송금"
            }
        }
    }
    
    static func four_case2() {
        four_find()
        
        if array_after[0] > -(array_after[3])
        {
            let temp = array_after[0] + array_after[3]
            Print = FOUR + " → " + ONE + " " + inputComma(innum: (-array_after[3])) + " 원 송금\n"
                + THREE + " → " + ONE + " " + inputComma(innum: temp) + " 원 송금\n"
                    + THREE + " → " + TWO + " " + inputComma(innum: array_after[1]) + " 원 송금"
        }
        else if array_after[0] < -(array_after[3])
        {
            let temp = -(array_after[0] + array_after[3])
            Print = FOUR + " → " + ONE + " " + inputComma(innum: array_after[0]) + " 원 송금\n"
                    + FOUR + " → " + TWO + " " + inputComma(innum: temp) + " 원 송금\n"
                    + THREE + " → " + TWO + " " + inputComma(innum: (-array_after[2])) + " 원 송금"
        }
        else if array_after[0] == -(array_after[3])
        {
            Print = FOUR + " → " + ONE + " " + inputComma(innum: array_after[0]) + " 원 송금\n"
                    + THREE + " → " + TWO + " " + inputComma(innum: array_after[1]) + " 원 송금"
        }
    }
    
    static func four_case3() {
        //양수 셋 : 한명이 나머지 셋에게 송금
        if RESULT_A < 0
        {
            Print = A_name + " → " + B_name + " " + inputComma(innum: RESULT_B) + " 원 송금\n"
                    + A_name + " → " + C_name + " " + inputComma(innum: RESULT_C) + " 원 송금\n"
                    + A_name + " → " + D_name + " " + inputComma(innum: RESULT_D) + " 원 송금"
        }
        else if RESULT_B < 0
        {
            Print = B_name + " → " + A_name + " " + inputComma(innum: RESULT_A) + " 원 송금\n"
                    + B_name + " → " + C_name + " " + inputComma(innum: RESULT_C) + " 원 송금\n"
                    + B_name + " → " + D_name + " " + inputComma(innum: RESULT_D) + " 원 송금"
        }
        else if RESULT_C < 0
        {
            Print = C_name + " → " + A_name + " " + inputComma(innum: RESULT_A) + " 원 송금\n"
                    + C_name + " → " + B_name + " " + inputComma(innum: RESULT_B) + " 원 송금\n"
                    + C_name + " → " + D_name + " " + inputComma(innum: RESULT_D) + " 원 송금"
        }
        else if RESULT_D < 0
        {
            Print = D_name + " → " + A_name + " " + inputComma(innum: RESULT_A) + " 원 송금\n"
                    + D_name + " → " + B_name + " " + inputComma(innum: RESULT_B) + " 원 송금\n"
                    + D_name + " → " + C_name + " " + inputComma(innum: RESULT_C) + " 원 송금"
        }
    }
    
    static func four_find() {
        array_before.append(RESULT_A)
        array_before.append(RESULT_B)
        array_before.append(RESULT_C)
        array_before.append(RESULT_D)
        array_after = array_before.sorted(by: >)
        //ver1.1 정렬문제 해결
        var use_A: Bool = true
        var use_B: Bool = true
        var use_C: Bool = true
        var use_D: Bool = true
        var find: Bool = true
        var num: Int = 0
        for i in stride(from:0, to: 4, by: 1)
        {
            num = i+1
            if array_after[i] == RESULT_A
            {
                if(find && use_A)
                {
                    print("in A")
                    switch num {
                    case 1:
                        ONE = A_name
                        use_A = false
                        find = false
                    case 2:
                        TWO = A_name
                        use_A = false
                        find = false
                    case 3:
                        THREE = A_name
                        use_A = false
                        find = false
                    case 4:
                        FOUR = A_name
                        use_A = false
                        find = false
                    default:
                        Print = "Error"
                    }
                }
            }
            if array_after[i] == RESULT_B
            {
                if(find && use_B)
                {
                    print("in B")
                    switch num {
                    case 1:
                        ONE = B_name
                        use_B = false
                        find = false
                    case 2:
                        TWO = B_name
                        use_B = false
                        find = false
                    case 3:
                        THREE = B_name
                        use_B = false
                        find = false
                    case 4:
                        FOUR = B_name
                        use_B = false
                        find = false
                    default:
                        Print = "Error"
                    }
                }
            }
            if array_after[i] == RESULT_C
            {
                if(find && use_C)
                {
                    print("in C")
                    switch num {
                    case 1:
                        ONE = C_name
                        use_C = false
                        find = false
                    case 2:
                        TWO = C_name
                        use_C = false
                        find = false
                    case 3:
                        THREE = C_name
                        use_C = false
                        find = false
                        break
                    case 4:
                        FOUR = C_name
                        use_C = false
                        find = false
                    default:
                        Print = "Error"
                    }
                }
            }
            if array_after[i] == RESULT_D
            {
                if(find && use_D)
                {
                    print("in D")
                    switch num {
                    case 1:
                        ONE = D_name
                        use_D = false
                        find = false
                    case 2:
                        TWO = D_name
                        use_D = false
                        find = false
                    case 3:
                        THREE = D_name
                        use_D = false
                        find = false
                    case 4:
                        FOUR = D_name
                        use_D = false
                        find = false
                    default:
                        Print = "Error"
                    }
                }
            }
            find = true
        }
    }
    
    static func five_case1() {
        //나머지 네명이 한명한테 송금한다
        if RESULT_A > 0
        {
            if RESULT_B != 0
            {
                Print = B_name + " → " + A_name + " " + inputComma(innum: (-RESULT_B)) + " 원 송금\n"
            }
            if RESULT_C != 0
            {
                Print += C_name + " → " + A_name + " " + inputComma(innum: (-RESULT_C)) + " 원 송금\n"
            }
            if RESULT_D != 0
            {
                Print += D_name + " → " + A_name + " " + inputComma(innum: (-RESULT_D)) + " 원 송금\n"
            }
            if RESULT_E != 0
            {
                Print += E_name + " → " + A_name + " " + inputComma(innum: (-RESULT_E)) + " 원 송금"
            }
        }
        else if RESULT_B > 0
        {
            if RESULT_A != 0
            {
                Print = A_name + " → " + B_name + " " + inputComma(innum: (-RESULT_A)) + " 원 송금\n"
            }
            if RESULT_C != 0
            {
                Print += C_name + " → " + B_name + " " + inputComma(innum: (-RESULT_C)) + " 원 송금\n"
            }
            if RESULT_D != 0
            {
                Print += D_name + " → " + B_name + " " + inputComma(innum: (-RESULT_D)) + " 원 송금\n"
            }
            if RESULT_E != 0
            {
                Print += E_name + " → " + B_name + " " + inputComma(innum: (-RESULT_E)) + " 원 송금"
            }
        }
        else if RESULT_C > 0
        {
            if RESULT_A != 0
            {
                Print = A_name + " → " + C_name + " " + inputComma(innum: (-RESULT_A)) + " 원 송금\n"
            }
            if RESULT_B != 0
            {
                Print += B_name + " → " + C_name + " " + inputComma(innum: (-RESULT_B)) + " 원 송금\n"
            }
            if RESULT_D != 0
            {
                Print += D_name + " → " + C_name + " " + inputComma(innum: (-RESULT_D)) + " 원 송금\n"
            }
            if RESULT_E != 0
            {
                Print += E_name + " → " + C_name + " " + inputComma(innum: (-RESULT_E)) + " 원 송금"
            }
        }
        else if RESULT_D > 0
        {
            if RESULT_A != 0
            {
                Print = A_name + " → " + D_name + " " + inputComma(innum: (-RESULT_A)) + " 원 송금\n"
            }
            if RESULT_B != 0
            {
                Print += B_name + " → " + D_name + " " + inputComma(innum: (-RESULT_B)) + " 원 송금\n"
            }
            if RESULT_C != 0
            {
                Print += C_name + " → " + D_name + " " + inputComma(innum: (-RESULT_C)) + " 원 송금\n"
            }
            if RESULT_E != 0
            {
                Print += E_name + " → " + D_name + " " + inputComma(innum: (-RESULT_E)) + " 원 송금"
            }
        }
        else if RESULT_E > 0
        {
            if RESULT_A != 0
            {
                Print = A_name + " → " + E_name + " " + inputComma(innum: (-RESULT_A)) + " 원 송금\n"
            }
            if RESULT_B != 0
            {
                Print += B_name + " → " + E_name + " " + inputComma(innum: (-RESULT_B)) + " 원 송금\n"
            }
            if RESULT_C != 0
            {
                Print += C_name + " → " + E_name + " " + inputComma(innum: (-RESULT_C)) + " 원 송금\n"
            }
            if RESULT_D != 0
            {
                Print += D_name + " → " + E_name + " " + inputComma(innum: (-RESULT_D)) + " 원 송금"
            }
        }
    }
    
    static func five_case2() {
        //받는사람2 주는사람3
        five_find()
        
        if array_after[0] > -(array_after[4])
        {
            if array_after[1] > -(array_after[2])
            {
                let temp = array_after[0] + array_after[4]
                Print = FIVE + " → " + ONE + " " + inputComma(innum: (-array_after[4])) + " 원 송금\n"
                    + FOUR + " → " + ONE + " " + inputComma(innum: temp) + " 원 송금\n"
                        + FOUR + " → " + TWO + " " + inputComma(innum: (-temp-array_after[3])) + " 원 송금\n"
                    + THREE + " → " + TWO + " " + inputComma(innum: (-array_after[2])) + " 원 송금"
            }
            else if array_after[1] == -(array_after[2])
            {
                Print = FIVE + " → " + ONE + " " + inputComma(innum: (-array_after[4])) + " 원 송금\n"
                        + FOUR + " → " + ONE + " " + inputComma(innum: array_after[3]) + " 원 송금\n"
                        + THREE + " → " + TWO + " " + inputComma(innum: array_after[1]) + " 원 송금"
            }
            else if array_after[1] < -(array_after[2])
            {
                let temp = array_after[0] + array_after[3] + array_after[4]
                Print = FIVE + " → " + ONE + " " + inputComma(innum: (-array_after[4])) + " 원 송금\n"
                        + FOUR + " → " + ONE + " " + inputComma(innum: (-array_after[3])) + " 원 송금\n"
                        + THREE + " → " + ONE + " " + inputComma(innum: temp) + " 원 송금\n"
                        + THREE + " → " + TWO + " " + inputComma(innum: array_after[1]) + " 원 송금"
            }
        }
        else if array_after[0] < -(array_after[4])
        {
            let temp = -(array_after[0] + array_after[4])
            Print = FIVE + " → " + ONE + " " + inputComma(innum: array_after[0]) + " 원 송금\n"
                    + FIVE + " → " + TWO + " " + inputComma(innum: temp) + " 원 송금\n"
                    + FOUR + " → " + TWO + " " + inputComma(innum: (-array_after[3])) + " 원 송금\n"
                    + THREE + " → " + TWO + " " + inputComma(innum: (-array_after[2])) + " 원 송금"
        }
        else if array_after[0] == -(array_after[4])
        {
            Print = FIVE + " → " + ONE + " " + inputComma(innum: array_after[0]) + " 원 송금\n"
                    + FOUR + " → " + TWO + " " + inputComma(innum: (-array_after[3])) + " 원 송금\n"
                    + THREE + " → " + TWO + " " + inputComma(innum: (-array_after[2])) + " 원 송금"
        }
    }
    
    static func five_case3() {
        //받는사람3 주는사람2
        five_find()
        
        if array_after[0] < -(array_after[4])
        {
            if array_after[2] < -(array_after[3])
            {
                let temp = -(array_after[0] + array_after[4])
                Print = FIVE + " → " + ONE + " " + inputComma(innum: array_after[0]) + " 원 송금\n"
                        + FIVE + " → " + TWO + " " + inputComma(innum: temp) + " 원 송금\n"
                        + FOUR + " → " + TWO + " " + inputComma(innum: (array_after[1]-temp)) + " 원 송금\n"
                        + FOUR + " → " + THREE + " " + inputComma(innum: array_after[2]) + " 원 송금"
            }
            else if array_after[2] > -(array_after[3])
            {
                let temp = -(array_after[0] + array_after[1] + array_after[4])
                Print = FIVE + " → " + ONE + " " + inputComma(innum: array_after[0]) + " 원 송금\n"
                        + FIVE + " → " + TWO + " " + inputComma(innum: array_after[1]) + " 원 송금\n"
                        + FIVE + " → " + THREE + " " + inputComma(innum: temp) + " 원 송금\n"
                        + FOUR + " → " + THREE + " " + inputComma(innum: (array_after[2]-temp)) + " 원 송금"
            }
            else if array_after[2] == -(array_after[3])
            {
                Print = FIVE + " → " + ONE + " " + inputComma(innum: array_after[0]) + " 원 송금\n"
                        + FIVE + " → " + TWO + " " + inputComma(innum: array_after[1]) + " 원 송금\n"
                        + FOUR + " → " + THREE + " " + inputComma(innum: array_after[2]) + " 원 송금"
            }
        }
        else if array_after[0] > -(array_after[4])
        {
            let temp = array_after[0] + array_after[4]
            Print = FIVE + " → " + ONE + " " + inputComma(innum: (-array_after[4])) + " 원 송금\n"
                + FOUR + " → " + ONE + " " + inputComma(innum: temp) + " 원 송금\n"
                    + FOUR + " → " + TWO + " " + inputComma(innum: array_after[1]) + " 원 송금\n"
                    + FOUR + " → " + THREE + " " + inputComma(innum: array_after[2]) + " 원 송금"
        }
        else if array_after[0] == -(array_after[4])
        {
            Print = FIVE + " → " + ONE + " " + inputComma(innum: array_after[0]) + " 원 송금\n"
                    + FOUR + " → " + TWO + " " + inputComma(innum: array_after[1]) + " 원 송금\n"
                    + FOUR + " → " + THREE + " " + inputComma(innum: array_after[2]) + " 원 송금"
        }
    }
    
    static func five_case4() {
        //한명이 나머지 네명한테 송금한다
        if RESULT_A < 0
        {
            Print = A_name + " → " + B_name + " " + inputComma(innum: RESULT_B) + " 원 송금\n"
                    + A_name + " → " + C_name + " " + inputComma(innum: RESULT_C) + " 원 송금\n"
                    + A_name + " → " + D_name + " " + inputComma(innum: RESULT_D) + " 원 송금\n"
                    + A_name + " → " + E_name + " " + inputComma(innum: RESULT_E) + " 원 송금"
        }
        else if RESULT_B < 0
        {
            Print = B_name + " → " + A_name + " " + inputComma(innum: RESULT_A) + " 원 송금\n"
                    + B_name + " → " + C_name + " " + inputComma(innum: RESULT_C) + " 원 송금\n"
                    + B_name + " → " + D_name + " " + inputComma(innum: RESULT_D) + " 원 송금\n"
                    + B_name + " → " + E_name + " " + inputComma(innum: RESULT_E) + " 원 송금"
        }
        else if RESULT_C < 0
        {
            Print = C_name + " → " + A_name + " " + inputComma(innum: RESULT_A) + " 원 송금\n"
                    + C_name + " → " + B_name + " " + inputComma(innum: RESULT_B) + " 원 송금\n"
                    + C_name + " → " + D_name + " " + inputComma(innum: RESULT_D) + " 원 송금\n"
                    + C_name + " → " + E_name + " " + inputComma(innum: RESULT_E) + " 원 송금"
        }
        else if RESULT_D < 0
        {
            Print = D_name + " → " + A_name + " " + inputComma(innum: RESULT_A) + " 원 송금\n"
                    + D_name + " → " + B_name + " " + inputComma(innum: RESULT_B) + " 원 송금\n"
                    + D_name + " → " + C_name + " " + inputComma(innum: RESULT_C) + " 원 송금\n"
                    + D_name + " → " + E_name + " " + inputComma(innum: RESULT_E) + " 원 송금"
        }
        else if RESULT_E < 0
        {
            Print = E_name + " → " + A_name + " " + inputComma(innum: RESULT_A) + " 원 송금\n"
                    + E_name + " → " + B_name + " " + inputComma(innum: RESULT_B) + " 원 송금\n"
                    + E_name + " → " + C_name + " " + inputComma(innum: RESULT_C) + " 원 송금\n"
                    + E_name + " → " + D_name + " " + inputComma(innum: RESULT_D) + " 원 송금"
        }
    }
    
    static func five_find() {
        array_before.append(RESULT_A)
        array_before.append(RESULT_B)
        array_before.append(RESULT_C)
        array_before.append(RESULT_D)
        array_before.append(RESULT_E)
        array_after = array_before.sorted(by: >)
        //ver1.1 정렬문제 해결
        var use_A: Bool = true
        var use_B: Bool = true
        var use_C: Bool = true
        var use_D: Bool = true
        var use_E: Bool = true
        var find: Bool = true
        var num: Int = 0
        for i in stride(from:0, to: 5, by: 1)
        {
            num = i+1
            if array_after[i] == RESULT_A
            {
                if(find && use_A)
                {
                    switch num {
                    case 1:
                        ONE = A_name
                        use_A = false
                        find = false
                    case 2:
                        TWO = A_name
                        use_A = false
                        find = false
                    case 3:
                        THREE = A_name
                        use_A = false
                        find = false
                    case 4:
                        FOUR = A_name
                        use_A = false
                        find = false
                    case 5:
                        FIVE = A_name
                        use_A = false
                        find = false
                    default:
                        Print = "Error"
                    }
                }
            }
            if array_after[i] == RESULT_B
            {
                if(find && use_B)
                {
                    switch num {
                    case 1:
                        ONE = B_name
                        use_B = false
                        find = false
                    case 2:
                        TWO = B_name
                        use_B = false
                        find = false
                    case 3:
                        THREE = B_name
                        use_B = false
                        find = false
                    case 4:
                        FOUR = B_name
                        use_B = false
                        find = false
                    case 5:
                        FIVE = B_name
                        use_B = false
                        find = false
                    default:
                        Print = "Error"
                    }
                }
            }
            if array_after[i] == RESULT_C
            {
                if(find && use_C)
                {
                    switch num {
                    case 1:
                        ONE = C_name
                        use_C = false
                        find = false
                    case 2:
                        TWO = C_name
                        use_C = false
                        find = false
                    case 3:
                        THREE = C_name
                        use_C = false
                        find = false
                    case 4:
                        FOUR = C_name
                        use_C = false
                        find = false
                    case 5:
                        FIVE = C_name
                        use_C = false
                        find = false
                    default:
                        Print = "Error"
                    }
                }
            }
            if array_after[i] == RESULT_D
            {
                if(find && use_D)
                {
                    switch num {
                    case 1:
                        ONE = D_name
                        use_D = false
                        find = false
                    case 2:
                        TWO = D_name
                        use_D = false
                        find = false
                    case 3:
                        THREE = D_name
                        use_D = false
                        find = false
                    case 4:
                        FOUR = D_name
                        use_D = false
                        find = false
                    case 5:
                        FIVE = D_name
                        use_D = false
                        find = false
                    default:
                        Print = "Error"
                    }
                }
            }
            if array_after[i] == RESULT_E
            {
                if(find && use_E)
                {
                    switch num {
                    case 1:
                        ONE = E_name
                        use_E = false
                        find = false
                    case 2:
                        TWO = E_name
                        use_E = false
                        find = false
                    case 3:
                        THREE = E_name
                        use_E = false
                        find = false
                    case 4:
                        FOUR = E_name
                        use_E = false
                        find = false
                    case 5:
                        FIVE = E_name
                        use_E = false
                        find = false
                    default:
                        Print = "Error"
                    }
                }
            }
            find = true
        }
    }
    
    static func inputComma(innum: Int) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        
        let RESULT_COMMA: String = numberFormatter.string(from:NSNumber(value: innum))!
        return RESULT_COMMA
    }
}
