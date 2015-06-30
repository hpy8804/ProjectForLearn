//
//  UserInfoUITableView.swift
//  xxx
//
//  Created by txf on 15/5/18.
//  Copyright (c) 2015年 jdzmyy. All rights reserved.
//

import UIKit


class UserInfoUITableView: UITableView,UITableViewDataSource,UITableViewDelegate{
    
    var pron = ["个人信息","头像","昵称","性别","生日","地址","修改密码","医疗信息","实名认证","常用就诊人"]
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        //定义表格数据
        self.dataSource = self
        self.delegate   = self
        var lineC = UIColor(red: 222/255, green: 222/255, blue: 222/255, alpha: 1)
        self.separatorColor = lineC
    }
    
    //表头的名字
    //func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        //return pron[section]
    //}
    //表头的内容
    //func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        //var labelInfo = UILabel(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        //labelInfo.text = pron[section]
        //self.backgroundColor = UIColor.yellowColor()
        //return labelInfo

    //}
    //表头的高度
    //func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat{
        //头部信息的高度
        //return 47
    //}

    //返回单元格的高
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat{
        return 46
    }

    //返回section
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    //返回每个section的数量
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var num = pron.count
        return num
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

        labelO.text = pron[indexPath.row]
        labelO.textColor = UIColor(red: 51/255, green: 51/255, blue: 51/255, alpha: 1)
        labelO.font = UIFont(name: "Microsoft yahei", size: 16.0)
        
        //右侧箭头
        cell?.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        //选中背景色
        cell?.selectionStyle = UITableViewCellSelectionStyle.Default
        //定义表格边线内边距
        cell?.separatorInset.left = 17
        cell?.separatorInset.right = 15

        
        //自定义单元格样式2---个人信息
        var cellid1 = "titleInfo"
        var cell1:UITableViewCell? = tableView.dequeueReusableCellWithIdentifier(cellid1) as? UITableViewCell
        if cell1 == nil {
            cell1 = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: cellid1)
        }
        
        //选中背景色
        cell1?.selectionStyle = UITableViewCellSelectionStyle.Default
        //定义表格边线内边距
        cell1?.separatorInset.left = 17
        cell1?.separatorInset.right = 15
        
        
        
        // 153 16
        
        var label1 = cell1?.viewWithTag(1) as! UILabel
        label1.text = pron[indexPath.row]
        label1.textColor = UIColor(red: 153/255, green: 153/255, blue: 153/255, alpha: 1)
        label1.font = UIFont(name: "Microsoft yahei", size: 16.0)
        
        
        //自定义单元格3---头像
        var cellid2 = "touxiang"
        var cell2:UITableViewCell? = tableView.dequeueReusableCellWithIdentifier(cellid2) as? UITableViewCell
        
        if cell2 == nil {
            cell2 = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: cellid2)
        }
        
        cell2?.separatorInset.left = 17
        cell2?.separatorInset.right = 15
        
        var label2 = cell2?.viewWithTag(1) as! UILabel
        var image1 = cell2?.viewWithTag(2) as! UIImageView
    
        label2.text = pron[indexPath.row]
        label2.textColor = UIColor(red: 51/255, green: 51/255, blue: 51/255, alpha: 1)
        label2.font = UIFont(name: "Microsoft yahei", size: 16.0)
        
        //smLeft
        //image1.backgroundColor = UIColor.redColor()
        //设置图片源
        var pic = "grxxPhoto"
        if pic != "" {
            image1.image = UIImage(named: pic)
            //println(image1)
        }
        
        
        
        
        image1.contentMode = UIViewContentMode.ScaleAspectFill
        //右侧箭头
        cell2?.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        
        
        //自定义单元格头像---nicheng
        var cellid3 = "nicheng"
        var cell3:UITableViewCell? = tableView.dequeueReusableCellWithIdentifier(cellid3) as? UITableViewCell
        
        if cell3 == nil {
             cell3 = UITableViewCell(style:UITableViewCellStyle.Default, reuseIdentifier: cellid3)
        }
        
        //右侧箭头
        cell3?.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        
        cell3?.separatorInset.left = 17
        cell3?.separatorInset.right = 15
        
        //cell3?.selectionStyle = UITableViewCellSelectionStyle.None
        //cell3?.backgroundColor  = UIColor.redColor()
        //cell3?.selectedBackgroundView = cell3
  
        
        
        var nicheng = cell3?.viewWithTag(1) as! UILabel
        var nicheng1 = cell3?.viewWithTag(2) as! UILabel
        
        nicheng.text = pron[indexPath.row]
        nicheng1.textColor = UIColor(red: 204/255, green: 204/255, blue: 204/255, alpha: 1)
        nicheng1.font = UIFont(name: "Microsoft yahei", size: 16.0)

        
        //判断显示昵称姓名
        if indexPath.row == 2 {
            nicheng1.text = "佟雪飞"
        }else if indexPath.row == 3 {
            nicheng1.text = "女"
        }
        
        
        
        
        //自定义单元格实名认证 renzheng
        var cellid4 = "renzheng"
        var cell4:UITableViewCell?  = tableView.dequeueReusableCellWithIdentifier(cellid4) as? UITableViewCell
        if cell4 == nil {
            cell4 = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: cellid4)
        }
        
        //右侧箭头
        cell4?.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        cell4?.separatorInset.left = 17
        cell4?.separatorInset.right = 15
        
        var renzheng = cell4?.viewWithTag(1) as! UILabel
        renzheng.text = pron[indexPath.row]
        renzheng.textColor = UIColor(red: 51/255, green: 51/255, blue: 51/255, alpha: 1)
        renzheng.font = UIFont(name: "Microsoft yahei", size: 16.0)
        
        var renzhengpic = cell4?.viewWithTag(2) as! UIImageView
        var picc = "rigthInfo"
        if  picc != "" {
            renzhengpic.image = UIImage(named: picc)
            //println(renzhengpic)
        }
        renzhengpic.hidden = false


        if indexPath.row == 0 || indexPath.row == 7 {
            return cell1!
        }else if indexPath.row == 1 {
            return cell2!
        }else if indexPath.row == 2 || indexPath.row == 3 {
            return cell3!
        }else if indexPath.row == 8 {
            return cell4!
        } else {
            return cell!
        }
    }
    
    


    
    

}
