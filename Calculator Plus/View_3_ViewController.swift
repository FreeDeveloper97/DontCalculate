//
//  View_3_ViewController.swift
//  Calculator Plus
//
//  Created by Min_MacBook Pro on 2020/03/13.
//  Copyright © 2020 FreeDeveloper. All rights reserved.
//

import UIKit

class View_3_ViewController: UIViewController {

    @IBOutlet var View_3_1: UIView!
    @IBOutlet var View_3_2: UIView!
    
    let brown = UIColor(named: "Dynamic_brown")
    
    override func viewDidLoad() {
        
        View_3_1.layer.cornerRadius = 18
//        View_3_1.layer.borderWidth = 2
//        View_3_1.layer.borderColor = brown?.cgColor
        
        View_3_2.layer.cornerRadius = 18
//        View_3_2.layer.borderWidth = 2
//        View_3_2.layer.borderColor = brown?.cgColor
        
        
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
