//
//  listUITableView.swift
//  xxx
//
//  Created by txf on 15/5/28.
//  Copyright (c) 2015年 jdzmyy. All rights reserved.
//

import UIKit

class listUITableView: UITableView,UITableViewDelegate,UITableViewDataSource {
    var labelInfo:UILabel?
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.dataSource = self
        self.delegate   = self
        
        var lineC = UIColor(red: 222/255, green: 222/255, blue: 222/255, alpha: 1)
        self.separatorColor = lineC
        //定义表格边线内边距
        self.separatorInset.left = 17
        self.separatorInset.right = 17

        

    }
    
    //表格数据
    var tableHead = ["健康档案","查询","病历报告","基本信息","信息中心","提示通知","新闻动态","设置中心","私人医生","订阅号","设置"]
    var tablePic = ["","chaxun","bingli","jbxx","","tishi","xinwen","","yisheng","dingyue","shezhi"]


    
    //返回每块的数量
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return tableHead.count
    }

    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        var cellid = "Lcell"
        var cell:UITableViewCell? = tableView.dequeueReusableCellWithIdentifier(cellid) as? UITableViewCell
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: cellid)
        }
        
        //选中背景色
        cell?.selectionStyle = UITableViewCellSelectionStyle.None
        var label1 = cell?.viewWithTag(1) as! UILabel
        let labelInfoFont  = UIFont(name: "Microsoft yahei", size: 14.0)
        let labelInfoColor = UIColor(red: 153/255, green: 153/255, blue: 153/255, alpha: 1.0)
        label1.font = labelInfoFont
        label1.textColor = labelInfoColor

        label1.text = tableHead[indexPath.row]
        
        //第二类样式
        var cellid1 = "Lcell1"
        var cell1:UITableViewCell? = tableView.dequeueReusableCellWithIdentifier(cellid1) as? UITableViewCell
        if cell1 == nil {
            cell1 = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: cellid1)
        }
        //选中背景色
        cell1?.selectionStyle = UITableViewCellSelectionStyle.None
        //右侧箭头
        cell1?.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        var label2 = cell1?.viewWithTag(2) as! UILabel
        var image1 = cell1?.viewWithTag(1) as! UIImageView
        //println(image1)
        
        let labelInfoFont1  = UIFont(name: "Microsoft yahei", size: 15.0)
        let labelInfoColor1 = UIColor(red: 100/255, green: 100/255, blue: 100/255, alpha: 1.0)
        label2.font = labelInfoFont1
        label2.textColor = labelInfoColor1
        label2.text = tableHead[indexPath.row]
        if (tablePic[indexPath.row] != "") {
            image1.image = UIImage(named: tablePic[indexPath.row])

        }
        
        //第三类样式
        var cellid2 = "Lcell2"
        var cell2:UITableViewCell? = tableView.dequeueReusableCellWithIdentifier(cellid2) as? UITableViewCell
        if cell2 == nil {
            cell2 = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: cellid2)
        }
        //选中背景色
        cell2?.selectionStyle = UITableViewCellSelectionStyle.None
        //右侧箭头
        cell2?.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        var label3 = cell2?.viewWithTag(2) as! UILabel
        var image2 = cell2?.viewWithTag(1) as! UIImageView
        var image3 = cell2?.viewWithTag(3) as! UIImageView
        //println(image2)
        //println(image3)
        
        let labelInfoFont2  = UIFont(name: "Microsoft yahei", size: 15.0)
        let labelInfoColor2 = UIColor(red: 100/255, green: 100/255, blue: 100/255, alpha: 1.0)
        label3.font = labelInfoFont2
        label3.textColor = labelInfoColor2
        label3.text = tableHead[indexPath.row]
        
        if tablePic[indexPath.row] != "" {
            image2.image = UIImage(named: tablePic[indexPath.row])
        }
        
        var pic = "red"
        if pic != "" {
            image3.image = UIImage(named: "red")
        }
        
        //第四类样式
//        var cellid3 = "Lcell3"
//        var cell3:UITableViewCell? = tableView.dequeueReusableCellWithIdentifier(cellid3) as? UITableViewCell
//        if cell3 == nil {
//            cell3 = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: cellid3)
//        }

        
        

        
        if indexPath.row == 0 || indexPath.row == 4 || indexPath.row == 7 {
            return cell!
        }else if indexPath.row == 5 {
            return cell2!
        }else {
            return cell1!

        }
        
                
        
        //[self setEdge:self.view view:view1 attr:NSLayoutAttributeLeft constant:20];
        //[self setEdge:self.view view:view1 attr:NSLayoutAttributeTop constant:20];
        //[self setEdge:self.view view:view1 attr:NSLayoutAttributeRight constant:-20];
        //constraint = [NSLayoutConstraint constraintWithItem:secondButtonattribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqualtoItem:self.view attribute:NSLayoutAttributeBottom multiplier:1.0fconstant:-40.f];
        //[self.view addConstraint:constraint];
        //label1.addConstraint(NSLayoutAttribute.Left = )
        //var dotCenterYConstraint = NSLayoutConstraint(item: label1, attribute: .CenterY, relatedBy: .Equal, toItem: cell, attribute: .CenterY, multiplier: 1.0, constant: 10)
        //self.addConstraint(dotCenterYConstraint)
        //定义表格边线内边距
        //cell?.separatorInset.left = 17
        //cell?.separatorInset.right = 15

    }
    //返回表格部分
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    //返回单元格的高
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat{
        if indexPath.row == 0 || indexPath.row == 4 || indexPath.row == 7 {
            return 50
        }
        return 45
    }
    
    
    //表头的名字
//    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        //还差个表头吸附
//        return tableHead[section]
//    }
    
    //去掉表头头部吸附功能
//    func scrollViewDidScroll(scrollView: UIScrollView) {
//        if scrollView.contentOffset.y <= 50 && scrollView.contentOffset.y >= 0 {
//            scrollView.contentInset = UIEdgeInsetsMake(-scrollView.contentOffset.y, 0, 0, 0)
//        }else if scrollView.contentOffset.y >= 50 {
//            scrollView.contentInset = UIEdgeInsetsMake(-50, 0, 0, 0)
//        }
//        //println(sectionHeaderHeight)
//        
//    }

    //表头的内容
//    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        //还差一个左边的内边距
//        labelInfo = UILabel(frame: CGRect(x: 20, y: 0, width: 0, height: 0))
//        let labelInfoFont  = UIFont(name: "Microsoft yahei", size: 15.0)
//        let labelInfoColor = UIColor(red: 153/255, green: 153/255, blue: 153/255, alpha: 1.0)
//        labelInfo!.text = tableHead[section]
//        labelInfo!.font = labelInfoFont
//        labelInfo!.textColor = labelInfoColor
//        
//        //左侧距离
//        self.backgroundColor = UIColor(red: 250/255, green: 250/255, blue: 250/255, alpha: 1)
//        return labelInfo
//    }
    
//    //表头的高度
//    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat{
//        //头部信息的高度
//        return 50
//    }
    

}
