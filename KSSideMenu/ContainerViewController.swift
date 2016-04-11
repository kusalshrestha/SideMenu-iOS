//
//  ContainerViewController.swift
//  KSSideMenu
//
//  Created by Kusal Shrestha on 4/10/16.
//  Copyright © 2016 Kusal Shrestha. All rights reserved.
//

import UIKit

class ContainerViewController: UIViewController {

    var centerVC: ViewController!
    var sideMenuVC: SideMenuViewController?
    var mainNavController: UINavigationController!
    var isMenuOpen = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        mainNavController = UIStoryboard.mainNavController()
        view.addSubview(mainNavController.view)
        self.addChildViewController(mainNavController)
        mainNavController.didMoveToParentViewController(self)
        
        centerVC = mainNavController.topViewController as! ViewController
        centerVC.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

extension ContainerViewController: centerVCDelegate {
   
    func sideMenuButtonAction() {
        isMenuOpen = !isMenuOpen
        
        if isMenuOpen {
            addSideMenuVC()
        }
        animateSideMenu(menuState: isMenuOpen)
    }
    
    private func addSideMenuVC() {
        if sideMenuVC == nil {
            if let sideVC = UIStoryboard.sideMenuVC() {
                sideMenuVC = sideVC
                view.insertSubview(sideVC.view, atIndex: 0)
                addChildViewController(sideVC)
                sideVC.didMoveToParentViewController(self)
            }
        }
    }
    
    private func animateSideMenu(menuState isOpen: Bool) {
        var offSet: CGFloat!
        if isOpen {
            offSet = self.mainNavController.view.center.x - 200
            mainNavController.view.layer.shadowOpacity = 0.8
            animateOffSet(offSet, completionHandler: nil)
        } else {
            offSet = self.mainNavController.view.center.x + 200
            mainNavController.view.layer.shadowOpacity = 0
            animateOffSet(offSet, completionHandler: { (completed) -> Void in
                self.sideMenuVC?.removeFromParentViewController()
                self.sideMenuVC = nil
            })
        }
        
    }
    
    private func animateOffSet(toPosition: CGFloat, completionHandler: ((Bool) -> Void)?) {
        UIView.animateWithDuration(0.2, animations: { _ in
            // animation code goes here
            self.mainNavController.view.center.x = toPosition
            }, completion: completionHandler)
    }
    
}
