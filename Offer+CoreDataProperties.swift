//
//  Offer+CoreDataProperties.swift
//  UnisaLift
//
//  Created by Carratu Carmine on 20/02/19.
//  Copyright © 2019 RottenApples. All rights reserved.
//
//

import Foundation
import CoreData


extension Offer {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Offer> {
        return NSFetchRequest<Offer>(entityName: "Offer")
    }

    @NSManaged public var desc: String?
    @NSManaged public var endDate: NSDate?
    @NSManaged public var endPointDesc: String?
    @NSManaged public var endPointGeo: String?
    @NSManaged public var freeSpots: Int16
    @NSManaged public var message: String?
    @NSManaged public var offerID: Int64
    @NSManaged public var priceInt: Int64
    @NSManaged public var priceString: String?
    @NSManaged public var startDate: NSDate?
    @NSManaged public var startPointDesc: String?
    @NSManaged public var startPointGeo: String?
    @NSManaged public var state: Int16
    @NSManaged public var totalSpots: Int16
    @NSManaged public var type: Int16
    @NSManaged public var applications: NSSet?
    @NSManaged public var offerer: User?

}

// MARK: Generated accessors for applications
extension Offer {

    @objc(addApplicationsObject:)
    @NSManaged public func addToApplications(_ value: Application)

    @objc(removeApplicationsObject:)
    @NSManaged public func removeFromApplications(_ value: Application)

    @objc(addApplications:)
    @NSManaged public func addToApplications(_ values: NSSet)

    @objc(removeApplications:)
    @NSManaged public func removeFromApplications(_ values: NSSet)

}
