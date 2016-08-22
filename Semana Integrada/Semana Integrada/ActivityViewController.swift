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
    @IBAction func SegmentedControlBarAction(sender: AnyObject?) {
        self.tableView.reloadData()
        
    }
    private var foregroundNotification: NSObjectProtocol!
    var timer = NSTimer()
    
    var time = 10
    
    
    //let vet = ["Joao","Rodrigo","Carradas"]
    let scheduleDAO = ScheduleDAO()
    var dictionary = [String:[Schedule]]()
    var dictionaryGeneral = [ [String:[Schedule]] ]()
    var sortedKeys = [String]()
    
   
   
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.barStyle = UIBarStyle.BlackTranslucent
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 0.10, green: 0.74, blue: 0.61, alpha: 1.0); // Codigo para mudar a cor da Barra com o Titulo da tela
    }
    
    override func viewDidAppear(animated: Bool) {
        self.tableView.contentInset = UIEdgeInsetsMake(0, 0, 45, 0)
    }
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
    
        dictionaryGeneral = scheduleDAO.generatePalestras();
        SegmentedControlBar.items = ["Seg","Ter","Qua","Qui","Sex","Sab"]
        SegmentedControlBar.selectedIndex = 0
        swipe()
        
        
    }
  

    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        dictionarySelect(SegmentedControlBar.selectedIndex)
        return sortedKeys[section]
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        dictionarySelect(SegmentedControlBar.selectedIndex)
        return sortedKeys.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        
        //let cell = tableView.dequeueReusableCellWithIdentifier("eventCell", forIndexPath: indexPath)
        dictionarySelect(SegmentedControlBar.selectedIndex)
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
        
        if ( Palestra![indexPath.row].eventType == "Palestra"){
            cell?.eventType.textColor = UIColor(red: 0.96, green: 0.65, blue: 0.14, alpha: 1.0)
        }
        if ( Palestra![indexPath.row].eventType == "WorkShop"){
            cell?.eventType.textColor = UIColor(red: 0.12, green: 0.52, blue: 0.78, alpha: 1.0)
        }
        cell?.eventType.text = Palestra![indexPath.row].eventType
      
        cell?.eventDescription.text = Palestra![indexPath.row].eventTitle
        cell?.EventHour.text = Palestra![indexPath.row].eventLocation
        cell?.buttontappedAction = {
        cell -> Void in
            Palestra![indexPath.row].favorite = true
            
            //notifications implement ( NSDATE para STRING)
            let date = NSDate()
            let dateFormater = NSDateFormatter()
            dateFormater.dateFormat = "H:mm" // dd-MM-yyyy-H-mm
            let stringDate = dateFormater.stringFromDate(date)
            //var convertedTime = Int(stringDate) // caso queira comparar por Int
            
            
            
            print(stringDate)
 
            //notifications
            
            // Carradas
            let pushNotification = UIAlertController(title: "", message: "Para se inscrever nesta atividade,acesse o site da PUC.", preferredStyle: UIAlertControllerStyle.Alert)
            
            pushNotification.addAction(UIAlertAction(title: "Depois", style: UIAlertActionStyle.Default, handler: nil))
            pushNotification.addAction(UIAlertAction(title: "Acessar", style: UIAlertActionStyle.Default, handler: self.openSite))// nao sei porque tem q ser self e nao passar parametro, mas funciona
            
            UIApplicationWillEnterForegroundNotification
            self.presentViewController(pushNotification, animated: true, completion: nil)
            pushNotification.actions
        
            // Didi
            // Validação para o dia em relacao a string
            // ARRUMAR QUANDO OS OUTLETS ESTIVEREM SE COMUNICANDO \/
            if(stringDate == "17:50"){
           // if(stringDate == Palestra![indexPath.row].eventHour){
            let pushNotificationBackground  = UILocalNotification()
            
            pushNotificationBackground.alertBody = Palestra![indexPath.row].eventTitle! + "\nA sua atividade começará em 15 minutos!"
            
            
            UIApplication.sharedApplication().scheduleLocalNotification(pushNotificationBackground)
            }
        }
        
        
        
        return cell!
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        dictionarySelect(SegmentedControlBar.selectedIndex)
        let selectIndexPath = sender as! NSIndexPath
        let eventDetailsViewController = segue.destinationViewController as? ActivityDetailController
     
        let backItem = UIBarButtonItem()
        backItem.title = "Voltar"
        navigationItem.backBarButtonItem = backItem
        self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        
        let keys = sortedKeys
        
        let hourKey = keys[selectIndexPath.section]
        
        eventDetailsViewController?.event = dictionary[hourKey]![selectIndexPath.row]
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dictionarySelect(SegmentedControlBar.selectedIndex)
        let keys = sortedKeys
        let key = keys[section]
        let numberOfRows = dictionary[key]
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
    
    
    
    func notification(){
        
        let date = NSDate()
        let dateFormater = NSDateFormatter()
        dateFormater.dateFormat = "H:mm" // dd-MM-yyyy-H-mm
        let stringDate = dateFormater.stringFromDate(date)
        //var convertedTime = Int(stringDate) // caso queira comparar por Int
        
        // Didi
        // Validação para o dia em relacao a string
        // ARRUMAR QUANDO OS OUTLETS ESTIVEREM SE COMUNICANDO \/
        if(stringDate == "17:06"){
            // if(stringDate == Palestra![indexPath.row].eventHour){
            let pushNotificationBackground  = UILocalNotification()
            
            pushNotificationBackground.alertBody = "\nA sua atividade começará em 15 minutos!"
            
            
            UIApplication.sharedApplication().scheduleLocalNotification(pushNotificationBackground)
        }
    }
}
    
