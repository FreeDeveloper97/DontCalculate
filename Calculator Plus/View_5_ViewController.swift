//
//  View_5_ViewController.swift
//  Calculator Plus
//
//  Created by Min_MacBook Pro on 2020/04/08.
//  Copyright © 2020 FreeDeveloper. All rights reserved.
//

import UIKit

class View_5_ViewController: UIViewController {
    
    @IBOutlet var View_1: UIView!
    @IBOutlet var View_2: UIView!
    
    let brown = UIColor(named: "Dynamic_brown")
    
    override func viewDidLoad() {
        
        View_1.layer.cornerRadius = 18
//        View_1.layer.borderWidth = 2
//        View_1.layer.borderColor = brown?.cgColor
        
        View_2.layer.cornerRadius = 18
//        View_2.layer.borderWidth = 2
//        View_2.layer.borderColor = brown?.cgColor
        
        super.viewDidLoad()

        
    }

}
