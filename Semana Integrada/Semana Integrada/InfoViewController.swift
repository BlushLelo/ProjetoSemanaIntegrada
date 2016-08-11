//
//  InfoViewController.swift
//  Semana Integrada
//
//  Created by vntlab on 7/25/16.
//  Copyright © 2016 venturuspucc. All rights reserved.
//

import UIKit

class InfoViewController :UITableViewController{
    
  
    
    @IBAction func SiteButton(sender: UIButton) {
        let url = NSURL(string: "https://semanaintegrada.com.br")
        UIApplication.sharedApplication().openURL(url!)

    }
    
    @IBAction func PhoneButton(sender: AnyObject) {
        
        
        UIApplication.sharedApplication().openURL(NSURL(string: "telprompt://0800")!)
        
    }
    
    
    
    
    
}



    
