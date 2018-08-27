//
//  ZPLine.swift
//  ZPLine
//
//  Created by wyq on 16/4/7.
//  Copyright © 2016年 wyq. All rights reserved.
//

import UIKit

enum ZPDirection : Int {
    case Top
    case Bottom
    case Left
    case Right
}

struct ZPPading {
    var left : CGFloat
    var right : CGFloat
    var top : CGFloat
    var bottom : CGFloat
};

let ZPLineTopTag: Int = 23333 + 1
let ZPLineBottomTag: Int = 23333 + 2
let ZPLineLeftTag: Int = 23333 + 3
let ZPLineRightTag: Int = 23333 + 4


extension UIView{

    ///显示某个方向的线（上下左右）
    func showLineForHorizontalWithLeftPad(pad: CGFloat) {
        showLineForDirection(direction: .Top, pading: ZPPading(left: pad, right: 0, top: 0, bottom: 0))
        showLineForDirection(direction: .Bottom, pading: ZPPading(left: pad, right: 0, top: 0, bottom: 0))
    }
    ///显示某个方向的线，间距是padding
    func showLineForDirection(direction: ZPDirection, leftPad pad: CGFloat) {
        showLineForDirection(direction: direction, pading: ZPPading(left: pad, right: 0, top: 0, bottom: 0))
    }
    ///显示某方向的线和左边间距（一般是上下线）
    func showLineForDirection(direction: ZPDirection) {
        self.showLineForDirection(direction: direction, pading: ZPPading(left: 0, right: 0, top: 0, bottom: 0))
    }
    ///显示上下线和左边间距
    func showLineForDirection(direction: ZPDirection, pading: ZPPading) {
        //线条的高度
        let onePx: CGFloat = 1
            //1 / min(UIScreen.mainScreen().scale, 2.0)

        //初始化
        let line: ZPLine = ZPLine()
        //根据枚举类型获取tag值
        line.tag = self.lineTagWithDirection(direction: direction)
        switch direction {
        case .Top:
            line.autoresizingMask = [.flexibleWidth, .flexibleBottomMargin]
        case .Bottom:
            line.autoresizingMask = [.flexibleWidth, .flexibleTopMargin]
        case .Left:
            line.autoresizingMask = [.flexibleHeight, .flexibleRightMargin]
        case .Right:
            line.autoresizingMask = [.flexibleHeight, .flexibleLeftMargin]
        }

        self.addSubview(line)
        self.bringSubview(toFront: line)

        //更新位置
        switch direction {
        case .Top:
            line.frame = CGRect.init(x: 0.0, y: 0.0, width: self.frame.width, height: onePx)
        case .Bottom:
            line.frame = CGRect.init(x: 0.0, y: self.frame.height - onePx, width: self.frame.width, height: onePx)
        case .Left:
            line.frame = CGRect.init(x: 0.0, y: 0.0, width: onePx, height: self.frame.height)
        case .Right:
            line.frame = CGRect.init(x: self.frame.width - onePx, y: 0.0, width: onePx, height: self.frame.height)
        }

        let p: CGPoint = line.frame.origin
        let s: CGSize = line.frame.size
        line.frame = CGRect.init(x: p.x + pading.left, y: p.y + pading.top, width: s.width - pading.left - pading.right, height: s.height - pading.top - pading.bottom)
    }

    ///显示垂直的线，也就是左右
    func showLineForVertical() {
        self.showLineForDirection(direction: .Left)
        self.showLineForDirection(direction: .Right)
    }
    ///显示水平的线，也就是上下
    func showLineForHorizontal() {
        self.showLineForDirection(direction: .Top)
        self.showLineForDirection(direction: .Bottom)
    }
    ///隐藏某个方向的线
    func hideLineForDirection(direction: ZPDirection) {
        let line: ZPLine = self.lineWithDirection(direction: direction)
        line.isHidden = true

    }
    ///隐藏垂直（左右）的线
    func hideLineForVertical() {
        self.hideLineForDirection(direction: .Left)
        self.hideLineForDirection(direction: .Right)
    }
    ///隐藏水平（上下）的线
    func hideLineForHorizontal() {
        self.hideLineForDirection(direction: .Top)
        self.hideLineForDirection(direction: .Bottom)
    }
    ///获取某个方向的线
    func lineWithDirection(direction: ZPDirection) -> ZPLine {
        return (self.viewWithTag(self.lineTagWithDirection(direction: direction)) as! ZPLine)
    }
    //获取tap值
    func lineTagWithDirection(direction: ZPDirection) -> Int {
        switch direction {
        case .Top:
            return ZPLineTopTag
        case .Bottom:
            return ZPLineBottomTag
        case .Left:
            return ZPLineLeftTag
        case .Right:
            return ZPLineRightTag
        }
    }


}

class ZPLine: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        //线的颜色(颜色可自己修改)
        self.backgroundColor = UIColor.red
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}



