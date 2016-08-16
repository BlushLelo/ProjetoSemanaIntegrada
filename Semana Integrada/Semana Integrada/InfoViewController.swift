//
//  InfoViewController.swift
//  Semana Integrada
//
//  Created by vntlab on 7/25/16.
//  Copyright © 2016 venturuspucc. All rights reserved.
//

import UIKit

class InfoViewController :UITableViewController{
    
    override func viewWillAppear(animated: Bool) {
        
                navigationItem.title = "Informações"
        //
                self.navigationController?.navigationBar.barStyle = UIBarStyle.BlackTranslucent
        
                self.navigationController?.navigationBar.barTintColor = UIColor(red: 0.10, green: 0.74, blue: 0.61, alpha: 1.0); // Codigo para mudar a cor da Barra com o Titulo da tela
        
    
    }
    
    
    @IBAction func SiteButton(sender: AnyObject) {
    
        let url = NSURL(string: "http://semanaintegrada.com.br/")
        UIApplication.sharedApplication().openURL(url!)
    }
    
    
   
        
        
    @IBAction func PhoneButton(sender: AnyObject) {
    
        UIApplication.sharedApplication().openURL(NSURL(string: "tel://0800 728 7822")!)
        
    
    
    }
    
    
    
}



    
