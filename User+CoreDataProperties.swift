//
//  User+CoreDataProperties.swift
//  UnisaLift
//
//  Created by Carratu Carmine on 20/02/19.
//  Copyright © 2019 RottenApples. All rights reserved.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var carModel: String?
    @NSManaged public var degreeCourse: String?
    @NSManaged public var desc: String?
    @NSManaged public var email: String?
    @NSManaged public var employeeNumber: String?
    @NSManaged public var fiscalCode: String?
    @NSManaged public var imageFullRes: NSData?
    @NSManaged public var imageThumbnail: NSData?
    @NSManaged public var logged: Bool
    @NSManaged public var name: String?
    @NSManaged public var rating: Int16
    @NSManaged public var serialNumber: String?
    @NSManaged public var state: Int16
    @NSManaged public var surname: String?
    @NSManaged public var userID: Int64
    @NSManaged public var aboutMeReviews: NSSet?
    @NSManaged public var applications: NSSet?
    @NSManaged public var byMeReviews: NSSet?
    @NSManaged public var notifications: NSSet?
    @NSManaged public var offers: NSSet?

}

// MARK: Generated accessors for aboutMeReviews
extension User {

    @objc(addAboutMeReviewsObject:)
    @NSManaged public func addToAboutMeReviews(_ value: Review)

    @objc(removeAboutMeReviewsObject:)
    @NSManaged public func removeFromAboutMeReviews(_ value: Review)

    @objc(addAboutMeReviews:)
    @NSManaged public func addToAboutMeReviews(_ values: NSSet)

    @objc(removeAboutMeReviews:)
    @NSManaged public func removeFromAboutMeReviews(_ values: NSSet)

}

// MARK: Generated accessors for applications
extension User {

    @objc(addApplicationsObject:)
    @NSManaged public func addToApplications(_ value: Application)

    @objc(removeApplicationsObject:)
    @NSManaged public func removeFromApplications(_ value: Application)

    @objc(addApplications:)
    @NSManaged public func addToApplications(_ values: NSSet)

    @objc(removeApplications:)
    @NSManaged public func removeFromApplications(_ values: NSSet)

}

// MARK: Generated accessors for byMeReviews
extension User {

    @objc(addByMeReviewsObject:)
    @NSManaged public func addToByMeReviews(_ value: Review)

    @objc(removeByMeReviewsObject:)
    @NSManaged public func removeFromByMeReviews(_ value: Review)

    @objc(addByMeReviews:)
    @NSManaged public func addToByMeReviews(_ values: NSSet)

    @objc(removeByMeReviews:)
    @NSManaged public func removeFromByMeReviews(_ values: NSSet)

}

// MARK: Generated accessors for notifications
extension User {

    @objc(addNotificationsObject:)
    @NSManaged public func addToNotifications(_ value: Notification)

    @objc(removeNotificationsObject:)
    @NSManaged public func removeFromNotifications(_ value: Notification)

    @objc(addNotifications:)
    @NSManaged public func addToNotifications(_ values: NSSet)

    @objc(removeNotifications:)
    @NSManaged public func removeFromNotifications(_ values: NSSet)

}

// MARK: Generated accessors for offers
extension User {

    @objc(addOffersObject:)
    @NSManaged public func addToOffers(_ value: Offer)

    @objc(removeOffersObject:)
    @NSManaged public func removeFromOffers(_ value: Offer)

    @objc(addOffers:)
    @NSManaged public func addToOffers(_ values: NSSet)

    @objc(removeOffers:)
    @NSManaged public func removeFromOffers(_ values: NSSet)

}
