//
//  ViewController.swift
//  ofo
//
//  Created by xiaomo on 17/5/22.
//  Copyright © 2017年 xiaomo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // 左边的 barItem 样式 withRenderingMode设置为alwaysOriginal表示使用图片的本来颜色
        self.navigationItem.leftBarButtonItem?.image = #imageLiteral(resourceName: "leftTopImage").withRenderingMode(.alwaysOriginal)
        // 右边的 barItem 样式 withRenderingMode设置为alwaysOriginal表示使用图片的本来颜色
        self.navigationItem.rightBarButtonItem?.image = #imageLiteral(resourceName: "rightTopImage").withRenderingMode(.alwaysOriginal)
        // 中间的ofo Logo
        self.navigationItem.titleView = UIImageView(image: #imageLiteral(resourceName: "ofoLogo"))
        // 回退按钮的设置(从webview退回到上一个视图)
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

