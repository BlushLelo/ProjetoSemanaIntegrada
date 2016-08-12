//
//  ViewController.swift
//  bata
//
//  Created by Aluno Projeto on 10/08/16.
//  Copyright © 2016 Aluno Projeto. All rights reserved.
//

import UIKit

@IBDesignable class SegmentedControl:UIControl{
    
    private var labels = [UILabel]()
    var thumbView = UIView()
    
    var items:[String] = ["Seg","Ter","Qua","Qui","Sex","Sab"]{
        
        didSet{
            setupLabels()
        }
        
    }
    
    var selectedIndex : Int = 0 {
        
        didSet{
            
            displayNewSelectedIndex()
            
            
            
            
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupView()
    }
    
    func setupView(){
        layer.cornerRadius =  frame.height / 2
        layer.borderColor = UIColor(white: 0, alpha: 0).CGColor //cor da borda geral
        layer.borderWidth = 2
    
        
        backgroundColor = UIColor.clearColor() // cor do fundo
        
        
        setupLabels()
        
        insertSubview(thumbView, atIndex: 0)
    }
    
    func setupLabels(){
        
        for label in labels{
            
            label.removeFromSuperview()
        }
        
        labels.removeAll(keepCapacity: true)
        
        for index in 1...items.count{
            let label = UILabel(frame: CGRectZero)
            label.text = items[index - 1]
            label.textAlignment = .Center
            label.textColor = UIColor(white: 1.0 , alpha: 1.0)//cor do textto
            self.addSubview(label)
            labels.append(label)
            
        }
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        var selecteFrame = self.bounds
        let newWidth = CGRectGetWidth(selecteFrame) / CGFloat(items.count)
        selecteFrame.size.width = newWidth
        thumbView.frame =  selecteFrame
        thumbView.backgroundColor = UIColor.clearColor()
        
        
        thumbView.layer.borderColor = UIColor(white: 1.0, alpha: 1.0).CGColor// cor do anel em volta do dia da semana
        thumbView.layer.borderWidth = 2// essa linha faz o anel aparecer em volta do dia da senaba
        
        thumbView.layer.cornerRadius = thumbView.frame.height / 2
        
        let labelHeight = self.bounds.height
        let labelWidth =  self.bounds.width / CGFloat(items.count)
        
        
        for index in 0...labels.count - 1 {
            var label = labels[index]
            
            let xPosition = CGFloat(index) * labelWidth
            label.frame = CGRectMake(xPosition , 0, labelWidth , labelHeight)
        }
        
    }
    
    override func beginTrackingWithTouch(touch: UITouch, withEvent event: UIEvent?) -> Bool {
        
        let location = touch.locationInView(self)
        
        var calculatedIndex : Int?
        
        for(index, item) in EnumerateSequence(labels){
            
            if item.frame.contains(location){
                calculatedIndex = index
            }
            
        }
        
        if calculatedIndex != nil{
            
            selectedIndex = calculatedIndex!
            sendActionsForControlEvents(.ValueChanged)
            
        }
        
        return false
    }
    
    
    
    func displayNewSelectedIndex(){
        
        var label = labels[selectedIndex]
        self.thumbView.frame = label.frame
    }
    
    
}