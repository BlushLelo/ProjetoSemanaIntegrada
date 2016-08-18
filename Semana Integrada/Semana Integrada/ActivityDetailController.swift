//
//  ActivityDetailController.swift
//  Semana Integrada
//
//  Created by Aluno Projeto on 11/08/16.
//  Copyright © 2016 venturuspucc. All rights reserved.
//

import UIKit
import CoreData

class ActivityDetailController: UIViewController{
    
    @IBOutlet weak var labelLocation: UILabel!
    @IBOutlet weak var labelTipo: UILabel!
    @IBOutlet weak var labelTitulo: UILabel!
    
    var event = Schedule()
    var event2 = NSManagedObject()
    
    override func viewDidLoad() {
        
    /*    labelLocation.text = event.EventLocation
        labelTipo.text = event.EventType
        labelTitulo.text = event.EventTitle
      */
        let eventLocation = event2.valueForKey("eventLocation") as? String
        let eventType = event2.valueForKey("eventType") as? String
        let eventTitle = event2.valueForKey("eventTitle") as? String
        labelLocation.text = eventLocation
        labelTipo.text = eventType
        labelTitulo.text = eventTitle
    }
    
}