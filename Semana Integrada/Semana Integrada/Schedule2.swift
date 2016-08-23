//
//  Schedule2.swift
//  Semana Integrada
//
//  Created by Aluno Projeto on 18/08/16.
//  Copyright © 2016 venturuspucc. All rights reserved.
//

import Foundation
import CoreData


class Schedule2: NSManagedObject {

// Insert code here to add functionality to your managed object subclass
    @NSManaged var eventDay: String?
    @NSManaged var eventHour: String?
    @NSManaged var eventTitle: String?
    @NSManaged var eventLocation: String?
    @NSManaged var favorite: NSNumber?
    
    
}
