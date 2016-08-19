//
//  ActivityDetailController.swift
//  Semana Integrada
//
//  Created by Aluno Projeto on 11/08/16.
//  Copyright © 2016 venturuspucc. All rights reserved.
//

import UIKit


class ActivityDetailController: UIViewController{

    @IBOutlet weak var placehouranddetaisl: UILabel!
    @IBOutlet weak var type: UILabel!
    @IBOutlet weak var titlee: UILabel!
    @IBOutlet weak var descriptionn: UILabel!
    @IBOutlet weak var lecturer: UILabel!
    @IBOutlet weak var company: UILabel!
    @IBOutlet weak var aboutCompany: UILabel!
    @IBOutlet weak var companyDetails: UILabel!

    
    
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
        type.text = event.eventType
        titlee.text = event.eventTitle
        descriptionn.text = event.eventDescription
        lecturer.text = event.eventLecturer
        company.text = event.lecturerCompany
        aboutCompany.text = "Sobre a \(event.lecturerCompany!)"
        companyDetails.text = event.companyDetails
       
    }
    
}