//
//  Money.swift
//  Calculator Plus
//
//  Created by Kang Minsang on 2021/01/24.
//  Copyright © 2021 FreeDeveloper. All rights reserved.
//

import Foundation
class Money {
    //2021.01.24 update
    static let DATA = [0.045, 0.0343, 0.0576, 0.008]
    
    //국민연금
    static func algoOfMoney1(Money: Int) -> Double {
        return Double(Money) * DATA[0]
    }
    //건강보험
    static func algoOfMoney2(Money: Int) -> Double {
        return Double(Money) * DATA[1]
    }
    //장기요양
    static func algoOfMoney3(Money: Int) -> Double {
        return Double(Money) * DATA[1] * DATA[2] * 2
    }
    //고용보험
    static func algoOfMoney4(Money: Int) -> Double {
        return Double(Money) * DATA[3]
    }
    
    static func algoOfIncomMoney(Money: Int) -> Int {
        var result: Int = 0
        var per: Double = -1
        if Money < 1060 {
            //없는 경우
        } else if Money < 2030 {
            //0.1 ~ 0.9의 경우
            let data = [1150, 1255, 1330, 1415, 1510, 1620, 1750, 1900, 2030]
            let data2 = [0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9]
            per = getPersent(Money: Money, data: data, data2: data2)
        } else if Money < 2630 {
            //1.0 ~ 1.9의 경우
        } else if Money < 3100 {
            //2.0 ~ 2.9의 경우
        } else if Money < 3480 {
            //3.0 ~ 3.9의 경우
        } else if Money < 3880 {
            //4.0 ~ 4.9의 경우
        } else if Money < 4400 {
            //5.0 ~ 5.9의 경우
        } else if Money < 5000 {
            //6.0 ~ 6.9의 경우
        } else if Money < 5680 {
            //7.0 ~ 7.9의 경우
        } else if Money < 5940 {
            //8.0 ~ 8.9의 경우
        } else if Money < 6400 {
            //9.0 ~ 9.9의 경우
        } else if Money < 6940 {
            //10.0 ~ 10.9의 경우
        } else if Money < 7600 {
            //11.0 ~ 11.9의 경우
        } else if Money < 8380 {
            //12.0 ~ 12.9의 경우
        } else if Money < 9240 {
            //13.0 ~ 13.9의 경우
        } else if Money > 9720 {
            //14.0 ~ 14.9의 경우
        } else if Money < 10000 {
            //15.0 ~ 15.5의 경우
        }
        
        result = Int(Double(Money)*per)
        return result
    }
    
    static func getPersent(Money: Int, data: [Int], data2: [Double]) -> Double {
        for i in 1...9 {
            if Money < data[i] {
                return data2[i]
            }
        }
        return -1
    }
}
