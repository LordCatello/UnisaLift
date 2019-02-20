//
//  Review+CoreDataProperties.swift
//  UnisaLift
//
//  Created by Carratu Carmine on 20/02/19.
//  Copyright © 2019 RottenApples. All rights reserved.
//
//

import Foundation
import CoreData


extension Review {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Review> {
        return NSFetchRequest<Review>(entityName: "Review")
    }

    @NSManaged public var desc: String?
    @NSManaged public var rating: Int16
    @NSManaged public var reviewID: Int64
    @NSManaged public var reviewed: User?
    @NSManaged public var reviewer: User?

}
