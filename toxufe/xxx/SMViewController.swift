//
//  SMViewController.swift
//  jdzmyy
//
//  Created by txf on 15/5/8.
//  Copyright (c) 2015年 jdzmyy. All rights reserved.
//

import UIKit

class SMViewController: UIViewController,UITextFieldDelegate {
    //实名认证参数
    
    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var idcard: UILabel!
    @IBOutlet weak var ylid: UILabel!
    @IBOutlet weak var phone: UILabel!
    @IBOutlet weak var xiaoqu: UILabel!
    
    @IBAction func pickViewShow(sender: UITextField) {
        //xiaoquPickerView.hidden = false
    }

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //设置右侧按钮字体
        let titlerFontRig  = UIFont(name: "Microsoft yahei", size: 16.0)
        navigationItem.rightBarButtonItem?.setTitleTextAttributes([NSFontAttributeName: titlerFontRig!], forState: UIControlState.Normal)

        //设置导航标题字体
        let titlerFont  = UIFont(name: "Microsoft yahei", size: 19.0)
        let titlerColor = UIColor(red: 153/255, green: 153/255, blue: 153/255, alpha: 1.0)
        let navigationTitleAttribute : NSDictionary = NSDictionary(objectsAndKeys: titlerFont!,NSFontAttributeName,titlerColor,NSForegroundColorAttributeName)
        
        
        self.navigationController?.navigationBar.titleTextAttributes = navigationTitleAttribute as [NSObject : AnyObject]
        
        /////////////////////////////////////////////////////////////////////
        //实名认证标签
        let labetFont  = UIFont(name: "Microsoft yahei", size: 16.0)
        username.font = labetFont
        idcard.font = labetFont
        ylid.font = labetFont
        phone.font = labetFont
        xiaoqu.font = labetFont
        
        
    }
    //返回上一页
    @IBAction func smFanhui(sender: UIBarButtonItem) {
        self.navigationController!.popViewControllerAnimated(true);
    }
    

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /////////////////////////////////////////////////////////////////////
    //textfield委托方法的实现
    //当用户按下return键或者按回车键，keyboard消失
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        //取消键盘第一响应事件
        textField.resignFirstResponder()
        //键盘遮挡 动画效果
        UIView.animateWithDuration(0.4, animations: {
            self.view.frame.origin.y = 0
        })
   
        //view.frame.origin.y = 0
        return true
    }
    
    //百度键盘最小化
    func textFieldShouldEndEditing(textField: UITextField) -> Bool {
        //键盘遮挡 动画效果
        UIView.animateWithDuration(0.4, animations: {
            self.view.frame.origin.y = 0
        })
        return true
    }
    
    //开始编辑输入框的时候，软键盘出现，执行此事件
    func textFieldDidBeginEditing(textField: UITextField) {
        //println(textField.tag)
        if textField.tag == 1 {
            //键盘遮挡 动画效果
            UIView.animateWithDuration(0.4, animations: {
                self.view.frame.origin.y = -100
            })
        } else if textField.tag == 2 {
            UIView.animateWithDuration(0.4, animations: {
                self.view.frame.origin.y = 0
            })
        }
    }
    
    
    
    
   
    


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
