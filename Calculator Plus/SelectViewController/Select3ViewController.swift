//
//  View_2_ViewController.swift
//  Calculator Plus
//
//  Created by Min_MacBook Pro on 2020/03/13.
//  Copyright © 2020 FreeDeveloper. All rights reserved.
//

import UIKit

class Select3ViewController: UIViewController {

    @IBOutlet weak var Button_1: UIButton!
    @IBOutlet weak var Button_2: UIButton!
    @IBOutlet weak var Button_3: UIButton!
    @IBOutlet weak var Button_4: UIButton!
    
    
    let brown = UIColor(named: "Dynamic_brown")
    
    override func viewDidLoad() {
        Button_1.layer.cornerRadius = 4
        Button_1.clipsToBounds = true
        Button_2.layer.cornerRadius = 4
        Button_2.clipsToBounds = true
        Button_3.layer.cornerRadius = 4
        Button_3.clipsToBounds = true
        Button_4.layer.cornerRadius = 4
        Button_4.clipsToBounds = true
        Button_1.alpha = 0
        Button_2.alpha = 0
        Button_3.alpha = 0
        Button_4.alpha = 0
        
        UIView.animate(withDuration: 0.4, animations: {
            self.Button_1.alpha = 1
        })
        UIView.animate(withDuration: 0.45, animations: {
            self.Button_2.alpha = 1
        })
        UIView.animate(withDuration: 0.5, animations: {
            self.Button_3.alpha = 1
        })
        UIView.animate(withDuration: 0.55, animations: {
            self.Button_4.alpha = 1
        })
        super.viewDidLoad()

    }
}