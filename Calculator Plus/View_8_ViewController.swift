//
//  View_8_ViewController.swift
//  Calculator Plus
//
//  Created by Min_MacBook Pro on 2020/03/13.
//  Copyright © 2020 FreeDeveloper. All rights reserved.
//

import UIKit

class View_8_ViewController: UIViewController {

    @IBOutlet var View_8_1: UIView!
    @IBOutlet var View_8_2: UIView!
    
    let brown = UIColor(named: "Dynamic_brown")
    
    override func viewDidLoad() {
        
        View_8_1.layer.cornerRadius = 18
//        View_8_1.layer.borderWidth = 2
//        View_8_1.layer.borderColor = brown?.cgColor
        
        View_8_2.layer.cornerRadius = 18
//        View_8_2.layer.borderWidth = 2
//        View_8_2.layer.borderColor = brown?.cgColor
        
        
        super.viewDidLoad()
    }
    

    

}
