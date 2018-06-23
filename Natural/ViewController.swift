//
//  ViewController.swift
//  Natural
//
//  Created by youngxkk on 2018/6/23.
//  Copyright © 2018 youngxkk. All rights reserved.
//

import UIKit
import PagingMenuController

private struct PagingMenuOptions: PagingMenuControllerCustomizable {
   
    private let Page11 = Page1()
    private let Page22 = Page2()
    
    //组件类型
    fileprivate var componentType: ComponentType {
        return .all(menuOptions: MenuOptions(), pagingControllers: pagingControllers)
    }

    //所有子视图控制器
    fileprivate var pagingControllers: [UIViewController] {
        return [Page11, Page22]
    }

    //菜单配置项
    fileprivate struct MenuOptions: MenuViewCustomizable {
    //菜单显示模式
        var displayMode: MenuDisplayMode {
                return .segmentedControl
        }
    //菜单项
        var itemsOptions: [MenuItemViewCustomizable] {
            return [MenuItem1(), MenuItem2()]
        }
    }

    //第1个菜单项
    fileprivate struct MenuItem1: MenuItemViewCustomizable {
    //自定义菜单项名称
        var displayMode: MenuItemDisplayMode {
            return .text(title: MenuItemText(text: "Beach"))
        }
    }

    //第2个菜单项
    fileprivate struct MenuItem2: MenuItemViewCustomizable {
    //自定义菜单项名称
        var displayMode: MenuItemDisplayMode {
            return .text(title: MenuItemText(text: "Night"))
        }
    }
}



class ViewController: UIViewController {

    //隐藏状态栏
    override var prefersStatusBarHidden: Bool{
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let options = PagingMenuOptions()
        let PagingMenuControllerl = PagingMenuController(options: options as PagingMenuControllerCustomizable)
        
//        PagingMenuController.view.frame.origin.y += 64
//        PagingMenuController.view.frame.size.height -= 64
//
        //建立父子关系
        addChildViewController(PagingMenuControllerl)
        //分页菜单控制器视图添加到当前视图中
        view.addSubview(PagingMenuControllerl.view)

        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

