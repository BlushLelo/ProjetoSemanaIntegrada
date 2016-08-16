//
//  ActivityDetailController.swift
//  Semana Integrada
//
//  Created by Aluno Projeto on 11/08/16.
//  Copyright © 2016 venturuspucc. All rights reserved.
//

import UIKit


class ActivityDetailController: UIViewController{
    
    @IBOutlet weak var labelLocation: UILabel!
    @IBOutlet weak var labelTipo: UILabel!
    @IBOutlet weak var labelTitulo: UILabel!
    @IBOutlet weak var Time: UILabel!
    
    var event = Schedule()
    
    override func viewDidLoad() {
        
       
                navigationItem.title = "\(event.EventDay!)"
      
        Time.text = event.EventHour
        Time.adjustsFontSizeToFitWidth.hashValue
        labelLocation.text = event.EventLocation
        labelTipo.text = event.EventType
        labelTitulo.text = event.EventTitle
    }
   
    
    
}