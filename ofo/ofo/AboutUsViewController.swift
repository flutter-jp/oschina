//
//  AboutUsViewController.swift
//  ofo
//
//  Created by xiaomo on 17/5/22.
//  Copyright © 2017年 xiaomo. All rights reserved.
//

import UIKit
import SWRevealViewController

class AboutUsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        if let revalVC = revealViewController() {
            revalVC.rearViewRevealWidth = 280
            self.navigationItem.leftBarButtonItem?.target = revalVC
            self.navigationItem.leftBarButtonItem?.action = #selector(SWRevealViewController.revealToggle(_:))
            view.addGestureRecognizer(revalVC.panGestureRecognizer())
        }
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
