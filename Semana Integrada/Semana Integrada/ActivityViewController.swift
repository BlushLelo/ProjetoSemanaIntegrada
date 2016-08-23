//
//  ActivityViewController.swift
//  Semana Integrada
//
//  Created by vntlab on 7/25/16.
//  Copyright © 2016 venturuspucc. All rights reserved.
//

import UIKit
import CoreData

class ActivyViewController: UIViewController,UITableViewDataSource,UITableViewDelegate{
    
 

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var SegmentedControlBar: SegmentedControl!
    @IBAction func SegmentedControlBarAction(sender: AnyObject?) {
        self.tableView.reloadData()
        
    }
    

    
    var timer = NSTimer()
    
    var time = 10
    
    
    //let vet = ["Joao","Rodrigo","Carradas"]
    let scheduleDAO = ScheduleDAO()
    var dictionary = [String:[Schedule]]()
    var dictionary2 = [String:[NSManagedObject]]()
    var dictionaryGeneral = [ [String:[Schedule]] ]()
    var dictionaryGeneral2 = [ [String:[NSManagedObject]] ]()
    var sortedKeys = [String]()
    var palestras = [Schedule2]()
    
    
    
    func fetchThings() {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        let fetchRequest = NSFetchRequest(entityName: "Schedule2")
        
        do {
            let teste = try managedContext.executeFetchRequest(fetchRequest) as! [Schedule2]
            if teste.count == 0{
                
            } else {
                palestras = teste
            }
            
            
        }
        catch{
            print("erro")
        }
    }
    
    
    
   

    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.barStyle = UIBarStyle.BlackTranslucent
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 0.10, green: 0.74, blue: 0.61, alpha: 1.0); // Codigo para mudar a cor da Barra com o Titulo da tela
        
    
        
        
        
    }
    
    override func viewDidAppear(animated: Bool) {
        self.tableView.contentInset = UIEdgeInsetsMake(0, 0, 58, 0)
    }
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
        scheduleDAO.generatePalestras2()
        fetchThings()
        for i in palestras {
            print (i.eventTitle)
        }
        SegmentedControlBar.items = ["Seg","Ter","Qua","Qui","Sex","Sab"]
        SegmentedControlBar.selectedIndex = 0
        swipe()
        
         timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: Selector("notification"), userInfo: nil, repeats: true)
    }
  

    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        dictionarySelect(SegmentedControlBar.selectedIndex)
        //dictionarySelect2(SegmentedControlBar.selectedIndex)
        return sortedKeys[section]
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        dictionarySelect(SegmentedControlBar.selectedIndex)
        //dictionarySelect2(SegmentedControlBar.selectedIndex)
        return sortedKeys.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        
        //let cell = tableView.dequeueReusableCellWithIdentifier("eventCell", forIndexPath: indexPath)
        
        
        dictionarySelect(SegmentedControlBar.selectedIndex)
        //dictionarySelect2(SegmentedControlBar.selectedIndex)
        
        let keys = sortedKeys
        let key = keys[indexPath.section]
        
        //let Palestra = dictionary[key]
        
        let Palestra = dictionary2[key]

        //cell.textLabel?.text = Palestra![indexPath.row].EventTitle
        
     
        var cell = tableView.dequeueReusableCellWithIdentifier("myCell") as? EventTableCellView
        
        if cell == nil {
            
            let cellNib = UINib(nibName: "customCellInterface", bundle: nil)
            tableView.registerNib(cellNib, forCellReuseIdentifier: "myCell")
            cell = tableView.dequeueReusableCellWithIdentifier("myCell") as? EventTableCellView
            
        }
/*
        
        if ( Palestra![indexPath.row].EventType == "Palestra"){
            cell?.eventType.textColor = UIColor(red: 0.96, green: 0.65, blue: 0.14, alpha: 1.0)
        }
        if ( Palestra![indexPath.row].EventType == "WorkShop"){
            cell?.eventType.textColor = UIColor(red: 0.12, green: 0.52, blue: 0.78, alpha: 1.0)
        }
        cell?.eventType.text = Palestra![indexPath.row].EventType
      
        cell?.eventDescription.text = Palestra![indexPath.row].EventTitle
        cell?.EventHour.text = Palestra![indexPath.row].EventLocation
        cell?.buttontappedAction = {
        cell -> Void in
            Palestra![indexPath.row].favorite = true
            
            //notifications
            let pushNotification = UIAlertController(title: "", message: "Para se inscrever nesta atividade,acesse o site da PUC.", preferredStyle: UIAlertControllerStyle.Alert)
            
            pushNotification.addAction(UIAlertAction(title: "Depois", style: UIAlertActionStyle.Default, handler: nil))
            pushNotification.addAction(UIAlertAction(title: "Acessar", style: UIAlertActionStyle.Default, handler: self.openSite))// nao sei porque tem q ser self e nao passar parametro, mas funciona
                
            self.presentViewController(pushNotification, animated: true, completion: nil)
            
        }
  */    let eventType = Palestra![indexPath.row].valueForKey("eventType") as? String
        let eventTitle = Palestra![indexPath.row].valueForKey("eventTitle") as? String
        let eventLocation = Palestra![indexPath.row].valueForKey("eventLocation") as? String
        
        if ( eventType == "Palestra"){
            cell?.eventType.textColor = UIColor(red: 0.96, green: 0.65, blue: 0.14, alpha: 1.0)
        }
        if ( eventType == "WorkShop"){
            cell?.eventType.textColor = UIColor(red: 0.12, green: 0.52, blue: 0.78, alpha: 1.0)
        }
        cell?.eventType.text = eventType
        
        cell?.eventDescription.text = eventTitle
        cell?.EventHour.text = eventLocation
        cell?.buttontappedAction = {
            cell -> Void in
            Palestra![indexPath.row].setValue(true, forKey: "favorite")
            
            //notifications
            let pushNotification = UIAlertController(title: "", message: "Para se inscrever nesta atividade,acesse o site da PUC.", preferredStyle: UIAlertControllerStyle.Alert)
            
            pushNotification.addAction(UIAlertAction(title: "Depois", style: UIAlertActionStyle.Default, handler: nil))
            pushNotification.addAction(UIAlertAction(title: "Acessar", style: UIAlertActionStyle.Default, handler: self.openSite))// nao sei porque tem q ser self e nao passar parametro, mas funciona
            
            self.presentViewController(pushNotification, animated: true, completion: nil)
            
        }

        
        
        return cell!
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
      dictionarySelect(SegmentedControlBar.selectedIndex)
        
      //  dictionarySelect2(SegmentedControlBar.selectedIndex)
        let selectIndexPath = sender as! NSIndexPath
        let eventDetailsViewController = segue.destinationViewController as? ActivityDetailController
     
        let backItem = UIBarButtonItem()
        backItem.title = "Voltar"
        navigationItem.backBarButtonItem = backItem
        self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        
        let keys = sortedKeys
        
        let hourKey = keys[selectIndexPath.section]
        
        //eventDetailsViewController?.event = dictionary[hourKey]![selectIndexPath.row]
        eventDetailsViewController?.event2 = dictionary2[hourKey]![selectIndexPath.row]
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dictionarySelect(SegmentedControlBar.selectedIndex)
     //   dictionarySelect2(SegmentedControlBar.selectedIndex)
        let keys = sortedKeys
        let key = keys[section]
      //  let numberOfRows = dictionary[key]
        let numberOfRows = dictionary2[key]
        return numberOfRows!.count
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.performSegueWithIdentifier("DetailSegue", sender: indexPath)
        
    }
    
    
    

    
    
    

    func swipe () {
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(ActivyViewController.rightSwipe(_:)))
        swipeRight.direction = UISwipeGestureRecognizerDirection.Right
        self.view.addGestureRecognizer(swipeRight)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(ActivyViewController.leftSwipe(_:)))
        swipeLeft.direction = UISwipeGestureRecognizerDirection.Left
        self.view.addGestureRecognizer(swipeLeft)
        
    }
    
    
    func rightSwipe(gestureReconizer: UISwipeGestureRecognizer) {
        
        if self.SegmentedControlBar.selectedIndex > 0 {
            
            self.SegmentedControlBar.selectedIndex -= 1
            
            self.tableView.reloadData()
            
        }
        else{
            
        }
    }

    func leftSwipe(gestureReconizer: UISwipeGestureRecognizer) {
        
        if self.SegmentedControlBar.selectedIndex >= 6 {
            
            
        }
        else{
            self.SegmentedControlBar.selectedIndex += 1
            
            self.tableView.reloadData()
        }
    }

    
    func dictionarySelect(index:Int) {
            dictionary = scheduleDAO.getDictionary(dictionaryGeneral, selectedIndex: index)
            sortedKeys = Array(dictionary.keys).sort(<)
    }

    

    func openSite(alert:UIAlertAction!){
        let url = NSURL(string: "http://semanaintegrada.com.br/")
        UIApplication.sharedApplication().openURL(url!)

    }
    
    func getData(){
        
        let date = NSDate()
        let calendar = NSCalendar.currentCalendar()
        let components = calendar.components([.NSHourCalendarUnit, .NSMinuteCalendarUnit], fromDate: date)
        
        let hour = components.hour
        let minutes = components.minute

    }
    
    
    func notification(){
        
        time -= 1
        
        if time <= 0 {
            
        
        var Notification = UILocalNotification()
        
        Notification.alertAction = "Go back to app"
        Notification.alertBody = "Sua palestra começa em 15 minutos."
        
        Notification.fireDate = NSDate(timeIntervalSinceNow: 0)
            
            
        UIApplication.sharedApplication().scheduleLocalNotification(Notification)
            
            timer.invalidate()
        }
        
    }
    
    
}
