//
//  ScheduleDAO.swift
//  Semana Integrada
//
//  Created by vntlab on 7/26/16.
//  Copyright © 2016 venturuspucc. All rights reserved.
//

import UIKit
import CoreData

class ScheduleDAO : EventTableCellView {
 
    
    
 
    var Dictionary2 = [String:[Schedule2]]()
    var palestrasSeg2 = [String:[Schedule2]]()
    var palestrasTer2 = [String:[Schedule2]]()
    var palestrasQua2 = [String:[Schedule2]]()
    var palestrasQui2 = [String:[Schedule2]]()
    var palestrasSex2 = [String:[Schedule2]]()
    var palestrasSab2 = [String:[Schedule2]]()
    var palestrasGerais2 = [ [String:[Schedule2]] ]()
    
    var Dictionary = [String:[Schedule]]()
    var palestrasSeg = [String:[Schedule]]()
    var palestrasTer = [String:[Schedule]]()
    var palestrasQua = [String:[Schedule]]()
    var palestrasQui = [String:[Schedule]]()
    var palestrasSex = [String:[Schedule]]()
    var palestrasSab = [String:[Schedule]]()
    var palestrasGerais = [[String:[Schedule]]]()
    var ListaDePalestras = [Schedule]()

    
  /*  func saveItem(scheduleToSave : Schedule){
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        let entity = NSEntityDescription.entityForName("Schedule2", inManagedObjectContext: managedContext)
        let item = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: managedContext)
        item.setValue(scheduleToSave.EventDay, forKey: "eventDay")
        item.setValue(scheduleToSave.EventHour, forKey: "eventHour")
        item.setValue(scheduleToSave.EventLocation, forKey: "eventLocation")
        item.setValue(scheduleToSave.EventTitle, forKey: "eventTitle")
        item.setValue(scheduleToSave.EventType, forKey: "eventType")
        item.setValue(scheduleToSave.favorite, forKey: "favorite")
        
        do {
            try managedContext.save()
            ListaDePalestras2.append(item)
        }
        catch{
            print("error")
        }
        

    } */

    
    func saveItem(title: String, hour: String, type: String, location: String, day: String){
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        let entity = NSEntityDescription.entityForName("Schedule2", inManagedObjectContext: managedContext)
        let item = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: managedContext) as! Schedule2
        
        item.eventTitle = title
        item.eventHour = hour
        item.eventType = type
        item.eventLocation = location
        item.eventDay = day
        
        do {
            try managedContext.save()
        }
        catch{
            print("error")
        }
        
        
    }
    

  
    
    func generatePalestras() -> [ [String:[Schedule]] ] {
        
       

        
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
            Palestra.EventDay = test["EventDay"].stringValue
            Palestra.favorite = Favoritado()
            if Palestra.EventDay == "Seg"{
                if var array = palestrasSeg[Palestra.EventHour!]{
                    array.append(Palestra)
                    palestrasSeg[Palestra.EventHour!] = array
                } else {
                    var array = [Schedule]()
                    array.append(Palestra)
                    palestrasSeg[Palestra.EventHour!] = array
                }
                
            } else   if Palestra.EventDay == "Ter"{
                if var array = palestrasTer[Palestra.EventHour!]{
                    array.append(Palestra)
                    palestrasTer[Palestra.EventHour!] = array
                } else {
                    var array = [Schedule]()
                    array.append(Palestra)
                    palestrasTer[Palestra.EventHour!] = array
                }
                
            }else   if Palestra.EventDay == "Qua"{
                if var array = palestrasQua[Palestra.EventHour!]{
                    array.append(Palestra)
                    palestrasQua[Palestra.EventHour!] = array
                } else {
                    var array = [Schedule]()
                    array.append(Palestra)
                    palestrasQua[Palestra.EventHour!] = array
                }
                
            }else   if Palestra.EventDay == "Qui"{
                if var array = palestrasQui[Palestra.EventHour!]{
                    array.append(Palestra)
                    palestrasQui[Palestra.EventHour!] = array
                } else {
                    var array = [Schedule]()
                    array.append(Palestra)
                    palestrasQui[Palestra.EventHour!] = array
                }
                
            }else   if Palestra.EventDay == "Sex"{
                if var array = palestrasSex[Palestra.EventHour!]{
                    array.append(Palestra)
                    palestrasSex[Palestra.EventHour!] = array
                } else {
                    var array = [Schedule]()
                    array.append(Palestra)
                    palestrasSex[Palestra.EventHour!] = array
                }
                
            }else   if Palestra.EventDay == "Sab"{
                if var array = palestrasSab[Palestra.EventHour!]{
                    array.append(Palestra)
                    palestrasSab[Palestra.EventHour!] = array
                } else {
                    var array = [Schedule]()
                    array.append(Palestra)
                    palestrasSab[Palestra.EventHour!] = array
                }
                
            }
            
        }
        
   
        
        
        palestrasGerais.append(palestrasSeg)
        palestrasGerais.append(palestrasTer)
        palestrasGerais.append(palestrasQua)
        palestrasGerais.append(palestrasQui)
        palestrasGerais.append(palestrasSex)
        palestrasGerais.append(palestrasSab)
        
        return palestrasGerais
    }
    
    func generatePalestras2() {
        
        
        
        
        let filePath = NSBundle.mainBundle().pathForResource("Atividades1", ofType: "json")
        let data = NSData(contentsOfFile: filePath!)!
        let myJson = JSON(data: data)
        
        for i in myJson{
            let test = i.1
            let title = test["EventTitle"].stringValue
            let hour = test["EventHour"].stringValue
            let type = test["EventType"].stringValue
            let location = test["EventLocation"].stringValue
            let day = test["EventDay"].stringValue

            saveItem(title,hour: hour,type: type,location: location,day: day)
        }
    }

    
    func getDictionary(DictionaryDePalestras:[[String:[Schedule]]],selectedIndex:Int) -> [String:[Schedule]] {
        if (selectedIndex < 6){
      //  Dictionary = DictionaryDePalestras[selectedIndex]
        
        } else {
            
        }
        return Dictionary
    }
    
}