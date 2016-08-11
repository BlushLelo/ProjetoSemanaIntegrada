//
//  EventTableCellView.swift
//  Semana Integrada
//
//  Created by vntlab on 7/28/16.
//  Copyright © 2016 venturuspucc. All rights reserved.
//

import UIKit

class EventTableCellView:UITableViewCell{
    
    var a = 0
    
    @IBOutlet weak var eventType: UILabel!
    
    @IBOutlet weak var eventDescription: UILabel!

    @IBOutlet weak var eventFavorite: UIButton!
    
    @IBAction func favoriteButton(sender: AnyObject) {
        
        
        if(a == 0){
        
        let image = UIImage(named: "ic_favourites_selected.png")
        sender.setImage(image, forState: .Normal)
            a = 1
        }else{
            let image = UIImage(named: "ic_favourites_unselected.png")
            sender.setImage(image, forState: .Normal)
            a = 0
        }
        
        
    }
    
    func Favoritado() -> Bool{
        if a == 0 {
        return true
        }
        else{
        return false
        }
    }
   
    @IBOutlet weak var EventHour: UILabel!
}
