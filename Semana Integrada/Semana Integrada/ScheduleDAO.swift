//
//  ScheduleDAO.swift
//  Semana Integrada
//
//  Created by vntlab on 7/26/16.
//  Copyright © 2016 venturuspucc. All rights reserved.
//

import Foundation

class ScheduleDAO : EventTableCellView {
 

    
    var Dictionary = [String:[Schedule]]()
    var palestrasSeg = [String:[Schedule]]()
    var palestrasTer = [String:[Schedule]]()
    var palestrasQua = [String:[Schedule]]()
    var palestrasQui = [String:[Schedule]]()
    var palestrasSex = [String:[Schedule]]()
    var palestrasSab = [String:[Schedule]]()
    var palestrasGerais = [ [String:[Schedule]] ]()
    var ListaDePalestras = [Schedule]()
    
    
    
    
    func generatePalestras() -> [ [String:[Schedule]] ] {
        
        let filePath = NSBundle.mainBundle().pathForResource("Atividades1", ofType: "json")
        let data = NSData(contentsOfFile: filePath!)!
        let myJson = JSON(data: data)
        
        for i in myJson{
            let test = i.1
            let Palestra = Schedule();
            Palestra.eventTitle = test["EventTitle"].stringValue
            Palestra.eventHour = test["EventHour"].stringValue
            Palestra.eventType = test["EventType"].stringValue
            Palestra.eventLocation = test["EventLocation"].stringValue
            Palestra.eventDay = test["EventDay"].stringValue
            Palestra.eventLecturer = test["EventLecturer"].stringValue
            Palestra.eventVacancies = test["EventVacancies"].stringValue
            Palestra.lecturerCompany = test["LecturerCompany"].stringValue
            Palestra.companyDetails = test["CompanyDetaisl"].stringValue
            Palestra.eventDescription = test ["EventDescription"].stringValue
            Palestra.favorite = Favoritado()
            if Palestra.eventDay == "Seg"{
                if var array = palestrasSeg[Palestra.eventHour!]{
                    array.append(Palestra);
                    palestrasSeg[Palestra.eventHour!] = array;
                } else {
                    var array = [Schedule]();
                    array.append(Palestra)
                    palestrasSeg[Palestra.eventHour!] = array;
                }
                
            } else   if Palestra.eventDay == "Ter"{
                if var array = palestrasTer[Palestra.eventHour!]{
                    array.append(Palestra);
                    palestrasTer[Palestra.eventHour!] = array;
                } else {
                    var array = [Schedule]();
                    array.append(Palestra)
                    palestrasTer[Palestra.eventHour!] = array;
                }
                
            }else   if Palestra.eventDay == "Qua"{
                if var array = palestrasQua[Palestra.eventHour!]{
                    array.append(Palestra);
                    palestrasQua[Palestra.eventHour!] = array;
                } else {
                    var array = [Schedule]();
                    array.append(Palestra)
                    palestrasQua[Palestra.eventHour!] = array;
                }
                
            }else   if Palestra.eventDay == "Qui"{
                if var array = palestrasQui[Palestra.eventHour!]{
                    array.append(Palestra);
                    palestrasQui[Palestra.eventHour!] = array;
                } else {
                    var array = [Schedule]();
                    array.append(Palestra)
                    palestrasQui[Palestra.eventHour!] = array;
                }
                
            }else   if Palestra.eventDay == "Sex"{
                if var array = palestrasSex[Palestra.eventHour!]{
                    array.append(Palestra);
                    palestrasSex[Palestra.eventHour!] = array;
                } else {
                    var array = [Schedule]();
                    array.append(Palestra)
                    palestrasSex[Palestra.eventHour!] = array;
                }
                
            }else   if Palestra.eventDay == "Sab"{
                if var array = palestrasSab[Palestra.eventHour!]{
                    array.append(Palestra);
                    palestrasSab[Palestra.eventHour!] = array;
                } else {
                    var array = [Schedule]();
                    array.append(Palestra)
                    palestrasSab[Palestra.eventHour!] = array;
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
    
    func getDictionary(DictionaryDePalestras:[[String:[Schedule]]],selectedIndex:Int) -> [String:[Schedule]] {
        if (selectedIndex < 6){
        Dictionary = DictionaryDePalestras[selectedIndex]
        
        } else {
            
        }
        return Dictionary
    }
    
}