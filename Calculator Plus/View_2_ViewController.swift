//
//  View_2_ViewController.swift
//  Calculator Plus
//
//  Created by Min_MacBook Pro on 2020/03/13.
//  Copyright © 2020 FreeDeveloper. All rights reserved.
//

import UIKit

class View_2_ViewController: UIViewController {

    @IBOutlet weak var Button_1: UIButton!
    @IBOutlet weak var Button_2: UIButton!
    @IBOutlet weak var Button_3: UIButton!
    @IBOutlet weak var Button_4: UIButton!
    
    
    let brown = UIColor(named: "Dynamic_brown")
    
    override func viewDidLoad() {
        Button_1.alpha = 0
        Button_2.alpha = 0
        Button_3.alpha = 0
        Button_4.alpha = 0
        UIView.animate(withDuration: 0.4, animations: {
            self.Button_1.alpha = 1
        })
        UIView.animate(withDuration: 0.6, animations: {
            self.Button_2.alpha = 1
        })
        UIView.animate(withDuration: 0.8, animations: {
            self.Button_3.alpha = 1
        })
        UIView.animate(withDuration: 1.0, animations: {
            self.Button_4.alpha = 1
        })
        super.viewDidLoad()

    }
}
