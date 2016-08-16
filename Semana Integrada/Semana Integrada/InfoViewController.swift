//
//  InfoViewController.swift
//  Semana Integrada
//
//  Created by vntlab on 7/25/16.
//  Copyright © 2016 venturuspucc. All rights reserved.
//

import UIKit
import QuartzCore



class InfoViewController :UITableViewController{
    
    override func viewWillAppear(animated: Bool) {
        
                navigationItem.title = "Informações"
                self.navigationController?.navigationBar.barStyle = UIBarStyle.BlackTranslucent
        
                self.navigationController?.navigationBar.barTintColor = UIColor(red: 0.10, green: 0.74, blue: 0.61, alpha: 1.0);
        
        }
    
   
    @IBAction func SiteButton(sender: AnyObject) {
    
        UIApplication.sharedApplication().openURL(NSURL(string: "http://www.semanaintegrada.com.br")!)
    }
    
    
   
        
    @IBAction func PhoneButton(sender: AnyObject) {
    
        
            let numerocel = NSURL(string: "tel://080072878228")
            UIApplication.sharedApplication().openURL(numerocel!)
        
    
    }
    
   
    
 
}



    
