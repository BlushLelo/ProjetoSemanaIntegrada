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
    var dictionary = [String:Schedule]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dictionary = scheduleDAO.generatePalestras();
    }

    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let keys = Array(dictionary.keys)
        return keys[section]
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return dictionary.keys.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("eventCell", forIndexPath: indexPath)
        let keys = Array(dictionary.keys)
        let key = keys[indexPath.section]
        let events = dictionary[key]
        cell.textLabel?.text = events?.EventTitle
        return  cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let keys = Array(dictionary.keys)
        let key = keys.count
        return key
    }
    
    

}
