//
//  ScheduleDAO.swift
//  Semana Integrada
//
//  Created by vntlab on 7/26/16.
//  Copyright © 2016 venturuspucc. All rights reserved.
//

import Foundation

class ScheduleDAO : EventTableCellView {
    
    
    
    var Teste = Schedule()
    var palestras = [String:[Schedule]]()
    var ListaDePalestras = [Schedule]()
    
    
    func generatePalestras() -> [String:[Schedule]] {
        
        let filePath = NSBundle.mainBundle().pathForResource("Atividades1", ofType: "json")
        let data = NSData(contentsOfFile: filePath!)!
        let myJson = JSON(data: data)
        
        for i in myJson{
            let test = i.1
            let Palestra = Schedule();
            Palestra.EventTitle = test["EventTitle"].stringValue
            Palestra.EventHour = test["EventHour"].stringValue
            Palestra.EventType = test["EventType"].stringValue
            Palestra.EventLocation = test["EventLocation"].stringValue
            Palestra.favorite = Favoritado()
            
            if var array = palestras[Palestra.EventHour!]{
                array.append(Palestra);
                palestras[Palestra.EventHour!] = array;
            } else {
                var array = [Schedule]();
                array.append(Palestra)
                palestras[Palestra.EventHour!] = array;
            }
            
        }
        return palestras
    }
    
}