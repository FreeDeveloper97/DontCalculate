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
}
