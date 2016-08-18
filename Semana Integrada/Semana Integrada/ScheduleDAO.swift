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
 
    
    
 
    var Dictionary2 = [String:[NSManagedObject]]()
    var palestrasSeg2 = [String:[NSManagedObject]]()
    var palestrasTer2 = [String:[NSManagedObject]]()
    var palestrasQua2 = [String:[NSManagedObject]]()
    var palestrasQui2 = [String:[NSManagedObject]]()
    var palestrasSex2 = [String:[NSManagedObject]]()
    var palestrasSab2 = [String:[NSManagedObject]]()
    var palestrasGerais2 = [ [String:[NSManagedObject]] ]()
    var ListaDePalestras2 = [NSManagedObject]()
  
    
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
    
    func saveItem(scheduleToSave : NSManagedObject){
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        let entity = NSEntityDescription.entityForName("Schedule2", inManagedObjectContext: managedContext)
        let item = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: managedContext)
        item.setValue(scheduleToSave.valueForKey("eventTitle"), forKey: "eventTitle")
        item.setValue(scheduleToSave.valueForKey("eventHour"), forKey: "eventHour")
        item.setValue(scheduleToSave.valueForKey("eventType"), forKey: "eventType")
        item.setValue(scheduleToSave.valueForKey("eventLocation"), forKey: "eventLocation")
        item.setValue(scheduleToSave.valueForKey("eventDay"), forKey: "eventDay")

        
        do {
            try managedContext.save()
            ListaDePalestras2.append(item)
        }
        catch{
            print("error")
        }
        
        
    }
    
    func fetchThings() {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        let fetchRequest = NSFetchRequest(entityName: "Schedule2")
        
        do {
            let teste = try managedContext.executeRequest(fetchRequest)
            Dictionary2 = teste as! [String:[NSManagedObject]]
    }
        catch{
            
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
    
    func generatePalestras2() -> [ [String:[NSManagedObject]] ] {
        
        
        
        
        let filePath = NSBundle.mainBundle().pathForResource("Atividades1", ofType: "json")
        let data = NSData(contentsOfFile: filePath!)!
        let myJson = JSON(data: data)
        
        for i in myJson{
            let test = i.1
            let Palestra = NSManagedObject();
             Palestra.setValue(test["EventTitle"].stringValue, forKey: "eventTitle")
             Palestra.setValue(test["EventHour"].stringValue, forKey: "eventHour")
             Palestra.setValue(test["EventType"].stringValue, forKey: "eventType")
             Palestra.setValue(test["EventLocation"].stringValue, forKey: "eventLocation")
             Palestra.setValue(test["EventDay"].stringValue, forKey: "eventDay")
             let eventDay = Palestra.valueForKey("eventDay") as! String
             let eventHour = Palestra.valueForKey("eventHour") as! String
            if eventDay == "Seg"{
                if var array = palestrasSeg2[eventHour]{
                    array.append(Palestra)
                    saveItem(Palestra)
                    palestrasSeg2[eventHour] = array
                } else {
                    var array = [NSManagedObject]()
                    array.append(Palestra)
                    saveItem(Palestra)
                    palestrasSeg2[eventHour] = array
                }
                
            } else if eventDay == "Ter"{
                if var array = palestrasTer2[eventHour]{
                    array.append(Palestra)
                    palestrasTer2[eventHour] = array
                } else {
                    var array = [NSManagedObject]()
                    array.append(Palestra)
                    saveItem(Palestra)
                    palestrasTer2[eventHour] = array
                }
                
            }else   if eventDay == "Qua"{
                if var array = palestrasQua2[eventHour]{
                    array.append(Palestra)
                    saveItem(Palestra)
                    palestrasQua2[eventHour] = array
                } else {
                    var array = [NSManagedObject]()
                    array.append(Palestra)
                    saveItem(Palestra)
                    palestrasQua2[eventHour] = array
                }
                
            }else   if eventDay == "Qui"{
                if var array = palestrasQui2[eventHour]{
                    array.append(Palestra)
                    saveItem(Palestra)
                    palestrasQui2[eventHour] = array
                } else {
                    var array = [NSManagedObject]()
                    array.append(Palestra)
                    saveItem(Palestra)
                    palestrasQui2[eventHour] = array
                }
                
            }else   if eventDay == "Sex"{
                if var array = palestrasSex2[eventHour]{
                    array.append(Palestra)
                    saveItem(Palestra)
                    palestrasSex2[eventHour] = array
                } else {
                    var array = [NSManagedObject]()
                    array.append(Palestra)
                    saveItem(Palestra)
                    palestrasSex2[eventHour] = array
                }
                
            }else   if eventDay == "Sab"{
                if var array = palestrasSab2[eventHour]{
                    array.append(Palestra)
                    saveItem(Palestra)
                    palestrasSab2[eventHour] = array
                } else {
                    var array = [NSManagedObject]()
                    array.append(Palestra)
                    saveItem(Palestra)
                    palestrasSab2[eventHour] = array
                }
                
            }
            
        }
        
        
        
        
        palestrasGerais2.append(palestrasSeg2)
        palestrasGerais2.append(palestrasTer2)
        palestrasGerais2.append(palestrasQua2)
        palestrasGerais2.append(palestrasQui2)
        palestrasGerais2.append(palestrasSex2)
        palestrasGerais2.append(palestrasSab2)
        
        return palestrasGerais2
    }

    
    func getDictionary(DictionaryDePalestras:[[String:[Schedule]]],selectedIndex:Int) -> [String:[Schedule]] {
        if (selectedIndex < 6){
        Dictionary = DictionaryDePalestras[selectedIndex]
        
        } else {
            
        }
        return Dictionary
    }
    
    func getDictionary2(DictionaryDePalestras:[[String:[NSManagedObject]]],selectedIndex:Int) -> [String:[NSManagedObject]] {
        if (selectedIndex < 6){
            Dictionary2 = DictionaryDePalestras[selectedIndex]
            
        } else {
            
        }
        return Dictionary2
    }
    
}