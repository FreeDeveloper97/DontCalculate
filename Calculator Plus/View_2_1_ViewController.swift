//
//  View_2_1_ViewController.swift
//  Calculator Plus
//
//  Created by Min_MacBook Pro on 2020/03/13.
//  Copyright © 2020 FreeDeveloper. All rights reserved.
//

import UIKit

class View_2_1_ViewController: UIViewController {
    
    @IBOutlet var View_A: UIView!
    
    
    
    override func viewDidLoad() {
        
        
        View_A.layer.cornerRadius = 18
        View_A.layer.borderWidth = 4
        View_A.layer.borderColor = UIColor(displayP3Red: 66/255, green: 119/255, blue: 214/255, alpha: 1).cgColor
        
        
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
