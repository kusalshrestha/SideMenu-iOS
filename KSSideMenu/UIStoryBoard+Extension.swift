//
//  UIStoryBoard+Extension.swift
//  KSSideMenu
//
//  Created by Kusal Shrestha on 4/10/16.
//  Copyright © 2016 Kusal Shrestha. All rights reserved.
//

import Foundation
import UIKit

extension UIStoryboard {
    
    class func mainStoryBoard() -> UIStoryboard {
        return UIStoryboard(name: "Main", bundle: nil)
    }
    
    class func centerVC() -> ViewController? {
        return mainStoryBoard().instantiateViewControllerWithIdentifier("MainVC") as? ViewController
    }
    
    class func sideMenuVC() -> SideMenuViewController? {
        return mainStoryBoard().instantiateViewControllerWithIdentifier("SideMenuVC") as? SideMenuViewController
    }
    
    class func mainNavController() -> UINavigationController? {
        return mainStoryBoard().instantiateViewControllerWithIdentifier("MainNavController") as? UINavigationController
    }
    
}
