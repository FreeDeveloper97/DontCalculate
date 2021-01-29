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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
        setTransform()
        setAlpha()
        
        showAnimation()
    }
    
    @IBAction func buttonCalClick(_ sender: Any) {
        goToViewController(where: "CalculaterViewController")
    }
    @IBAction func button2Click(_ sender: Any) {
        goToViewController(where: "Select2ViewController")
    }
    @IBAction func button3Click(_ sender: Any) {
        goToViewController(where: "Select3ViewController")
    }
    @IBAction func button4Click(_ sender: Any) {
        goToViewController(where: "Select4ViewController")
    }
    @IBAction func button5Click(_ sender: Any) {
        goToViewController(where: "Select5ViewController")
    }
    @IBAction func button6Click(_ sender: Any) {
        goToViewController(where: "Select6ViewController")
    }
    @IBAction func button7Click(_ sender: Any) {
        goToViewController(where: "Show7ViewController")
    }
    @IBAction func button8Click(_ sender: Any) {
        goToViewController(where: "Select8ViewController")
    }
    @IBAction func button9Click(_ sender: Any) {
        goToViewController(where: "Select9ViewController")
    }
}



extension MainViewController {
    func setNavigationBar() {
        let attrs = [
            NSAttributedString.Key.font: UIFont(name: "HGGGothicssiP60g", size: 15)!
        ]
        navigationController?.navigationBar.titleTextAttributes = attrs as [NSAttributedString.Key : Any]
        navigationController?.navigationBar.barTintColor = UIColor.systemBackground
        navigationController?.navigationBar.backgroundColor = UIColor.systemBackground
        
        self.view?.tintColor = BUTTON
    }
    
    func setAlpha() {
        self.Button_1.alpha = 0
        self.Button_2.alpha = 0
        self.Button_3.alpha = 0
        self.Button_4.alpha = 0
        self.Button_5.alpha = 0
        self.Button_6.alpha = 0
        self.Button_7.alpha = 0
        self.Button_8.alpha = 0
        self.Button_9.alpha = 0
    }
    
    func setTransform() {
        self.Button_1.transform = CGAffineTransform(translationX: 0, y: -20)
        self.Button_2.transform = CGAffineTransform(translationX: 0, y: -20)
        self.Button_3.transform = CGAffineTransform(translationX: 0, y: -20)
        self.Button_4.transform = CGAffineTransform(translationX: 0, y: -20)
        self.Button_5.transform = CGAffineTransform(translationX: 0, y: -20)
        self.Button_6.transform = CGAffineTransform(translationX: 0, y: -20)
        self.Button_7.transform = CGAffineTransform(translationX: 0, y: -20)
        self.Button_8.transform = CGAffineTransform(translationX: 0, y: -20)
        self.Button_9.transform = CGAffineTransform(translationX: 0, y: -20)
    }
    
    func showAnimation() {
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
    }
    
    func goToViewController(where: String) {
        let pushVC = self.storyboard?.instantiateViewController(withIdentifier: `where`)
        self.navigationController?.pushViewController(pushVC!, animated: true)
    }
}
