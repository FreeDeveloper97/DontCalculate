//
//  ViewController.swift
//  Calculator Plus
//
//  Created by Min_MacBook Pro on 2020/03/10.
//  Copyright © 2020 FreeDeveloper. All rights reserved.
//


import UIKit

class MainViewController: UIViewController {

    @IBOutlet var Button_1: UIButton!
    @IBOutlet var Button_2: UIButton!
    @IBOutlet var Button_3: UIButton!
    @IBOutlet var Button_4: UIButton!
    @IBOutlet var Button_5: UIButton!
    @IBOutlet var Button_6: UIButton!
    @IBOutlet var Button_7: UIButton!
    @IBOutlet var Button_8: UIButton!
    @IBOutlet var Button_9: UIButton!
    
    let GRAY = UIColor(named: "ColorGray")
    let BUTTON = UIColor(named: "button")
    
    let attrs = [
//        NSAttributedString.Key.foregroundColor: UIColor(named: "button"),
        NSAttributedString.Key.font: UIFont(name: "HGGGothicssiP60g", size: 15)!
    ]
    
    override func viewDidLoad() {
        navigationController?.navigationBar.titleTextAttributes = attrs as [NSAttributedString.Key : Any]
        navigationController?.navigationBar.barTintColor = UIColor.systemBackground
        navigationController?.navigationBar.backgroundColor = UIColor.systemBackground
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
        

        UIView.animate(withDuration: 0.5, animations: {
            self.Button_1.alpha = 1
            self.Button_1.transform = CGAffineTransform(translationX: 0, y: 0)
        })
        UIView.animate(withDuration: 0.6, animations: {
            self.Button_2.alpha = 1
            self.Button_2.transform = CGAffineTransform(translationX: 0, y: 0)
        })
        UIView.animate(withDuration: 0.7, animations: {
            self.Button_3.alpha = 1
            self.Button_3.transform = CGAffineTransform(translationX: 0, y: 0)
        })
        UIView.animate(withDuration: 0.8, animations: {
            self.Button_4.alpha = 1
            self.Button_4.transform = CGAffineTransform(translationX: 0, y: 0)
        })
        UIView.animate(withDuration: 0.9, animations: {
            self.Button_5.alpha = 1
            self.Button_5.transform = CGAffineTransform(translationX: 0, y: 0)
        })
        UIView.animate(withDuration: 1.0, animations: {
            self.Button_6.alpha = 1
            self.Button_6.transform = CGAffineTransform(translationX: 0, y: 0)
        })
        UIView.animate(withDuration: 1.1, animations: {
            self.Button_7.alpha = 1
            self.Button_7.transform = CGAffineTransform(translationX: 0, y: 0)
        })
        UIView.animate(withDuration: 1.2, animations: {
            self.Button_8.alpha = 1
            self.Button_8.transform = CGAffineTransform(translationX: 0, y: 0)
        })
        UIView.animate(withDuration: 1.3, animations: {
            self.Button_9.alpha = 1
            self.Button_9.transform = CGAffineTransform(translationX: 0, y: 0)
        })
        super.viewDidLoad()
        
    }

    @IBAction func button2Click(_ sender: Any) {
        let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "Select2ViewController")
                self.navigationController?.pushViewController(pushVC!, animated: true)
    }
}
