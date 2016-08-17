//
//  FavoritesViewController.swift
//  Semana Integrada
//
//  Created by vntlab on 7/25/16.
//  Copyright © 2016 venturuspucc. All rights reserved.
//

import UIKit

class FavoritesViewController: UIViewController,UITableViewDataSource, UITableViewDelegate{
    
    
    @IBOutlet weak var SegmentedControlBar: SegmentedControl!
    var task:NSMutableArray! = NSMutableArray()
    let scheduleDAO = ScheduleDAO()
    var dictionary = [String:[Schedule]]()
    var sortedKeys = [String]()
    var favoriteDictionary = [String:[Schedule]]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
      //  dictionary = scheduleDAO.generatePalestras();
        //
      
        navigationItem.title = "Favoritos"
        self.navigationController?.navigationBar.barStyle = UIBarStyle.BlackTranslucent
        
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 0.10, green: 0.74, blue: 0.61, alpha: 1.0); // Codigo para mudar a cor da Barra com o Titulo da tela

        swipe()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        
        
        generateFavorites()
        sortedKeys = Array(favoriteDictionary.keys).sort(<)
    }
    
    func generateFavorites(){
        for key in dictionary.keys{
            let hourEvents = dictionary[key]
            for hourEvent in hourEvents! {
                if hourEvent.favorite == true{
                    if var array = favoriteDictionary[hourEvent.EventHour!]{
                        array.append(hourEvent);
                        favoriteDictionary[hourEvent.EventHour!] = array;
                    } else {
                        var array = [Schedule]();
                        array.append(hourEvent)
                        favoriteDictionary[hourEvent.EventHour!] = array;
                    }
                }
            }
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
        let Palestra = favoriteDictionary[key]
        //cell.textLabel?.text = Palestra![indexPath.row].EventTitle

        
        var cell = tableView.dequeueReusableCellWithIdentifier("myCell") as? EventTableCellView
        
        if cell == nil {
            
            let cellNib = UINib(nibName: "customCellInterface", bundle: nil)
            tableView.registerNib(cellNib, forCellReuseIdentifier: "myCell")
            cell = tableView.dequeueReusableCellWithIdentifier("myCell") as? EventTableCellView
            
        }
        
        
        
        
        if ( Palestra![indexPath.row].EventType == "Palestra" ){
            cell?.eventType.textColor = UIColor(red: 0.96, green: 0.65, blue: 0.14, alpha: 1.0)
        }
        
        
        if ( Palestra![indexPath.row].EventType == "WorkShop" ){
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
      let numberOfRows = favoriteDictionary[key]
     return numberOfRows!.count
    }

    func swipe () {
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(FavoritesViewController.rightSwipe(_:)))
        swipeRight.direction = UISwipeGestureRecognizerDirection.Right
        self.view.addGestureRecognizer(swipeRight)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(FavoritesViewController.leftSwipe(_:)))
        swipeLeft.direction = UISwipeGestureRecognizerDirection.Left
        self.view.addGestureRecognizer(swipeLeft)
        
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

    
    

    

