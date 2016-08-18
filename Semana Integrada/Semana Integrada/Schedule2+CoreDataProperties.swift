//
//  Schedule2+CoreDataProperties.swift
//  Semana Integrada
//
//  Created by Aluno Projeto on 18/08/16.
//  Copyright © 2016 venturuspucc. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Schedule2 {

    @NSManaged var eventDay: String?
    @NSManaged var eventHour: String?
    @NSManaged var eventTitle: String?
    @NSManaged var eventLocation: String?
    @NSManaged var favorite: NSNumber?

}
