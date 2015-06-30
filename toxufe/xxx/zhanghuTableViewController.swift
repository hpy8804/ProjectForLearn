//
//  zhanghuTableViewController.swift
//  xxx
//
//  Created by txf on 15/5/27.
//  Copyright (c) 2015年 jdzmyy. All rights reserved.
//

import UIKit

class zhanghuTableViewController: UITableViewController {
    
    //表格资料
    @IBOutlet weak var ziliaoTable: ziliaoUITableView!
    //资料编辑
    //@IBAction func bjzlBtn(sender: UIButton) {
        //println("资料编辑")
    //}

    override func viewDidLoad() {
        super.viewDidLoad()
        ziliaoTable.delegate = self
        
        
        //设置导航标题字体
        let titlerFont  = UIFont(name: "Microsoft yahei", size: 19.0)
        let titlerColor = UIColor(red: 153/255, green: 153/255, blue: 153/255, alpha: 1.0)
        let navigationTitleAttribute : NSDictionary = NSDictionary(objectsAndKeys: titlerFont!,NSFontAttributeName,titlerColor,NSForegroundColorAttributeName)
        
        self.navigationController?.navigationBar.titleTextAttributes = navigationTitleAttribute as [NSObject : AnyObject]
        
        //设置导航栏颜色
        let mainColor = UIColor(red: 237/255, green: 237/255, blue: 237/255, alpha: 1)
        self.navigationController?.navigationBar.barTintColor = mainColor

        
    }
    
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        //资料编辑
        if tableView.isEqual(ziliaoTable) {
            if indexPath.row == 0 {
                println("我是表格第一行")
            }
        }
        
       // f ([tableView isEqual:leftTableView]) {
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }




}
