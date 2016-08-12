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
            Palestra.EventTitle = test["EventTitle"].stringValue
            Palestra.EventHour = test["EventHour"].stringValue
            Palestra.EventType = test["EventType"].stringValue
            Palestra.EventLocation = test["EventLocation"].stringValue
            Palestra.EventDay = test["EventDay"].stringValue
            Palestra.favorite = Favoritado()
            if Palestra.EventDay == "Seg"{
            if var array = palestrasSeg[Palestra.EventHour!]{
                array.append(Palestra);
                palestrasSeg[Palestra.EventHour!] = array;
            } else {
                var array = [Schedule]();
                array.append(Palestra)
                palestrasSeg[Palestra.EventHour!] = array;
            }
            
            } else   if Palestra.EventDay == "Ter"{
                if var array = palestrasTer[Palestra.EventHour!]{
                    array.append(Palestra);
                    palestrasTer[Palestra.EventHour!] = array;
                } else {
                    var array = [Schedule]();
                    array.append(Palestra)
                    palestrasTer[Palestra.EventHour!] = array;
                }
                
            }else   if Palestra.EventDay == "Qua"{
                if var array = palestrasQua[Palestra.EventHour!]{
                    array.append(Palestra);
                    palestrasQua[Palestra.EventHour!] = array;
                } else {
                    var array = [Schedule]();
                    array.append(Palestra)
                    palestrasQua[Palestra.EventHour!] = array;
                }
                
            }else   if Palestra.EventDay == "Qui"{
                if var array = palestrasQui[Palestra.EventHour!]{
                    array.append(Palestra);
                    palestrasQui[Palestra.EventHour!] = array;
                } else {
                    var array = [Schedule]();
                    array.append(Palestra)
                    palestrasQui[Palestra.EventHour!] = array;
                }
                
            }else   if Palestra.EventDay == "Sex"{
                if var array = palestrasSex[Palestra.EventHour!]{
                    array.append(Palestra);
                    palestrasSex[Palestra.EventHour!] = array;
                } else {
                    var array = [Schedule]();
                    array.append(Palestra)
                    palestrasSex[Palestra.EventHour!] = array;
                }
                
            }else   if Palestra.EventDay == "Sab"{
                if var array = palestrasSab[Palestra.EventHour!]{
                    array.append(Palestra);
                    palestrasSab[Palestra.EventHour!] = array;
                } else {
                    var array = [Schedule]();
                    array.append(Palestra)
                    palestrasSab[Palestra.EventHour!] = array;
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
    
}