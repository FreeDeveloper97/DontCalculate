//
//  View_7_ViewController.swift
//  Calculator Plus
//
//  Created by Min_MacBook Pro on 2020/04/02.
//  Copyright © 2020 FreeDeveloper. All rights reserved.
//

import UIKit

class View_7_ViewController: UIViewController {
    
    @IBOutlet var View_7_1: UIView!
    @IBOutlet var View_7_2: UIView!
    
    let brown = UIColor(named: "Dynamic_brown")
    
    override func viewDidLoad() {
        
        View_7_1.layer.cornerRadius = 18
//        View_7_1.layer.borderWidth = 2
//        View_7_1.layer.borderColor = brown?.cgColor
        
        View_7_2.layer.cornerRadius = 18
//        View_7_2.layer.borderWidth = 2
//        View_7_2.layer.borderColor = brown?.cgColor
        
        
        super.viewDidLoad()
    }

}
