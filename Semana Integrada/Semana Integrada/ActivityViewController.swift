//
//  ActivityViewController.swift
//  Semana Integrada
//
//  Created by vntlab on 7/25/16.
//  Copyright © 2016 venturuspucc. All rights reserved.
//

import UIKit

class ActivyViewController: UIViewController,UITableViewDataSource,UITableViewDelegate{
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var SegmentedControlBar: SegmentedControl!
    
    //let vet = ["Joao","Rodrigo","Carradas"]
    let scheduleDAO = ScheduleDAO()
    var dictionary = [String:[Schedule]]()
    var dictionaryGeneral = [ [String:[Schedule]] ]()
    var sortedKeys = [String]()
    
   
   
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        SegmentedControlBar.addTarget(self, action: "test:", forControlEvents: .ValueChanged)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dictionaryGeneral = scheduleDAO.generatePalestras();
        SegmentedControlBar.items = ["Seg","Ter","Qua","Qui","Sex","Sab"]
        SegmentedControlBar.selectedIndex = 0
        
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: "rightSwipe:")
        swipeRight.direction = UISwipeGestureRecognizerDirection.Right
        self.view.addGestureRecognizer(swipeRight)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: "leftSwipe:")
        swipeLeft.direction = UISwipeGestureRecognizerDirection.Left
        self.view.addGestureRecognizer(swipeLeft)
        
        
    }
    
    func test (sender: AnyObject?) {
        if SegmentedControlBar.selectedIndex == 0 {
            dictionary = dictionaryGeneral[0]
            sortedKeys = Array(dictionary.keys).sort(<)
            
        } else if SegmentedControlBar.selectedIndex == 1 {
            dictionary = dictionaryGeneral[1]
            sortedKeys = Array(dictionary.keys).sort(<)
            
        } else if SegmentedControlBar.selectedIndex == 2 {
            dictionary = dictionaryGeneral[2]
            sortedKeys = Array(dictionary.keys).sort(<)
            
        } else if SegmentedControlBar.selectedIndex == 3{
            dictionary = dictionaryGeneral[3]
            sortedKeys = Array(dictionary.keys).sort(<)
            
        } else if SegmentedControlBar.selectedIndex == 4 {
            dictionary = dictionaryGeneral[4]
            sortedKeys = Array(dictionary.keys).sort(<)
            
        } else if SegmentedControlBar.selectedIndex == 5 {
            dictionary = dictionaryGeneral[5]
            sortedKeys = Array(dictionary.keys).sort(<)
            
        }
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
            
            let cellNib = UINib(nibName: "customCellInterface", bundle: nil)
            tableView.registerNib(cellNib, forCellReuseIdentifier: "myCell")
            cell = tableView.dequeueReusableCellWithIdentifier("myCell") as? EventTableCellView
            
        }
        if ( Palestra![indexPath.row].EventType == "Palestra"){
            cell?.eventType.textColor = UIColor(red: 0.96, green: 0.65, blue: 0.14, alpha: 1.0)
        }
        if ( Palestra![indexPath.row].EventType == "WorkShop"){
            cell?.eventType.textColor = UIColor(red: 0.12, green: 0.52, blue: 0.78, alpha: 1.0)
        }
        cell?.eventType.text = Palestra![indexPath.row].EventType
      
        cell?.eventDescription.text = Palestra![indexPath.row].EventTitle
        cell?.EventHour.text = Palestra![indexPath.row].EventLocation
        
        
        
        return cell!
    }

    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let keys = sortedKeys
        let key = keys[section]
        let numberOfRows = dictionary[key]
        return numberOfRows!.count
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let selectIndexPath = tableView.indexPathForSelectedRow
        let eventDetailsViewController = segue.destinationViewController as? ActivityDetailController
        
        let keys = Array(dictionary.keys)
        
        let hourKey = keys[selectIndexPath!.section]
        
        eventDetailsViewController?.event = dictionary[hourKey]![selectIndexPath!.row]
        
        

    }
    
    
    
    @IBAction func SegmentedControlBarAction(sender: AnyObject?) {
    //  self.tableView.reloadData()

    }
    
    func rightSwipe(gestureReconizer: UISwipeGestureRecognizer) {
        
        if self.SegmentedControlBar.selectedIndex > 0 {
            
            self.SegmentedControlBar.selectedIndex -= 1
        }
        else{
            
        }
    }

    func leftSwipe(gestureReconizer: UISwipeGestureRecognizer) {
        
        if self.SegmentedControlBar.selectedIndex >= 6 {
            
            
        }
        else{
            self.SegmentedControlBar.selectedIndex += 1
        }
    }

    
    
    
}
