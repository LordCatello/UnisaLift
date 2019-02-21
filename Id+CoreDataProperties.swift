//
//  Id+CoreDataProperties.swift
//  UnisaLift
//
//  Created by Carratu Carmine on 20/02/19.
//  Copyright © 2019 RottenApples. All rights reserved.
//
//

import Foundation
import CoreData


extension Id {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Id> {
        return NSFetchRequest<Id>(entityName: "Id")
    }

    @NSManaged public var progressiveID: Int64

}
