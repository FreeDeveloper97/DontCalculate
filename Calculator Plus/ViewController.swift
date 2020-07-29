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
//        self.navigationController?.navigationBar.tintColor = button
        self.Button_1.transform = CGAffineTransform(translationX: 0, y: -20)
        self.Button_2.transform = CGAffineTransform(translationX: 0, y: -20)
        self.Button_3.transform = CGAffineTransform(translationX: 0, y: -20)
        self.Button_4.transform = CGAffineTransform(translationX: 0, y: -20)
        self.Button_5.transform = CGAffineTransform(translationX: 0, y: -20)
        self.Button_6.transform = CGAffineTransform(translationX: 0, y: -20)
        self.Button_7.transform = CGAffineTransform(translationX: 0, y: -20)
        self.Button_8.transform = CGAffineTransform(translationX: 0, y: -20)
        self.Button_9.transform = CGAffineTransform(translationX: 0, y: -20)
        
        self.Button_1.alpha = 0
        self.Button_2.alpha = 0
        self.Button_3.alpha = 0
        self.Button_4.alpha = 0
        self.Button_5.alpha = 0
        self.Button_6.alpha = 0
        self.Button_7.alpha = 0
        self.Button_8.alpha = 0
        self.Button_9.alpha = 0
        
        Button_1.setImage(UIImage(named: "test_1"), for: .normal)
        Button_2.setImage(UIImage(named: "test_2"), for: .normal)
        Button_3.setImage(UIImage(named: "test_3"), for: .normal)
        Button_4.setImage(UIImage(named: "test_4"), for: .normal)
        Button_5.setImage(UIImage(named: "test_5"), for: .normal)
        Button_6.setImage(UIImage(named: "test_6"), for: .normal)
        Button_7.setImage(UIImage(named: "test_7"), for: .normal)
        Button_8.setImage(UIImage(named: "test_8"), for: .normal)
        Button_9.setImage(UIImage(named: "test_9"), for: .normal)
        
        UIView.animate(withDuration: 0.5, animations: {
            self.Button_1.alpha = 1
            self.Button_1.transform = CGAffineTransform(translationX: 0, y: 0)
        })
        UIView.animate(withDuration: 0.55, animations: {
            self.Button_2.alpha = 1
            self.Button_2.transform = CGAffineTransform(translationX: 0, y: 0)
        })
        UIView.animate(withDuration: 0.6, animations: {
            self.Button_3.alpha = 1
            self.Button_3.transform = CGAffineTransform(translationX: 0, y: 0)
        })
        UIView.animate(withDuration: 0.65, animations: {
            self.Button_4.alpha = 1
            self.Button_4.transform = CGAffineTransform(translationX: 0, y: 0)
        })
        UIView.animate(withDuration: 0.7, animations: {
            self.Button_5.alpha = 1
            self.Button_5.transform = CGAffineTransform(translationX: 0, y: 0)
        })
        UIView.animate(withDuration: 0.75, animations: {
            self.Button_6.alpha = 1
            self.Button_6.transform = CGAffineTransform(translationX: 0, y: 0)
        })
        UIView.animate(withDuration: 0.8, animations: {
            self.Button_7.alpha = 1
            self.Button_7.transform = CGAffineTransform(translationX: 0, y: 0)
        })
        UIView.animate(withDuration: 0.85, animations: {
            self.Button_8.alpha = 1
            self.Button_8.transform = CGAffineTransform(translationX: 0, y: 0)
        })
        UIView.animate(withDuration: 0.9, animations: {
            self.Button_9.alpha = 1
            self.Button_9.transform = CGAffineTransform(translationX: 0, y: 0)
        })
        super.viewDidLoad()
        
    }

}
