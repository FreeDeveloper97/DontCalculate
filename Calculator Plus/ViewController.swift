//
//  ViewController.swift
//  Calculator Plus
//
//  Created by Min_MacBook Pro on 2020/03/10.
//  Copyright © 2020 FreeDeveloper. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var Button_normal: UIButton!
    @IBOutlet var View_1: UIView!
    @IBOutlet var View_2: UIView!
    @IBOutlet var View_3: UIView!
    @IBOutlet var View_4: UIView!
    @IBOutlet var View_5: UIView!
    @IBOutlet var View_6: UIView!
    @IBOutlet var View_7: UIView!
    @IBOutlet var View_8: UIView!
    
    let brown = UIColor(named: "Dynamic_brown")
    let button = UIColor(named: "Dynamic_button")
    
    
    
    override func viewDidLoad() {
        
        Button_normal.layer.cornerRadius = 8
//        Button_normal.layer.borderWidth = 2
//        Button_normal.layer.borderColor = brown?.cgColor

        View_1.layer.cornerRadius = 18
//        View_1.layer.borderWidth = 2
//        View_1.layer.borderColor = brown?.cgColor
//
        View_2.layer.cornerRadius = 18
//        View_2.layer.borderWidth = 2
//        View_2.layer.borderColor = brown?.cgColor
//
        View_3.layer.cornerRadius = 18
//        View_3.layer.borderWidth = 2
//        View_3.layer.borderColor = brown?.cgColor
//
        View_4.layer.cornerRadius = 18
//        View_4.layer.borderWidth = 2
//        View_4.layer.borderColor = brown?.cgColor
//
        View_5.layer.cornerRadius = 18
//        View_5.layer.borderWidth = 2
//        View_5.layer.borderColor = brown?.cgColor
//
        View_6.layer.cornerRadius = 18
//        View_6.layer.borderWidth = 2
//        View_6.layer.borderColor = brown?.cgColor
//
        View_7.layer.cornerRadius = 18
//        View_7.layer.borderWidth = 2
//        View_7.layer.borderColor = brown?.cgColor
//
        View_8.layer.cornerRadius = 18
//        View_8.layer.borderWidth = 2
//        View_8.layer.borderColor = brown?.cgColor
        
        //66, 119, 214
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        let activity_1_ViewController = segue.destination as! Activity_1_ViewController
//        if segue.identifier == "Button_1"
//        {
//
//        }
//    }


}
