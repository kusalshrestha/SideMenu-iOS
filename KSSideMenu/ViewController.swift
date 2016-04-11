//
//  ViewController.swift
//  KSSideMenu
//
//  Created by Kusal Shrestha on 4/10/16.
//  Copyright © 2016 Kusal Shrestha. All rights reserved.
//

import UIKit

protocol centerVCDelegate: NSObjectProtocol {
    func sideMenuButtonAction()
}

class ViewController: UIViewController {

    weak var delegate: centerVCDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func rightBarButton(sender: UIBarButtonItem) {
        delegate?.sideMenuButtonAction()
    }
    

}

