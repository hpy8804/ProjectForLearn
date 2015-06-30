//
//  SwiftNotice.swift
//  SwiftNotice
//
//  Created by JohnLui on 15/4/15.
//  Copyright (c) 2015年 com.lvwenhan. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    func noticeTop(text: String) {
        SwiftNotice.noticeOnSatusBar(text, autoClear: true)
    }
    func noticeTop(text: String, autoClear: Bool) {
        SwiftNotice.noticeOnSatusBar(text, autoClear: autoClear)
    }
    func successNotice(text: String) {
        SwiftNotice.showNoticeWithText(NoticeType.success, text: text, autoClear: true)
    }
    func successNotice(text: String, autoClear: Bool) {
        SwiftNotice.showNoticeWithText(NoticeType.success, text: text, autoClear: autoClear)
    }
    func errorNotice(text: String) {
        SwiftNotice.showNoticeWithText(NoticeType.error, text: text, autoClear: true)
    }
    func errorNotice(text: String, autoClear: Bool) {
        SwiftNotice.showNoticeWithText(NoticeType.error, text: text, autoClear: autoClear)
    }
    func infoNotice(text: String) {
        SwiftNotice.showNoticeWithText(NoticeType.info, text: text, autoClear: true)
    }
    func infoNotice(text: String, autoClear: Bool) {
        SwiftNotice.showNoticeWithText(NoticeType.info, text: text, autoClear: autoClear)
    }
    func notice(text: String, type: NoticeType, autoClear: Bool) {
        SwiftNotice.showNoticeWithText(type, text: text, autoClear: autoClear)
    }
    func pleaseWait() {
        SwiftNotice.wait()
    }
    func noticeOnlyText(text: String) {
        SwiftNotice.showText(text ,autoClear :true)
    }
    func clearAllNotice() {
        SwiftNotice.clear()
    }
    func clearWaitNotice() {
        SwiftNotice.StopWait()
    }
}

enum NoticeType{
    case success
    case error
    case info
}

class SwiftNotice: NSObject {
    
    static var windows = Array<UIWindow!>()
    static let rv = UIApplication.sharedApplication().keyWindow?.subviews.first as! UIView
    
    static func clear() {
        for i in windows {
            //println(i)
            i.hidden = true
            //i.userInteractionEnabled  = true
        }
    }
    
    static func StopWait() {
        for i in windows {
            //消除等待
            if i.viewWithTag(1) != nil {
                i.hidden = true
                //break
            }
        }
    }


    
    static func noticeOnSatusBar(text: String, autoClear: Bool) {
        let frame = UIApplication.sharedApplication().statusBarFrame
        let window = UIWindow(frame: frame)
        let view = UIView(frame: frame)
        
        //事件穿透
        window.userInteractionEnabled = false
        view.userInteractionEnabled = false
        
        view.backgroundColor = UIColor(red: 0x6a/0x100, green: 0xb4/0x100, blue: 0x9f/0x100, alpha: 1)
        
        let label = UILabel(frame: frame)
        label.textAlignment = NSTextAlignment.Center
        label.font = UIFont.systemFontOfSize(12)
        label.textColor = UIColor.whiteColor()
        label.text = text
        view.addSubview(label)
        
        window.windowLevel = UIWindowLevelStatusBar
        window.hidden = false
        window.addSubview(view)
        windows.append(window)
        
        if autoClear {
            let selector = Selector("hideNotice:")
            self.performSelector(selector, withObject: view, afterDelay: 1)
        }
    }
    static func wait() {
        let frame = CGRectMake(0, 0, 78, 78)
        let window = UIWindow(frame: frame)
        let mainView = UIView(frame: frame)
        
        //事件穿透
        //frame.userInteractionEnabled = false
        window.userInteractionEnabled = false
        mainView.userInteractionEnabled = false
        
        mainView.layer.cornerRadius = 12
        mainView.backgroundColor = UIColor(red:0, green:0, blue:0, alpha: 0.8)
        
        let ai = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.WhiteLarge)
        ai.frame = CGRectMake(21, 21, 36, 36)
        ai.startAnimating()
        mainView.addSubview(ai)
        //设置等待的tag
        mainView.tag = 1
        
        window.windowLevel = UIWindowLevelAlert
        window.center = rv.center
        window.hidden = false
        window.addSubview(mainView)
        windows.append(window)
    }
    static func showText(text: String,autoClear:Bool) {

        let window = UIWindow()
        let mainView = UIView()
        mainView.layer.cornerRadius = 12
        //mainView.backgroundColor = UIColor(red:0, green:0, blue:0, alpha: 0.8)
        //mainView.backgroundColor = UIColor.redColor()
        

        
        
        //mainView.backgroundColor = UIColor.redColor()
        //事件穿透
        window.userInteractionEnabled = false
        mainView.userInteractionEnabled = false
        
        
        
        


        
        

        
        //增加背景图片
        var imageText = UIImageView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        imageText.contentMode = UIViewContentMode.ScaleToFill
        //更改图片名称即可
        imageText.image = UIImage(named: "xiaoxiBg.png")
        //图片大小
        var imgSizeW = imageText.image!.size.width
        var imgSizeH = imageText.image!.size.height
        
        //图片尺寸
        imageText.frame.size.width = imgSizeW
        imageText.frame.size.height = imgSizeH
        
        //let superFrame = CGRectMake(0, 0, label.frame.width + 50 , label.frame.height + 30)
        //let superFrame = CGRectMake(0, 0, label.frame.width + 50 , label.frame.height + 30)
        //父级视图宽高
        let superFrame = CGRectMake(0, 0, imgSizeW , imgSizeH)
        window.frame = superFrame
        mainView.frame = superFrame
        

        
        
        //自动换行
        let label = UILabel()
        label.text = text
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.ByWordWrapping
        label.frame.size.width = imgSizeW
        
        label.font = UIFont.systemFontOfSize(16)
        label.textAlignment = NSTextAlignment.Center
        label.textColor = UIColor.whiteColor()
        label.sizeToFit()
        
        //println("该图片的宽度是\(imgSizeW),高度是\(imgSizeH)")

        mainView.addSubview(imageText)
        mainView.addSubview(label)
        label.center = mainView.center

        
        
        
        window.windowLevel = UIWindowLevelAlert
        window.center = rv.center
        window.hidden = false
        window.addSubview(mainView)
        windows.append(window)
        
        if autoClear {
            let selector = Selector("hideNotice:")
            self.performSelector(selector, withObject: mainView, afterDelay: 1)
        }
    }
    

    
    static func showNoticeWithText(type: NoticeType,text: String, autoClear: Bool) {
        //let frame = CGRectMake(0, 0, 90, 90)
        let frame = CGRectMake(0, 0, 90, 90)
        let window = UIWindow(frame: frame)
        let mainView = UIView(frame: frame)
        
        //事件穿透
        window.userInteractionEnabled = false
        mainView.userInteractionEnabled = false
        
        mainView.layer.cornerRadius = 10
        mainView.backgroundColor = UIColor(red:0, green:0, blue:0, alpha: 0.7)
        
        var image = UIImage()
        switch type {
        case .success:
            image = SwiftNoticeSDK.imageOfCheckmark
        case .error:
            image = SwiftNoticeSDK.imageOfCross
        case .info:
            image = SwiftNoticeSDK.imageOfInfo
        default:
            break
        }
        
        let checkmarkView = UIImageView(image: image)
        //println(checkmarkView)
        checkmarkView.frame = CGRectMake(27, 15, 36, 36)
        mainView.addSubview(checkmarkView)
        
        let label = UILabel(frame: CGRectMake(0, 60, 90, 16))
        label.font = UIFont.systemFontOfSize(13)
        label.textColor = UIColor.whiteColor()
        label.text = text
        label.textAlignment = NSTextAlignment.Center
        //label.sizeToFit()
        mainView.addSubview(label)

        window.windowLevel = UIWindowLevelAlert
        window.center = rv.center
        window.hidden = false
        window.addSubview(mainView)
        windows.append(window)
        

        if autoClear {
            let selector = Selector("hideNotice:")
            self.performSelector(selector, withObject: mainView, afterDelay: 3)
        }
    }
    
    static func hideNotice(sender: AnyObject) {
        if sender is UIView {
            sender.removeFromSuperview()
            //sender.hidden = true
            //println(sender)
            //sender as UIView.userInteractionEnabled = false
        }
    }
}

class SwiftNoticeSDK {
    struct Cache {
        static var imageOfCheckmark: UIImage?
        static var imageOfCross: UIImage?
        static var imageOfInfo: UIImage?
    }
    class func draw(type: NoticeType) {
        var checkmarkShapePath = UIBezierPath()
        
        // draw circle
        checkmarkShapePath.moveToPoint(CGPointMake(36, 18))
        checkmarkShapePath.addArcWithCenter(CGPointMake(18, 18), radius: 17.5, startAngle: 0, endAngle: CGFloat(M_PI*2), clockwise: true)
        checkmarkShapePath.closePath()
        
        switch type {
        case .success: // draw checkmark
            checkmarkShapePath.moveToPoint(CGPointMake(10, 18))
            checkmarkShapePath.addLineToPoint(CGPointMake(16, 24))
            checkmarkShapePath.addLineToPoint(CGPointMake(27, 13))
            checkmarkShapePath.moveToPoint(CGPointMake(10, 18))
            checkmarkShapePath.closePath()
        case .error: // draw X
            checkmarkShapePath.moveToPoint(CGPointMake(10, 10))
            checkmarkShapePath.addLineToPoint(CGPointMake(26, 26))
            checkmarkShapePath.moveToPoint(CGPointMake(10, 26))
            checkmarkShapePath.addLineToPoint(CGPointMake(26, 10))
            checkmarkShapePath.moveToPoint(CGPointMake(10, 10))
            checkmarkShapePath.closePath()
        case .info:
            checkmarkShapePath.moveToPoint(CGPointMake(18, 6))
            checkmarkShapePath.addLineToPoint(CGPointMake(18, 22))
            checkmarkShapePath.moveToPoint(CGPointMake(18, 6))
            checkmarkShapePath.closePath()
            
            UIColor.whiteColor().setStroke()
            checkmarkShapePath.stroke()
            
            var checkmarkShapePath = UIBezierPath()
            checkmarkShapePath.moveToPoint(CGPointMake(18, 27))
            checkmarkShapePath.addArcWithCenter(CGPointMake(18, 27), radius: 1, startAngle: 0, endAngle: CGFloat(M_PI*2), clockwise: true)
            checkmarkShapePath.closePath()
            
            UIColor.whiteColor().setFill()
            checkmarkShapePath.fill()
        default:
            break
        }
        
        UIColor.whiteColor().setStroke()
        checkmarkShapePath.stroke()
    }
    class var imageOfCheckmark: UIImage {
        if (Cache.imageOfCheckmark != nil) {
            return Cache.imageOfCheckmark!
        }
        UIGraphicsBeginImageContextWithOptions(CGSizeMake(36, 36), false, 0)
        
        SwiftNoticeSDK.draw(NoticeType.success)
        
        Cache.imageOfCheckmark = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return Cache.imageOfCheckmark!
    }
    class var imageOfCross: UIImage {
        if (Cache.imageOfCross != nil) {
            return Cache.imageOfCross!
        }
        UIGraphicsBeginImageContextWithOptions(CGSizeMake(36, 36), false, 0)
        
        SwiftNoticeSDK.draw(NoticeType.error)
        
        Cache.imageOfCross = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return Cache.imageOfCross!
    }
    class var imageOfInfo: UIImage {
        if (Cache.imageOfInfo != nil) {
            return Cache.imageOfInfo!
        }
        UIGraphicsBeginImageContextWithOptions(CGSizeMake(36, 36), false, 0)
        
        SwiftNoticeSDK.draw(NoticeType.info)
        
        Cache.imageOfInfo = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return Cache.imageOfInfo!
    }
}
