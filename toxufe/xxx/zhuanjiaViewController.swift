//
//  zhuanjiaViewController.swift
//  xxx
//
//  Created by txf on 15/5/22.
//  Copyright (c) 2015年 jdzmyy. All rights reserved.
//

import UIKit

class zhuanjiaViewController: UIViewController,UICollectionViewDelegateFlowLayout,UICollectionViewDataSource {

    @IBOutlet weak var zjTableview: zhuanjiaUITableView!
    @IBOutlet weak var cvDemo: UICollectionView!
    var CellWidth:CGFloat = 60
    var img = ["fuchan","waike","neike","wuguan","tese"]
    var img_highlight = ["fuchan1","waike1","neike1","wuguan1","tese1"]
    var keshinamex = ["妇产儿科","外科科室","内科科室","五官科室","特色科室"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cvDemo.dataSource = self
        cvDemo.delegate   = self
        
        
        //表格是否隐藏
        self.view.viewWithTag(7)?.hidden = false
        
        
        var widthFather = view.frame.width
        var cellWidth   = ((widthFather-((self.CellWidth)*5))/8)+((self.CellWidth)/2) as CGFloat
        
        
        
        var dianImg = UIImageView(frame: CGRect(x: cellWidth, y: 50+90-2.5, width: 5, height: 5))
        //println(dianImg)
        dianImg.tag = 15
        var name = "dian"
        if name != "" {
            dianImg.image = UIImage(named: name)
        }
        
        
        view.addSubview(dianImg)
        
        //println()
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //每个集合格子的宽高
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout:
        UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize{
            return CGSize(width: (self.CellWidth), height: 70)
      
    }
    //外边距
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets{
        var widthFather = view.frame.width
        var cellWidth   = (widthFather-((self.CellWidth)*5))/8 as CGFloat
        return UIEdgeInsets(top: 10, left: cellWidth, bottom: 10, right: cellWidth)

    }
    
    //上下的间距
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat{
        return 23
    }
    //左右的间距
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat{
        var widthFather = view.frame.width
        var cellWidth   = (widthFather-((self.CellWidth)*5))/8 as CGFloat
        return cellWidth
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int{
        return 1
    }
    
    
    
    //返回几个格子
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        return img.count
    }

    
    //单击格子事件
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath){
        //println(indexPath.row)
        
        
        
        if indexPath.row != 0 {
            //选中那个单元格
            var NSIndexPath1 = NSIndexPath(forRow: 0, inSection: 0)
            var contentCell1 = collectionView.cellForItemAtIndexPath(NSIndexPath1)
            var imageTitle = contentCell1?.viewWithTag(1) as! UIImageView
            var labelTitle = contentCell1?.viewWithTag(2) as! UILabel
            //自适应
            imageTitle.contentMode = UIViewContentMode.ScaleAspectFit
            
            if img[0] != "" {
                imageTitle.image = UIImage(named: img[0])
            
            }
            
            labelTitle.textColor = UIColor(red: 153/255, green: 153/255, blue: 153/255, alpha: 1.0)
        
        }
        
        //小滑点功能
        var imgDian = self.view.viewWithTag(15) as! UIImageView
        var xWidth:CGFloat
        var widthFather = view.frame.width
        var cellWidth   = ((widthFather-((self.CellWidth)*5))/6)+(self.CellWidth)/2 as CGFloat
        //动态添加表格数据---最后重载
        if indexPath.row == 0 {
            cellWidth   = ((widthFather-((self.CellWidth)*5))/6)+(self.CellWidth)/2-8 as CGFloat
            zjTableview.pron = ["个人信息","头像","昵称","性别","生日","地址","修改密码","医疗信息","实名认证","常用就诊人"]
        }else if indexPath.row == 1 {
            cellWidth   = ((widthFather-((self.CellWidth)*5))/6)*2+(self.CellWidth)+(self.CellWidth)/2-8 as CGFloat
            zjTableview.pron = ["个人信息","性别","生日","地址","修改密码","医疗信息","实名认证","常用就诊人"]
        }else if indexPath.row == 2 {
            cellWidth   = ((widthFather-((self.CellWidth)*5))/6)*3+(self.CellWidth)*2+(self.CellWidth)/2 as CGFloat
            zjTableview.pron = ["性别","生日","地址","修改密码","医疗信息","实名认证","常用就诊人"]
        }else if indexPath.row == 3 {
            cellWidth   = ((widthFather-((self.CellWidth)*5))/6)*4+(self.CellWidth)*3+(self.CellWidth)/2 as CGFloat
            zjTableview.pron = ["生日","地址","修改密码","医疗信息","实名认证","常用就诊人"]
        }else if indexPath.row == 4 {
            cellWidth   = ((widthFather-((self.CellWidth)*5))/6)*5+(self.CellWidth)*4+(self.CellWidth)/2+8 as CGFloat
            zjTableview.pron = ["性别","实名认证","常用就诊人"]
        }
        //表格数据重新载入
        zjTableview.reloadData()


        //println(cellWidth)
        
        UIView.animateWithDuration(0.4, animations: {
            imgDian.frame.origin.x = cellWidth
        })
        
        
        
        
        var contentCell = collectionView.cellForItemAtIndexPath(indexPath)

        var imageTitle = contentCell?.viewWithTag(1) as! UIImageView
        var labelTitle = contentCell?.viewWithTag(2) as! UILabel
        
        if img_highlight[indexPath.row] != "" {
            imageTitle.image = UIImage(named: img_highlight[indexPath.row])
        }
        
        
        labelTitle.textColor = UIColor(red: 255/255, green: 102/255, blue: 0/255, alpha: 1.0)
        
       
    }
    //单击格子事件 上一个格子事件
    func collectionView(collectionView: UICollectionView, didDeselectItemAtIndexPath indexPath: NSIndexPath){
        //println(indexPath.row)
        var contentCell = collectionView.cellForItemAtIndexPath(indexPath)
        
        var imageTitle = contentCell?.viewWithTag(1) as! UIImageView
        var labelTitle = contentCell?.viewWithTag(2) as! UILabel
        
        
        if img[indexPath.row] != "" {
            imageTitle.image = UIImage(named: img[indexPath.row])
        }
            
        labelTitle.textColor = UIColor(red: 153/255, green: 153/255, blue: 153/255, alpha: 1.0)
        
        

    
    }
    

    

    
    


    
    



    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    //自定义格子内容
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell{
        
        //图片cell
        var cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as! UICollectionViewCell
        var img1 = cell.viewWithTag(1) as! UIImageView
        
        if img[indexPath.row] != "" {
            img1.image = UIImage(named: img[indexPath.row])
        }
        
        
        var labelTitle = cell.viewWithTag(2) as! UILabel
        labelTitle.text = keshinamex[indexPath.row]
        let titlerFont  = returnFont(11)
        let titlerColor = UIColor(red: 153/255, green: 153/255, blue: 153/255, alpha: 1.0)
        labelTitle.font = titlerFont
        labelTitle.textColor = titlerColor
        
//        if indexPath.row == 0 {
//            labelTitle.textColor = UIColor(red: 255/255, green: 102/255, blue: 0/255, alpha: 1.0)
//        }
        
        if indexPath.row == 0 {
            labelTitle.textColor = UIColor(red: 255/255, green: 102/255, blue: 0/255, alpha: 1.0)
            
            if (img_highlight[indexPath.row] != "") {
                img1.image = UIImage(named: img_highlight[indexPath.row])
            }
            
        }
        
        
        return cell

        
        
    }
    

}
