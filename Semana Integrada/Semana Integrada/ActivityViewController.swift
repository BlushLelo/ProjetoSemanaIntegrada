//
//  ActivityViewController.swift
//  Semana Integrada
//
//  Created by vntlab on 7/25/16.
//  Copyright © 2016 venturuspucc. All rights reserved.
//

import UIKit

class ActivyViewController: UIViewController,UITableViewDataSource{
    
    //let vet = ["Joao","Rodrigo","Carradas"]
    let scheduleDAO = ScheduleDAO()
    var dictionary = [String:[Schedule]]()
    var sortedKeys = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dictionary = scheduleDAO.generatePalestras();
        sortedKeys = Array(dictionary.keys).sort(<)
    }
    
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sortedKeys[section]
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return sortedKeys.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        
        //let cell = tableView.dequeueReusableCellWithIdentifier("eventCell", forIndexPath: indexPath)
        let keys = sortedKeys
        let key = keys[indexPath.section]
        let Palestra = dictionary[key]
        //cell.textLabel?.text = Palestra![indexPath.row].EventTitle
        
        
        var cell = tableView.dequeueReusableCellWithIdentifier("myCell") as? EventTableCellView
        
        if cell == nil {
            
            let cellNib = UINib(nibName: "EventTableCellView", bundle: nil)
            tableView.registerNib(cellNib, forCellReuseIdentifier: "myCell")
            cell = tableView.dequeueReusableCellWithIdentifier("myCell") as? EventTableCellView
            
        }
        
        cell?.myCellTitle.text = Palestra![indexPath.row].EventType
        cell?.myCellTitleDescription.text = Palestra![indexPath.row].EventTitle
        cell?.myCellHourDescription.text = Palestra![indexPath.row].EventLocation
        
        return  cell!
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let keys = sortedKeys
        let key = keys[section]
        let numberOfRows = dictionary[key]
        return numberOfRows!.count
    }
    
    
    
}
