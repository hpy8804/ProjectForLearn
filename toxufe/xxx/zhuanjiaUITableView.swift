//
//  zhuanjiaUITableView.swift
//  xxx
//
//  Created by txf on 15/5/23.
//  Copyright (c) 2015年 jdzmyy. All rights reserved.
//

import UIKit

class zhuanjiaUITableView: UITableView,UITableViewDataSource,UITableViewDelegate{
    
    var pron = ["个人信息","头像","昵称","性别","生日","地址","修改密码","医疗信息","实名认证","常用就诊人"]
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        //定义表格数据
        self.dataSource = self
        self.delegate   = self
        //左侧表格线间距
        self.separatorInset.left = 80.0
        var lineC = UIColor(red: 240/255, green: 240/255, blue: 240/255, alpha: 1)
        self.separatorColor = lineC

    }
    
    //返回section
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    
    //返回单元格的高
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat{
        return 50
    }
    
    //返回每个section的数量
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var num = pron.count
        return num
    }
    
    //表头的名字
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        //还差个表头吸附
        //self.tableHeaderView?.frame.origin.x = 0
        return pron[section]
    }
    
    //去掉表头头部吸附功能
    func scrollViewDidScroll(scrollView: UIScrollView) {
        
        if scrollView.contentOffset.y <= sectionHeaderHeight && scrollView.contentOffset.y >= 0 {
            scrollView.contentInset = UIEdgeInsetsMake(-scrollView.contentOffset.y, 0, 0, 0)
        }else if scrollView.contentOffset.y >= sectionHeaderHeight {
            scrollView.contentInset = UIEdgeInsetsMake(-sectionHeaderHeight, 0, 0, 0)
        }
    }

    
    
    
    //表头的内容
        func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        var customView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
            
        //还差一个左边的内边距
        var labelInfo = UILabel(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        let labelInfoFont  = returnFont(14)
        let labelInfoColor = returnRgb(153)
        
        //self.tableView setSeparatorInset:UIEdgeInsetsZero];
            
        
        //labelInfo.layoutMargins = UIEdgeInsets(top: 0, left: 30, bottom: 0, right: 0)
        //labelInfo.frame.size.width = 100
        labelInfo.text = pron[section]
        labelInfo.font = labelInfoFont
        labelInfo.textColor = labelInfoColor
        //labelInfo.backgroundColor = UIColor.redColor()
        //labelInfo.drawTextInRect(CGRect(x: 20, y: 10, width: 10, height: 10))
        //labelInfo.textAlignment = NSTextAlignment.Center
        //labelInfo.layoutMargins = UIEdgeInsets(top: 0, left: 30, bottom: 10, right: 10)
            
        //labelInfo.frame.origin.x = 24.0
            
        //headerLabel.frame = CGRectMake(10.0, 0.0, 300.0, 44.0);
        labelInfo.frame = CGRectMake(22.0, 0, 300, 28)
    
        
        self.backgroundColor = returnRgb(250)
            customView.addSubview(labelInfo)
        return customView
    
    }
    //表头的高度
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat{
        //头部信息的高度
        return 28
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //cellheader
        var cellid = "cell"
        var cell:UITableViewCell? = tableView.dequeueReusableCellWithIdentifier(cellid) as? UITableViewCell
        //println(cell)
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: cellid)
        }
        
        //找职
        //专家头像
        var photoPic = cell!.viewWithTag(1) as! UIImageView
        //专家名字
        var expertname = cell!.viewWithTag(2) as! UILabel
        //专家职称
        var experttitle = cell!.viewWithTag(3) as! UILabel
        //右侧图片
        var rightPic    = cell!.viewWithTag(4) as! UIImageView
        
        photoPic.contentMode = UIViewContentMode.ScaleAspectFit
        rightPic.contentMode = UIViewContentMode.ScaleAspectFit
        
        let expertnameFont  = returnFont(15)
        let expertnameColor = returnRgb(102)
        let experttitleFont  = returnFont(12)
        let experttitleColor = returnRgb(153)
        //付职
        var tit1 = "tit1"
        if tit1 != "" {
            photoPic.image = UIImage(named: tit1)
            //println(photoPic)
        }
        
        
        expertname.text = pron[indexPath.row]
        expertname.font = expertnameFont
        expertname.textColor = expertnameColor
        experttitle.text = "专家职称"
        experttitle.font = experttitleFont
        experttitle.textColor = experttitleColor
        var hstar = "hstar"
        var lstar = "lstar"
        
        if hstar != "" {
            rightPic.image = UIImage(named: hstar)

        }
        if lstar != "" {
            rightPic.highlightedImage = UIImage(named: lstar)
            
        }
        
        return cell!
        
    }
    

}
