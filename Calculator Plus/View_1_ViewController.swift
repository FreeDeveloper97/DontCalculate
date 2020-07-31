//
//  Activity_1_ViewController.swift
//  Calculator Plus
//
//  Created by Min_MacBook Pro on 2020/03/12.
//  Copyright © 2020 FreeDeveloper. All rights reserved.
//

import UIKit

class View_1_ViewController: UIViewController {
    
    @IBOutlet weak var Button_1: UIButton!
    @IBOutlet weak var Button_2: UIButton!
    
    override func viewDidLoad() {
        Button_1.layer.cornerRadius = 4
        Button_1.clipsToBounds = true
        Button_2.layer.cornerRadius = 4
        Button_2.clipsToBounds = true
        Button_1.alpha = 0
        Button_2.alpha = 0
        
        Button_1.setImage(UIImage(named: "icon_2"), for: .normal)
        Button_2.setImage(UIImage(named: "icon_2_2"), for: .normal)
        UIView.animate(withDuration: 0.4, animations: {
            self.Button_1.alpha = 1
        })
        UIView.animate(withDuration: 0.6, animations: {
            self.Button_2.alpha = 1
        })
        
        super.viewDidLoad()
    }
    
}
