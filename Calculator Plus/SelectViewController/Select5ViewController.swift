//
//  View_4_ViewController.swift
//  Calculator Plus
//
//  Created by Min_MacBook Pro on 2020/03/13.
//  Copyright © 2020 FreeDeveloper. All rights reserved.
//

import UIKit

class Select5ViewController: UIViewController {

    @IBOutlet weak var Button_1: UIButton!
    @IBOutlet weak var Button_2: UIButton!
    @IBOutlet weak var Button_3: UIButton!
    
    override func viewDidLoad() {
        setRadius()
        setAlpha()
        showAnimation()
        super.viewDidLoad()
    }
    
    @IBAction func showVC1(_ sender: Any) {
        goToViewController(where: "Show5_1ViewController")
    }
    @IBAction func showVC2(_ sender: Any) {
        goToViewController(where: "Show5_2ViewController")
    }
    @IBAction func showVC3(_ sender: Any) {
        goToViewController(where: "Show5_3ViewController")
    }
}



extension Select5ViewController {
    func setRadius() {
        Button_1.layer.cornerRadius = 4
        Button_1.clipsToBounds = true
        Button_2.layer.cornerRadius = 4
        Button_2.clipsToBounds = true
        Button_3.layer.cornerRadius = 4
        Button_3.clipsToBounds = true
    }
    
    func setAlpha() {
        Button_1.alpha = 0
        Button_2.alpha = 0
        Button_3.alpha = 0
    }
    
    func showAnimation() {
        UIView.animate(withDuration: 0.4, animations: {
            self.Button_1.alpha = 1
        })
        UIView.animate(withDuration: 0.5, animations: {
            self.Button_2.alpha = 1
        })
        UIView.animate(withDuration: 0.6, animations: {
            self.Button_3.alpha = 1
        })
    }
    
    func goToViewController(where: String) {
        let pushVC = self.storyboard?.instantiateViewController(withIdentifier: `where`)
        self.navigationController?.pushViewController(pushVC!, animated: true)
    }
}
