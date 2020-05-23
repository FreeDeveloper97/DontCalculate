//
//  Activity_1_ViewController.swift
//  Calculator Plus
//
//  Created by Min_MacBook Pro on 2020/03/12.
//  Copyright © 2020 FreeDeveloper. All rights reserved.
//

import UIKit

class View_1_ViewController: UIViewController {
    
    @IBOutlet var view_test: UIView!
    @IBOutlet var view_test_2: UIView!
    
    let brown = UIColor(named: "Dynamic_brown")
    
    
    override func viewDidLoad() {
        
        view_test.layer.cornerRadius = 18
//        view_test.layer.borderWidth = 2
//        view_test.layer.borderColor = brown?.cgColor
//
        view_test_2.layer.cornerRadius = 18
//        view_test_2.layer.borderWidth = 2
//        view_test_2.layer.borderColor = brown?.cgColor

        
        
        

        
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
