//
//  Application+CoreDataProperties.swift
//  UnisaLift
//
//  Created by Carratu Carmine on 20/02/19.
//  Copyright © 2019 RottenApples. All rights reserved.
//
//

import Foundation
import CoreData


extension Application {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Application> {
        return NSFetchRequest<Application>(entityName: "Application")
    }

    @NSManaged public var applicationID: Int64
    @NSManaged public var message: String?
    @NSManaged public var pointDesc: String?
    @NSManaged public var pointGeo: String?
    @NSManaged public var state: Int32
    @NSManaged public var applicant: User?
    @NSManaged public var offer: Offer?

}
