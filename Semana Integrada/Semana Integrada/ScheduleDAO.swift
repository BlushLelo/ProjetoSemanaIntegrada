//
//  ScheduleDAO.swift
//  Semana Integrada
//
//  Created by vntlab on 7/26/16.
//  Copyright © 2016 venturuspucc. All rights reserved.
//

import Foundation

class ScheduleDAO {
    var Teste = Schedule()
    
    var palestras = [String:Schedule]()
    var Palestra = Schedule()
    
    
    func generatePalestras() -> [String:Schedule] {
        let filePath = NSBundle.mainBundle().pathForResource("Atividades1", ofType: "json")
        
        let data = NSData(contentsOfFile: filePath!)!
        
        let myJson = JSON(data: data)
        
        
        for i in myJson{
            
            let test = i.1
            Palestra.EventTitle = test["EventTitle"].stringValue
            Palestra.EventHour = test["EventHour"].stringValue
            Palestra.EventType = test["EventType"].stringValue
            Palestra.EventLocation = test["EventLocation"].stringValue
            palestras[Palestra.EventHour!] = Palestra
            print(test["EventTitle"].stringValue)
            print(test["EventHour"].stringValue)
            print(test["EventType"].stringValue)
            print(test["EventLocation"].stringValue)
            
        }
  
        return palestras
    }
    
    
    
}