//
//  SlidingContainerSliderView.swift
//  SlidingContainerViewController
//
//  Created by Cem Olcay on 10/04/15.
//  Copyright (c) 2015 Cem Olcay. All rights reserved.
//

import UIKit

struct SlidingContainerSliderViewAppearance {
    
    var backgroundColor: UIColor
    
    var font: UIFont
    var selectedFont: UIFont
    
    var textColor: UIColor
    var selectedTextColor: UIColor
    
    var outerPadding: CGFloat
    var innerPadding: CGFloat
    
    var selectorColor: UIColor
    var selectorHeight: CGFloat
}

protocol SlidingContainerSliderViewDelegate {
    func slidingContainerSliderViewDidPressed (slidingtContainerSliderView: SlidingContainerSliderView, atIndex: Int)
}

class SlidingContainerSliderView: UIScrollView, UIScrollViewDelegate {
   
    // MARK: Properties
    
    var appearance: SlidingContainerSliderViewAppearance! {
        didSet {
            draw()
        }
    }
    
    var shouldSlide: Bool = true
    //高度
    let sliderHeight: CGFloat = 50
    var titles: [String]!
    
    var labels: [UILabel] = []
    var selector: UIView!

    var sliderDelegate: SlidingContainerSliderViewDelegate?
    
    
    
    
    // MARK: Init
    
    init (width: CGFloat, titles: [String],Color:UIColor) {
        super.init(frame: CGRect (x: 0, y: 0, width: width, height: sliderHeight))
        self.titles = titles
        
        delegate = self
        showsHorizontalScrollIndicator = false
        showsVerticalScrollIndicator = false
        scrollsToTop = false
        alwaysBounceHorizontal = true
        delaysContentTouches = false

        
        
        //let bgColor = UIColor(red: 237/255, green: 237/255, blue: 237/255, alpha: 1)
        var bgColor = Color
        let textColorTitle = UIColor(red: 153/255, green: 153/255, blue: 153/255, alpha: 1)
        let textColorTitles = UIColor(red: 255/255, green: 102/255, blue: 0/255, alpha: 1)
        
        
        //32 字号的宽度*2
        appearance = SlidingContainerSliderViewAppearance (
            backgroundColor: bgColor,
            font: UIFont (name: "HelveticaNeue-Light", size: 16)!,
            selectedFont: UIFont.systemFontOfSize(16),
            
            textColor: textColorTitle,
            selectedTextColor: textColorTitles,
            
            outerPadding: 10,
            innerPadding: (frame.width/4)-32,
            
            selectorColor: textColorTitles,
            selectorHeight: 2)
        
        draw()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    
    // MARK: Draw
    
    func draw () {
        
        // clean
        if labels.count > 0 {
            for label in labels {
                
                label.removeFromSuperview()
                
                if selector != nil {
                    selector.removeFromSuperview()
                    selector = nil
                }
            }
        }
        
        labels = []
        backgroundColor = appearance.backgroundColor
        
        var labelTag = 0
        var currentX = appearance.outerPadding
        var lwidth:CGFloat = 0
        
        for title in titles {
            let label = labelWithTitle(title)
            label.frame.origin.x = currentX
            label.center.y = frame.size.height/2
            label.tag = labelTag++
            
            var xx = labelWithLine()
            label.viewWithTag(0)?.addSubview(xx)
            
           
            
            addSubview(label)
            labels.append(label)
            currentX += (label.frame.size.width + appearance.outerPadding)
            lwidth = label.frame.size.width
            
        }
        
        //label.viewWithTag(0)?.frame.width = lwidth - 20
        
        let selectorH = appearance.selectorHeight
        selector = UIView (frame: CGRect (x: 0, y: frame.size.height - selectorH, width: lwidth-(appearance.outerPadding*2), height: selectorH))
        
        selector.tag = 5
        
        //selector.backgroundColor = UIColor.yellowColor()
        selector.backgroundColor = appearance.selectorColor
        addSubview(selector)
        
        //滚动条内容的宽度
        contentSize = CGSize (width: currentX-40, height: frame.size.height)
    }
    
    func labelWithTitle (title: String) -> UILabel {
        
        let label = UILabel (frame: CGRect (x: 0, y: 0, width: 0, height: 0))
        label.text = title
        label.font = appearance.font
        label.textColor = appearance.textColor
        label.textAlignment = .Center
        
        //自定义宽度
        //label.sizeToFit()
        //label.frame.size.width += appearance.innerPadding * 2
        label.frame.size.width  = (frame.width/2)
        label.frame.size.height = ((frame.height/2)-8)
        
        label.addGestureRecognizer(UITapGestureRecognizer (target: self, action: "didTap:"))
        label.userInteractionEnabled = true
        
        return label
    }
    
    
    func labelWithLine () -> UILabel {
        
        let label = UILabel (frame: CGRect (x: ((frame.width/2)-10), y: (-7), width: 0, height: 0))
        let lbg   = UIColor(red: 204/255, green: 204/255, blue: 204/255, alpha: 1)
        label.backgroundColor  = lbg
    
        //自定义宽度
        //label.sizeToFit()
        //label.frame.size.width += appearance.innerPadding * 2
        //label.frame.size.width = (frame.width/2)
        //label.frame.size.height = ((frame.height/2)-8)
        
        label.frame.size.width = (1)
        label.frame.size.height = (27)

        
        return label
    }
    
    
    // MARK: Actions
    //label.addGestureRecognizer(UITapGestureRecognizer (target: self, action: "didTap:"))
    func didTap (tap: UITapGestureRecognizer) {
        self.sliderDelegate?.slidingContainerSliderViewDidPressed(self, atIndex: tap.view!.tag)
//        println(self.sliderDelegate)
//        println(self.sliderDelegate!.slidingContainerSliderViewDidPressed(self, atIndex: tap.view!.tag))
//        println(tap.view!.tag)
    }
    
    
    // MARK: Menu
    
    func selectItemAtIndex (index: Int) {
        
        // Set Labels
        
        for i in 0..<self.labels.count {
            let label = labels[i]
            
            if i == index {
                
                label.textColor = appearance.selectorColor
                label.font = appearance.selectedFont
                
                label.sizeToFit()
                label.frame.size.width += appearance.innerPadding * 2
                
              
                // Set selector
                
                UIView.animateWithDuration(0.3, animations: {
                    [unowned self] in
                    self.selector.frame = CGRect (
                        x: label.frame.origin.x,
                        y: self.selector.frame.origin.y,
                        width: label.frame.size.width,
                        height: self.appearance.selectorHeight)
                })
                //println(1)
                
                
            } else {
                
                label.textColor = appearance.textColor
                label.font = appearance.font
                
                label.sizeToFit()
                label.frame.size.width += appearance.innerPadding * 2
            }
        }
    }
    
    
    func selectItemAtIndex1 (index: Int) {
        
        // Set Labels
        
        for i in 0..<self.labels.count {
            let label = labels[i]
            
            if i == index {
                
                label.textColor = appearance.selectorColor
                label.font = appearance.selectedFont
                
                label.sizeToFit()
                label.frame.size.width += appearance.innerPadding * 2
                
                
                // Set selector
                
                UIView.animateWithDuration(0, animations: {
                    [unowned self] in
                    self.selector.frame = CGRect (
                        x: label.frame.origin.x,
                        y: self.selector.frame.origin.y,
                        width: label.frame.size.width,
                        height: self.appearance.selectorHeight)
                    })
                //println(1)
                
                
            } else {
                
                label.textColor = appearance.textColor
                label.font = appearance.font
                
                label.sizeToFit()
                label.frame.size.width += appearance.innerPadding * 2
            }
        }
    }

}

