//
//  ActivityDetailController.swift
//  Semana Integrada
//
//  Created by Aluno Projeto on 11/08/16.
//  Copyright © 2016 venturuspucc. All rights reserved.
//

import UIKit


class ActivityDetailController: UIViewController{

    
    @IBOutlet weak var SubtitleView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var placehouranddetaisl: UILabel!
    @IBOutlet weak var type: UILabel!
    @IBOutlet weak var titlee: UILabel!
    @IBOutlet weak var descriptionn: UILabel!
    @IBOutlet weak var lecturer: UILabel!
    @IBOutlet weak var company: UILabel!
    @IBOutlet weak var aboutCompany: UILabel!
    @IBOutlet weak var companyDescription: UILabel!
    

    
    
    var event = Schedule()
   
    func setTitle(title:String, subtitle:String) -> UIView {
        //Create a label programmatically and give it its property's
        let titleLabel = UILabel(frame: CGRectMake(0, 0, 0, 0)) //x, y, width, height where y is to offset from the view center
        titleLabel.backgroundColor = UIColor.clearColor()
        titleLabel.textColor = UIColor.whiteColor()
        titleLabel.font = UIFont.boldSystemFontOfSize(17)
        titleLabel.text = title
        titleLabel.sizeToFit()
        
        //Create a label for the Subtitle
        let subtitleLabel = UILabel(frame: CGRectMake(0, 18, 0, 0))
        subtitleLabel.backgroundColor = UIColor.clearColor()
        subtitleLabel.textColor = UIColor.whiteColor()
        subtitleLabel.font = UIFont.systemFontOfSize(17)
        subtitleLabel.text = subtitle
        subtitleLabel.sizeToFit()
        
        // Create a view and add titleLabel and subtitleLabel as subviews setting
        let titleView = UIView(frame: CGRectMake(0, 0, max(titleLabel.frame.size.width, subtitleLabel.frame.size.width), 30))
        
        // Center title or subtitle on screen (depending on which is larger)
        if titleLabel.frame.width >= subtitleLabel.frame.width {
            var adjustment = subtitleLabel.frame
            adjustment.origin.x = titleView.frame.origin.x + (titleView.frame.width/2) - (subtitleLabel.frame.width/2)
            subtitleLabel.frame = adjustment
        } else {
            var adjustment = titleLabel.frame
            adjustment.origin.x = titleView.frame.origin.x + (titleView.frame.width/2) - (titleLabel.frame.width/2)
            titleLabel.frame = adjustment
        }
        
        titleView.addSubview(titleLabel)
        titleView.addSubview(subtitleLabel)
        
        return titleView
    }
    
    override func viewDidLoad() {
        
        self.navigationItem.titleView = setTitle(event.eventTitle!, subtitle: event.eventHour!)
       
        placehouranddetaisl.text = "\(event.eventLocation!) - \(event.eventHour!) | \(event.eventVacancies!) vagas"
        
        if ( event.eventType == "Palestra"){
            type.textColor = UIColor(red: 0.96, green: 0.65, blue: 0.14, alpha: 1.0)
        }
        if ( event.eventType == "WorkShop"){
            type.textColor = UIColor(red: 0.12, green: 0.52, blue: 0.78, alpha: 1.0)
        }
        
        

        type.text = event.eventType
        titlee.text = event.eventTitle
        descriptionn.text = event.eventDescription
        lecturer.text = event.eventLecturer
        company.text = event.lecturerCompany
        aboutCompany.text = "Sobre a \(event.lecturerCompany!)"
        companyDescription.text = event.eventDescription
        descriptionn.sizeToFit()
        descriptionn.numberOfLines = 0;
        
       
        let string = event.eventLocation
        if let range = string!.rangeOfString(" ") {
         //   print(string!.substringToIndex(range.startIndex))
            
            if(string!.substringToIndex(range.startIndex) == "Dom"){
                 imageView.image = UIImage(named: "dom_gilberto_cropped")
            }
            if(string!.substringToIndex(range.startIndex) == "H01"){
                imageView.image = UIImage(named: "h01_cropped")

            }
            if(string!.substringToIndex(range.startIndex) == "H02"){
                imageView.image = UIImage(named: "h02_cropped")

            }
            if(string!.substringToIndex(range.startIndex) == "H06"){
                imageView.image = UIImage(named: "h06_cropped")

            }
            if(string!.substringToIndex(range.startIndex) == "H08"){
                imageView.image = UIImage(named: "h08_cropped")

            }
            if(string!.substringToIndex(range.startIndex) == "H10"){
                imageView.image = UIImage(named: "h10_cropped")

            }
            if(string!.substringToIndex(range.startIndex) == "H14"){
                imageView.image = UIImage(named: "h14_cropped")

            }else{
                
            }
                
            
        }
    }
    
    
    
}