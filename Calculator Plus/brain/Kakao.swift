//
//  KakaoSend.swift
//  Calculator Plus
//
//  Created by Kang Minsang on 2021/01/23.
//  Copyright © 2021 FreeDeveloper. All rights reserved.
//

import Foundation
class Kakao {
    static func sendData(data: String) {
        let kakao_print: String = data
        if kakao_print != "" {
            let template = KMTTextTemplate { (KMTTextTemplateBuilder) in
                KMTTextTemplateBuilder.text = kakao_print
                KMTTextTemplateBuilder.link = KMTLinkObject(builderBlock: { (linkBuilder) in
                    linkBuilder.mobileWebURL = URL(string: "https://developers.kakao.com")
                })
            }
            // 서버에서 콜백으로 받을 정보
            let serverCallbackArgs = ["user_id": "FDEE", "product_id": "415849"]
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
}
