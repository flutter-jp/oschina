//
//  WebViewController.swift
//  ofo
//
//  Created by xiaomo on 17/5/22.
//  Copyright © 2017年 xiaomo. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController {
    
    var webView : WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "热门活动"
        // 创建一个webView到视图中
        webView = WKWebView(frame: self.view.frame)
        self.view.addSubview(webView!)
        
        // 给webView设置
        let url = URL(string: "http://m.ofo.so/active.html")
        let request = URLRequest(url: url!)
        webView.load(request)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
