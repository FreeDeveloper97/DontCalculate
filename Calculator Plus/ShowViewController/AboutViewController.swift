//
//  AboutViewController.swift
//  Calculator Plus
//
//  Created by Kang Minsang on 2021/01/24.
//  Copyright © 2021 FreeDeveloper. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {

    @IBOutlet var View_view: UIView!
    @IBOutlet var showText1: UILabel!
    @IBOutlet var showText2: UILabel!
    @IBOutlet var showText3: UILabel!
    
    @IBOutlet var showDetail: UILabel!
    @IBOutlet var buttons: UIView!
    @IBOutlet var sendFeedback: UIButton!
    @IBOutlet var showApps: UIButton!
    
    let BUTTON = UIColor(named: "button")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
        
        setAlpha()
        setRadius()
        viewAnimation()
        startAnimation()
    }
    @IBAction func sendFeedbackButton(_ sender: Any) {
        algoOfSendEmail()
    }
    @IBAction func showAppsButton(_ sender: Any) {
        algoOfShowApps()
    }
}



extension AboutViewController{
    
    func setAlpha() {
        self.showText1.alpha = 0
        self.showText2.alpha = 0
        self.showText3.alpha = 0
        self.showDetail.alpha = 0
        self.buttons.alpha = 0
    }
    
    func setRadius() {
        self.sendFeedback.layer.cornerRadius = 16
        self.showApps.layer.cornerRadius = 16
    }
    
    func viewAnimation() {
        self.View_view.alpha = 0
        UIView.animate(withDuration: 0.5, animations: {
            self.View_view.alpha = 1
        })
    }
    
    func startAnimation() {
        UIView.animate(withDuration: 0.5, delay: 1.0, options: .curveEaseIn, animations: {
            self.showText1.alpha = 1
        }, completion: nil)
        UIView.animate(withDuration: 0.5, delay: 2.0, options: .curveEaseIn, animations: {
            self.showText2.alpha = 1
        }, completion: nil)
        UIView.animate(withDuration: 0.5, delay: 3.0, options: .curveEaseIn, animations: {
            self.showText3.alpha = 1
        }, completion: nil)
        UIView.animate(withDuration: 0.5, delay: 4.0, options: .curveEaseIn, animations: {
            self.showDetail.alpha = 1
        }, completion: nil)
        UIView.animate(withDuration: 0.5, delay: 5.0, options: .curveEaseIn, animations: {
            self.buttons.alpha = 1
        }, completion: nil)
    }
    
    func setNavigationBar() {
        let attrs = [
            NSAttributedString.Key.font: UIFont(name: "HGGGothicssiP60g", size: 15)!
        ]
        navigationController?.navigationBar.titleTextAttributes = attrs as [NSAttributedString.Key : Any]
        navigationController?.navigationBar.barTintColor = BUTTON
        navigationController?.navigationBar.backgroundColor = BUTTON
        
        navigationController?.navigationBar.tintColor = UIColor.white
    }
    
    func algoOfSendEmail() {
        if let url = URL(string: "mailto:freedeveloper97@gmail.com") {
            UIApplication.shared.open(url, options: [:])
        }
    }
    
    func algoOfShowApps() {
        if let url = URL(string: "http://appstore.com/MinsangKang") {
            UIApplication.shared.open(url, options: [:])
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.navigationBar.barTintColor = UIColor.systemBackground
        navigationController?.navigationBar.backgroundColor = UIColor.systemBackground
        
        navigationController?.navigationBar.tintColor = BUTTON
    }
}
