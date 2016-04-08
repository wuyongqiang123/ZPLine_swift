//
//  ViewController.swift
//  ZPLine
//
//  Created by wyq on 16/4/7.
//  Copyright © 2016年 wyq. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = UIColor.redColor()
        //测试headview
        let headView: UIView = UIView(frame: CGRectMake(100, 100, 100, 30))
        headView.backgroundColor = UIColor.whiteColor()
        self.view.addSubview(headView)
        //显示top方向的线，间距是15
        headView.showLineForDirection(.Top, leftPad: 15)
        //显示top方向的线
//        headView.showLineForDirection(.Top)
//        //显示left方向的线
//        headView.showLineForDirection(.Left)
//        //显示right方向的线
//        headView.showLineForDirection(.Right)
//        //显示bottom方向的线
//        headView.showLineForDirection(.Bottom)
//        //隐藏top方身的线
//        headView.hideLineForDirection(.Top)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

