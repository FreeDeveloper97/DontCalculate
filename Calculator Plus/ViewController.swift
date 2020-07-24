//
//  ViewController.swift
//  Calculator Plus
//
//  Created by Min_MacBook Pro on 2020/03/10.
//  Copyright © 2020 FreeDeveloper. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var Button_1: UIButton!
    @IBOutlet var Button_2: UIButton!
    @IBOutlet var Button_3: UIButton!
    @IBOutlet var Button_4: UIButton!
    @IBOutlet var Button_5: UIButton!
    @IBOutlet var Button_6: UIButton!
    @IBOutlet var Button_7: UIButton!
    @IBOutlet var Button_8: UIButton!
    @IBOutlet var Button_9: UIButton!
    
    
    let brown = UIColor(named: "Dynamic_brown")
    let button = UIColor(named: "button")
    
    
    
    override func viewDidLoad() {
//        Button_1.layer.cornerRadius = 8
//        Button_1.clipsToBounds = true
        self.navigationController?.navigationBar.tintColor = button
        
        Button_1.setImage(UIImage(named: "test_1"), for: .normal)
        Button_2.setImage(UIImage(named: "test_2"), for: .normal)
        Button_3.setImage(UIImage(named: "test_3"), for: .normal)
        Button_4.setImage(UIImage(named: "test_4"), for: .normal)
        Button_5.setImage(UIImage(named: "test_5"), for: .normal)
        Button_6.setImage(UIImage(named: "test_6"), for: .normal)
        Button_7.setImage(UIImage(named: "test_7"), for: .normal)
        Button_8.setImage(UIImage(named: "test_8"), for: .normal)
        Button_9.setImage(UIImage(named: "test_9"), for: .normal)
        super.viewDidLoad()
        
    }

}
