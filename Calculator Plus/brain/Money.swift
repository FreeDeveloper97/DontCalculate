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
            print("error")
            return -1
        } else if Money < 2030 {
            //0.1 ~ 0.9의 경우
            let data = [1150, 1255, 1330, 1415, 1510, 1620, 1750, 1900, 2030]
            let data2 = [0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9]
            per = getPersent(Money: Money, data: data, data2: data2)
        } else if Money < 2630 {
            //1.0 ~ 1.9의 경우
            let data = [2120, 2230, 2340, 2410, 2440, 2480, 2520, 2550, 2590, 2630]
            let data2 = [1.0, 1.1, 1.2, 1.3, 1.4, 1.5, 1.6, 1.7, 1.8, 1.9]
            per = getPersent(Money: Money, data: data, data2: data2)
        } else if Money < 3100 {
            //2.0 ~ 2.9의 경우
            let data = [2670, 2720, 2760, 2800, 2850, 2900, 2950, 3000, 3040, 3100]
            let data2 = [2.0, 2.1, 2.2, 2.3, 2.4, 2.5, 2.6, 2.7, 2.8, 2.9]
            per = getPersent(Money: Money, data: data, data2: data2)
        } else if Money < 3480 {
            //3.0 ~ 3.9의 경우
            let data = [3140, 3180, 3220, 3240, 3280, 3320, 3360, 3400, 3440, 3480]
            let data2 = [3.0, 3.1, 3.2, 3.3, 3.4, 3.5, 3.6, 3.7, 3.8, 3.9]
            per = getPersent(Money: Money, data: data, data2: data2)
        } else if Money < 3880 {
            //4.0 ~ 4.9의 경우
            let data = [3520, 3560, 3620, 3660, 3700, 3760, 3780, 3840, 3880]
            let data2 = [4.0, 4.1, 4.2, 4.3, 4.4, 4.5, 4.7, 4.8, 4.9]
            per = getPersent(Money: Money, data: data, data2: data2)
        } else if Money < 4400 {
            //5.0 ~ 5.9의 경우
            let data = [3920, 3980, 4020, 4080, 4120, 4180, 4240, 4280, 4340, 4400]
            let data2 = [5.0, 5.1, 5.2, 5.3, 5.4, 5.5, 5.6, 5.7, 5.8, 5.9]
            per = getPersent(Money: Money, data: data, data2: data2)
        } else if Money < 5000 {
            //6.0 ~ 6.9의 경우
            let data = [4460, 4520, 4580, 4620, 4680, 4740, 4800, 4860, 4940, 5000]
            let data2 = [6.0, 6.1, 6.2, 6.3, 6.4, 6.5, 6.6, 6.7, 6.8, 6.9]
            per = getPersent(Money: Money, data: data, data2: data2)
        } else if Money < 5680 {
            //7.0 ~ 7.9의 경우
            let data = [5080, 5140, 5220, 5300, 5380, 5460, 5560, 5620, 5660, 5680]
            let data2 = [7.0, 7.1, 7.2, 7.3, 7.4, 7.5, 7.6, 7.7, 7.8, 7.9]
            per = getPersent(Money: Money, data: data, data2: data2)
        } else if Money < 5940 {
            //8.0 ~ 8.9의 경우
            let data = [5740, 5780, 5820, 5840, 5860, 5880, 5940]
            let data2 = [8.0, 8.1, 8.2, 8.3, 8.7, 8.8, 8.9]
            per = getPersent(Money: Money, data: data, data2: data2)
        } else if Money < 6400 {
            //9.0 ~ 9.9의 경우
            let data = [5980, 6020, 6060, 6100, 6160, 6200, 6240, 6300, 6340, 6400]
            let data2 = [9.0, 9.1, 9.2, 9.3, 9.4, 9.5, 9.6, 9.7, 9.8, 9.9]
            per = getPersent(Money: Money, data: data, data2: data2)
        } else if Money < 6940 {
            //10.0 ~ 10.9의 경우
            let data = [6440, 6500, 6560, 6600, 6660, 6720, 6780, 6820, 6880, 6940]
            let data2 = [10.0, 10.1, 10.2, 10.3, 10.4, 10.5, 10.6, 10.7, 10.8, 10.9]
            per = getPersent(Money: Money, data: data, data2: data2)
        } else if Money < 7600 {
            //11.0 ~ 11.9의 경우
            let data = [7000, 7060, 7120, 7180, 7260, 7320, 7380, 7460, 7520, 7600]
            let data2 = [11.0, 11.1, 11.2, 11.3, 11.4, 11.5, 11.6, 11.7, 11.8, 11.9]
            per = getPersent(Money: Money, data: data, data2: data2)
        } else if Money < 8380 {
            //12.0 ~ 12.9의 경우
            let data = [7660, 7740, 7820, 7880, 7960, 8040, 8120, 8200, 8300, 8380]
            let data2 = [12.0, 12.1, 12.2, 12.3, 12.4, 12.5, 12.6, 12.7, 12.8, 12.9]
            per = getPersent(Money: Money, data: data, data2: data2)
        } else if Money < 9240 {
            //13.0 ~ 13.9의 경우
            let data = [8460, 8540, 8620, 8700, 8800, 8880, 8980, 9080, 9160, 9240]
            let data2 = [13.0, 13.1, 13.2, 13.3, 13.4, 13.5, 13.6, 13.7, 13.8, 13.9]
            per = getPersent(Money: Money, data: data, data2: data2)
        } else if Money > 9720 {
            //14.0 ~ 14.9의 경우
            let data = [9280, 9320, 9380, 9420, 9480, 9520, 9560, 9620, 9660, 9720]
            let data2 = [14.0, 14.1, 14.2, 14.3, 14.4, 14.5, 14.6, 14.7, 14.8, 14.9]
            per = getPersent(Money: Money, data: data, data2: data2)
        } else if Money < 10000 {
            //15.0 ~ 15.5의 경우
            let data = [9760, 9820, 9880, 9920, 9980, 10000]
            let data2 = [15.0, 15.1, 15.2, 15.3, 15.4, 15.5]
            per = getPersent(Money: Money, data: data, data2: data2)
        } else {
            //천만원 초과의 경우
            print("error")
            return -1
        }
        
        result = Int(Double(Money)*per*10)
        return result
    }
    
    static func algoOfIncomMoney2(Money: Int) -> Int {
        var result: Int = 0
        var per: Double = -1
        
        if Money < 1340 {
            //없는 경우
            print("error")
            return -1
        } else if Money < 2340 {
            //0.1 ~ 0.9의 경우
            let data = [1430, 1510, 1600, 1700, 1820, 1950, 2100, 2240, 2340]
            let data2 = [0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9]
            per = getPersent(Money: Money, data: data, data2: data2)
        } else if Money < 2900 {
            //1.0 ~ 1.9의 경우
            let data = [2450, 2570, 2620, 2660, 2690, 2730, 2770, 2810, 2860, 2900]
            let data2 = [1.0, 1.1, 1.2, 1.3, 1.4, 1.5, 1.6, 1.7, 1.8, 1.9]
            per = getPersent(Money: Money, data: data, data2: data2)
        } else if Money < 3380 {
            //2.0 ~ 2.9의 경우
            let data = [2940, 2990, 3040, 3080, 3140, 3180, 3240, 3300, 3340, 3380]
            let data2 = [2.0, 2.1, 2.2, 2.3, 2.4, 2.5, 2.6, 2.7, 2.8, 2.9]
            per = getPersent(Money: Money, data: data, data2: data2)
        } else if Money < 3760 {
            //3.0 ~ 3.9의 경우
            let data = [3420, 3460, 3500, 3540, 3580, 3620, 3660, 3700, 3740, 3760]
            let data2 = [3.0, 3.1, 3.2, 3.3, 3.4, 3.5, 3.6, 3.7, 3.8, 3.9]
            per = getPersent(Money: Money, data: data, data2: data2)
        } else if Money < 4220 {
            //4.0 ~ 4.9의 경우
            let data = [3800, 3840, 3880, 3940, 3980, 4020, 4060, 4120, 4160, 4220]
            let data2 = [4.0, 4.1, 4.2, 4.3, 4.4, 4.5, 4.7, 4.8, 4.9]
            per = getPersent(Money: Money, data: data, data2: data2)
        } else if Money < 4740 {
            //5.0 ~ 5.9의 경우
            let data = [4260, 4320, 4380, 4420, 4480, 4540, 4580, 4620, 4680, 4740]
            let data2 = [5.0, 5.1, 5.2, 5.3, 5.4, 5.5, 5.6, 5.7, 5.8, 5.9]
            per = getPersent(Money: Money, data: data, data2: data2)
        } else if Money < 5420 {
            //6.0 ~ 6.9의 경우
            let data = [48000, 4860, 4920, 4980, 5060, 5120, 5200, 5260, 5340, 5420]
            let data2 = [6.0, 6.1, 6.2, 6.3, 6.4, 6.5, 6.6, 6.7, 6.8, 6.9]
            per = getPersent(Money: Money, data: data, data2: data2)
        } else if Money < 5860 {
            //7.0 ~ 7.9의 경우
            let data = [5500, 5580, 5660, 5740, 5820, 5840, 5860]
            let data2 = [7.0, 7.1, 7.2, 7.3, 7.4, 7.5, 7.9]
            per = getPersent(Money: Money, data: data, data2: data2)
        } else if Money < 6280 {
            //8.0 ~ 8.9의 경우
            let data = [5880, 5920, 5980, 6020, 6060, 6100, 6140, 6180, 6240, 6280]
            let data2 = [8.0, 8.1, 8.2, 8.3, 8.4, 8.5, 8.6, 8.7, 8.8, 8.9]
            per = getPersent(Money: Money, data: data, data2: data2)
        } else if Money < 6780 {
            //9.0 ~ 9.9의 경우
            let data = [6320, 6380, 6420, 6460, 6520, 6560, 6620, 6680, 6720, 6780]
            let data2 = [9.0, 9.1, 9.2, 9.3, 9.4, 9.5, 9.6, 9.7, 9.8, 9.9]
            per = getPersent(Money: Money, data: data, data2: data2)
        } else if Money < 7360 {
            //10.0 ~ 10.9의 경우
            let data = [6840, 6880, 6940, 7000, 7060, 7120, 7180, 7240, 7300, 7360]
            let data2 = [10.0, 10.1, 10.2, 10.3, 10.4, 10.5, 10.6, 10.7, 10.8, 10.9]
            per = getPersent(Money: Money, data: data, data2: data2)
        } else if Money < 8060 {
            //11.0 ~ 11.9의 경우
            let data = [7420, 7500, 7560, 7620, 7700, 7760, 7840, 7900, 7980, 8060]
            let data2 = [11.0, 11.1, 11.2, 11.3, 11.4, 11.5, 11.6, 11.7, 11.8, 11.9]
            per = getPersent(Money: Money, data: data, data2: data2)
        } else if Money < 8860 {
            //12.0 ~ 12.9의 경우
            let data = [8140, 8220, 8300, 8380, 8440, 8520, 8600, 8700, 8780, 8860]
            let data2 = [12.0, 12.1, 12.2, 12.3, 12.4, 12.5, 12.6, 12.7, 12.8, 12.9]
            per = getPersent(Money: Money, data: data, data2: data2)
        } else if Money < 9600 {
            //13.0 ~ 13.9의 경우
            let data = [8940, 9040, 9120, 9220, 9320, 9400, 9460, 9520, 9560, 9600]
            let data2 = [13.0, 13.1, 13.2, 13.3, 13.4, 13.5, 13.6, 13.7, 13.8, 13.9]
            per = getPersent(Money: Money, data: data, data2: data2)
        } else if Money > 10000 {
            //14.0 ~ 14.7의 경우
            let data = [9660, 9700, 9760, 9800, 9860, 9900, 9960, 10000]
            let data2 = [14.0, 14.1, 14.2, 14.3, 14.4, 14.5, 14.6, 14.7]
            per = getPersent(Money: Money, data: data, data2: data2)
        } else {
            //천만원 초과의 경우
            print("error")
            return -1
        }
        
        result = Int(Double(Money)*per*10)
        return result
    }
    
    static func getPersent(Money: Int, data: [Int], data2: [Double]) -> Double {
        var loop: Bool = true
        for i in 0...9 {
            if (loop && Money < data[i]) {
                loop = false
                return data2[i]
            }
        }
        return -1
    }
}
