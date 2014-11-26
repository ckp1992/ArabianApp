//
//  ViewController.swift
//  ArabianApp
//
//  Created by 陈鲲鹏 on 14/11/26.
//  Copyright (c) 2014年 陈鲲鹏. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var childArray : [UIViewController]!
    var curIndex : Int!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.hidden = true
        childArray = [UIViewController]()
        
        //初始化subview
        initSubViews()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func initSubViews(){
        if(childArray.count == 0){
            initChildViewControllers()
        }
    }
    
    func initChildViewControllers(){
        
        curIndex = 0
        
        //第一页 礼拜时间
        var worshipViewController : WorshipViewController = WorshipViewController(nibName: "WorshipViewController", bundle: nil)
        self.addChildViewController(worshipViewController)
        self.view.insertSubview(worshipViewController.view, atIndex: 0)
        childArray.append(worshipViewController)
        
        //第二页 礼拜朝向
        var worShipDirectionViewController : WorShipDirectionViewController = WorShipDirectionViewController(nibName: "WorShipDirectionViewController", bundle: nil)
        childArray.append(worShipDirectionViewController)
        
        //第三页 穆斯林故事
        var muslimStoryViewController : MuslimStoryViewController = MuslimStoryViewController(nibName: "MuslimStoryViewController", bundle: nil)
        childArray.append(muslimStoryViewController)
        
        //第四页 中国清真寺
        var mosqueViewController : MosqueViewController = MosqueViewController(nibName: "MosqueViewController", bundle: nil)
        childArray.append(mosqueViewController)
        
        //第五页 关于页
        var aboutViewController : AboutViewController = AboutViewController(nibName: "AboutViewController", bundle: nil)
        childArray.append(aboutViewController)
    }
    
    func addConstraintsToParent(#firstItem : UIView!){
        self.view.addConstraint(NSLayoutConstraint(
            item:firstItem,
            attribute: NSLayoutAttribute.Bottom,
            relatedBy: NSLayoutRelation.Equal,
            toItem: self.view,
            attribute: NSLayoutAttribute.Bottom,
            multiplier: 1.0,
            constant: 0)
        )
    }
    
    func switchController(#index : Int){
        var newController = childArray[index];
        var curController = childArray[curIndex]
        
        if(curController != newController){
            
            curController.removeFromParentViewController()
            curController.view .removeFromSuperview()
            
            self.addChildViewController(newController)
            self.view.insertSubview(newController.view, atIndex: 0)
            
            curIndex = index
        }
    }
    
    @IBAction func swichingControllers(sender: UIButton) {
        if(sender.titleLabel?.text == "礼拜时间"){
            switchController(index: 0)
        }
        if(sender.titleLabel?.text == "礼拜方向"){
            switchController(index: 1)
        }
        if(sender.titleLabel?.text == "穆斯林故事"){
            switchController(index: 2)
        }
        if(sender.titleLabel?.text == "中国清真寺"){
            switchController(index: 3)
        }
        if(sender.titleLabel?.text == "关于"){
            switchController(index: 4)
        }
    }
    
    
}

