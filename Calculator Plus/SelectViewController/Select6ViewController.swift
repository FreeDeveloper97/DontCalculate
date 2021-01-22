//
//  View_5_ViewController.swift
//  Calculator Plus
//
//  Created by Min_MacBook Pro on 2020/04/08.
//  Copyright © 2020 FreeDeveloper. All rights reserved.
//

import UIKit

class Select6ViewController: UIViewController {
    
    @IBOutlet weak var Button_1: UIButton!
    @IBOutlet weak var Button_2: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setRadius()
        setAlpha()
        showAnimation()
    }
}



extension Select6ViewController {
    func setRadius() {
        Button_1.layer.cornerRadius = 4
        Button_1.clipsToBounds = true
        Button_2.layer.cornerRadius = 4
        Button_2.clipsToBounds = true
    }
    
    func setAlpha() {
        Button_1.alpha = 0
        Button_2.alpha = 0
    }
    
    func showAnimation() {
        UIView.animate(withDuration: 0.4, animations: {
            self.Button_1.alpha = 1
        })
        UIView.animate(withDuration: 0.5, animations: {
            self.Button_2.alpha = 1
        })
    }
}
