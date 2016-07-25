//
//  ActivityViewController.swift
//  Semana Integrada
//
//  Created by vntlab on 7/25/16.
//  Copyright © 2016 venturuspucc. All rights reserved.
//

import UIKit

class ActivyViewController: UIViewController,UITableViewDataSource{
    
    let vet = ["Joao","Rodrigo","Carradas"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return vet[0]
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return vet.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("eventCell", forIndexPath: indexPath)
        cell.textLabel?.text = vet[indexPath.row]
        return  cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vet.count
    }
    
    
    
    
    
}
