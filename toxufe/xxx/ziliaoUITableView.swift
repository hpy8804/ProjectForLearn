//
//  ziliaoUITableView.swift
//  xxx
//
//  Created by txf on 15/5/27.
//  Copyright (c) 2015年 jdzmyy. All rights reserved.
//

import UIKit

class ziliaoUITableView: UITableView ,UITableViewDataSource,UITableViewDelegate{
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.dataSource = self
        self.delegate   = self
        
        
    }
    
    
    
    //返回单元格的高
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat{
        return 130
    }
    
    //返回section
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    //返回每个section的数量
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    //填充表格数据源
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    
        //自定义单元格样式
        var cellid = "cell"
        var cell:UITableViewCell? = tableView.dequeueReusableCellWithIdentifier(cellid) as? UITableViewCell
    
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: cellid)
        }
    
        var labelO = cell?.viewWithTag(1) as! UILabel
        //var button1 = cell?.viewWithTag(5) as! UIButton
        
        let titlerFontRig  = returnFont(18.0)
        labelO.font = titlerFontRig
        labelO.tintColor = UIColor(red: 102/255, green: 102/255, blue: 102/255, alpha: 1)
        var touxing = cell?.viewWithTag(2) as! UIImageView
        
        var zhphoto = "zhphoto"
        if zhphoto != "" {
            touxing.image = UIImage(named: "zhphoto")
            //println(UIImage(named: "zhphoto"))
        }

        touxing.contentMode = UIViewContentMode.ScaleAspectFit
        
        //button1.setTitle("custom", forState: UIControlState.Application)
        //生成Button
        var button2 =  addBtn_Yuye(labelO)
        self.addSubview(button2)
        
        
        
//        //设置按钮
//        //不知道
//        button1.layer.masksToBounds = false
//        //边框宽度
//        button1.layer.borderWidth = 1
//        //圆角
//        button1.layer.cornerRadius = 5.0
//        //边框颜色
//        //let color1 = UIColor(red: 160/255, green: 160/255, blue: 160/255, alpha: 1).CGColor as CGColorRef
//        
//        button1.tintColor = UIColor.whiteColor()
//        button1.setImage(UIImage(named:"btnBtn"),forState:.Normal)  //设置图标
//        button1.titleLabel?.font = button1.titleLabel?.font.fontWithSize(18.0)
//       
//        button1.titleEdgeInsets = UIEdgeInsetsMake(0, 4, 0, 0)


        
        
        
        
        
        
        //取消选中背景色
        cell?.selectionStyle = UITableViewCellSelectionStyle.None
    
        labelO.text = "佟雪飞"
        labelO.textColor = UIColor(red: 51/255, green: 51/255, blue: 51/255, alpha: 1)
        labelO.font = returnFont(16)
        return cell!
    
    }
    func addBtn_Yuye(labelO:UILabel)->UIButton{
        //button1.setTitle("custom", forState: UIControlState.Application)
        
        var button2 = UIButton(frame: CGRect(x: labelO.frame.origin.x-8, y: labelO.frame.origin.y+30, width: 76, height: 26))
        //背景色
        //button2.backgroundColor = UIColor.yellowColor()
        //标题背景色
        //button2.titleLabel?.backgroundColor = UIColor.redColor()
        button2.setTitle("编辑资料", forState:UIControlState.Normal) //普通状态下的文字
        button2.setTranslatesAutoresizingMaskIntoConstraints(true)
        button2.titleLabel?.font = returnFont(12.0)
        button2.setTitleColor(returnRgb(102),forState: .Normal) //普通状态下文字的颜色
        button2.titleEdgeInsets = UIEdgeInsetsMake(0, 4, 0, 4)
        
        var grzlBtn  = "grzlBtn"
        if grzlBtn != "" {
            button2.setImage(UIImage(named:"grzlBtn"),forState:.Normal)  //设置图标
        }
        
        
        //边框宽度
        button2.layer.borderWidth = 1
        //圆角
        button2.layer.cornerRadius = 5.0
        //边框颜色
        let color1 = UIColor(red: 160/255, green: 160/255, blue: 160/255, alpha: 1).CGColor as CGColorRef
        button2.layer.borderColor = color1
        //button2.contentEdgeInsets = UIEdgeInsetsMake(1,1,1,1);
        button2.imageEdgeInsets = UIEdgeInsetsMake(1,1,1,1);
        button2.addTarget(self,action:Selector("zlbjBtn:"),forControlEvents:UIControlEvents.TouchUpInside)
        return button2
    }
    
    func zlbjBtn(button:UIButton){
        //println("编辑资料")
    }
    

    

}
