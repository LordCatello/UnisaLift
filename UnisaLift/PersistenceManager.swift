//
//  PersistenceManager.swift
//  UnisaLift
//
//  Created by Carratu Carmine on 20/02/19.
//  Copyright © 2019 RottenApples. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class PersistenceManager {
    static func getContext () -> NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        return appDelegate.persistentContainer.viewContext
    }
    
    // questa funzione deve essere chiamata una sola volta
    static func newProgressiveID () -> Id {
        let context = getContext()
        
        let id = NSEntityDescription.insertNewObject(forEntityName: "Id", into: context) as! Id
        
        // il primo elemento dovrà avere ID == 1
        id.progressiveID = 0;
        
        return id
    }
    
    // funzione di test che restituisce un utente di default
    // ovviamente tale funzione nella versione funzionante dell'applicazione non deve esistere
    static func newDefaultUser () -> User {
        let context = getContext()
        
        let user = NSEntityDescription.insertNewObject(forEntityName: "User", into: context) as! User
        
        // let empty = NSLocalizedString("empty", comment: "emptyitem")
        // è utile per la localizzazione
        // serve per cambiare lingua in maniera dinamica
        
        user.name = "defaultName"
        user.carModel = "defaultCarModel"
        user.email = "defaultEmail"
        
        return user
    }
    
    static func newUser (carModel: String, email: String, name: String, surname: String, imageFullRes: NSData) -> User {
        let context = getContext()
        
        let user = NSEntityDescription.insertNewObject(forEntityName: "User", into: context) as! User
        
        user.carModel = carModel
        user.email = email
        user.name = name
        user.surname = surname
        user.imageFullRes = imageFullRes
        
        return user
    }
    
    static func newDefaultOffer () -> Offer {
        let context = getContext()
        
        let offer = NSEntityDescription.insertNewObject(forEntityName: "Offer", into: context) as! Offer
        
        // let empty = NSLocalizedString("empty", comment: "emptyitem")
        // è utile per la localizzazione
        // serve per cambiare lingua in maniera dinamica
        
        offer.offerID = 10
        offer.desc = "defaultOffer"
        offer.freeSpots = 10
        offer.startPointDesc = "defaultStartPointDesc"
        offer.endPointDesc = "defaultEndPointDesc"
        
        return offer
    }
    
    static func newOffer (endPointDesc: String, message: String, startDate: Date, startPointDesc: String, totalSpots: Int, offerer: User, startPointLat: Double, startPointLong: Double, endPointLat: Double, endPointLong: Double) -> Offer {
        let context = getContext()
        
        let offer = NSEntityDescription.insertNewObject(forEntityName: "Offer", into: context) as! Offer
        
        let tempId = fetchProgressiveID()
        tempId?.progressiveID = (tempId?.progressiveID)! + 1
        
        offer.offerID = (tempId?.progressiveID)!
        offer.endPointDesc = endPointDesc
        offer.message = message
        offer.startDate = startDate as NSDate
        offer.startPointDesc = startPointDesc
        offer.totalSpots = Int16(totalSpots)
        offer.freeSpots = Int16(totalSpots)
        offer.offerer = offerer
        offer.startPointLat = startPointLat
        offer.startPointLong = startPointLong
        offer.endPointLat = endPointLat
        offer.endPointLong = endPointLong
        offer.state = 1 // verificare se funziona
        
        return offer
    }
    
    static func newApplication (offer: Offer, applicant: User) -> Application {
        let context = getContext()
        
        let application = NSEntityDescription.insertNewObject(forEntityName: "Application", into: context) as! Application
        
        let tempId = fetchProgressiveID()
        tempId?.progressiveID = (tempId?.progressiveID)! + 1
        
        application.applicationID = (tempId?.progressiveID)!
        application.offer = offer
        application.applicant = applicant
        // lo stato è 1: in corso
        application.state = 1
        
        return application
    }
    
    static func fetchProgressiveID() -> Id? {
        var ids: [Id]!
        
        let context = getContext()
        
        let fetchRequest = NSFetchRequest<Id>(entityName: "Id")
        
        do {
            try ids = context.fetch(fetchRequest)
        } catch let error as NSError {
            print("Errore in fetch \(error.code)")
        }
        
        if(ids.count == 0) {
            return nil
        } else {
            return ids[0]
        }

    }
    
    // prendo tutti gli utenti
    static func fetchUsers() -> [User] {
        var users = [User]()
        
        let context = getContext()
        
        let fetchRequest = NSFetchRequest<User>(entityName: "User")
        
        // esempio di utilizzo dei predicati
        // let number = “2"
        // fetchRequest.predicate = NSPredicate(format: “quantity > %@“, number)
        
        do {
            try users = context.fetch(fetchRequest)
        } catch let error as NSError {
            print("Errore in fetch \(error.code)")
        }
        
        return users
    }
    
    static func fetchActiveApplications(applicant: User) -> [Application] {
        var applications = [Application]()
        
        let context = getContext()
        
        let fetchRequest = NSFetchRequest<Application>(entityName: "Application")
        
        // non è detto che funzionino, poichè probabilmente questo formato vale solo per le stringhe
        let applicantPredicate = NSPredicate(format: "applicant == %@", applicant)
        let statePredicate = NSPredicate(format: "state == %i", 1)
        // 1 indica le richieste in corso
        
        let compoundPredicate = NSCompoundPredicate(type: NSCompoundPredicate.LogicalType.and, subpredicates: [applicantPredicate, statePredicate])
        
        fetchRequest.predicate = compoundPredicate
        
        do {
            try applications = context.fetch(fetchRequest)
        } catch let error as NSError {
            print("Errore in fetch \(error.code)")
        }
        
       return applications
    }
    
    static func fetchConfirmedApplications(applicant: User) -> [Application] {
        var applications = [Application]()
        
        let context = getContext()
        
        let fetchRequest = NSFetchRequest<Application>(entityName: "Application")
        
        // non è detto che funzionino, poichè probabilmente questo formato vale solo per le stringhe
        let applicantPredicate = NSPredicate(format: "applicant == %@", applicant)
        let statePredicate = NSPredicate(format: "state == %i", 2)
        // 1 indica le richieste in corso
        
        let compoundPredicate = NSCompoundPredicate(type: NSCompoundPredicate.LogicalType.and, subpredicates: [applicantPredicate, statePredicate])
        
        fetchRequest.predicate = compoundPredicate
        
        do {
            try applications = context.fetch(fetchRequest)
        } catch let error as NSError {
            print("Errore in fetch \(error.code)")
        }
        
        return applications
    }
    
    static func fetchAllApplications(applicant: User) -> [Application] {
        var applications = [Application]()
        
        let context = getContext()
        
        let fetchRequest = NSFetchRequest<Application>(entityName: "Application")
        
        fetchRequest.predicate = NSPredicate(format: "applicant == %@", applicant)
        
        do {
            try applications = context.fetch(fetchRequest)
        } catch let error as NSError {
            print("Errore in fetch \(error.code)")
        }
        
        return applications
    }
    
    static func fetchOfferApplications(offer: Offer) -> [Application] {
        var applications = [Application]()
        
        let context = getContext()
        
        let fetchRequest = NSFetchRequest<Application>(entityName: "Application")
        
        fetchRequest.predicate = NSPredicate(format: "offer == %@", offer)
        
        do {
            try applications = context.fetch(fetchRequest)
        } catch let error as NSError {
            print("Errore in fetch \(error.code)")
        }
        
        return applications
    }
    
    // restituisce l'utente che ha la stessa email passata come parametro
    // restituisce nil altrimenti (si spera)
    static func fetchUser(email: String) -> User? {
        var users: [User]!
        
        let context = getContext()
        
        let fetchRequest = NSFetchRequest<User>(entityName: "User")
        
        fetchRequest.predicate = NSPredicate(format: "email == %@", email)
        
        do {
            try users = context.fetch(fetchRequest)
        } catch let error as NSError {
            print("Errore in fetch \(error.code)")
        }
        
        if(users == nil || users.count == 0) {
            return nil
        } else {
            return users[0]
        }

    }

    // non mostra le offerte dell'utente loggato
    // non mostra le offerte che non hanno più posti liberi
    // mostra solo le offerte con state == 1, cioè che sono in lobby e non sono partite
    static func fetchOffers(userLogged: User) -> [Offer] {
        var offers = [Offer]()
        
        let context = getContext()
        
        let fetchRequest = NSFetchRequest<Offer>(entityName: "Offer")
        
        // fetchRequest.predicate = NSPredicate(format: "offerer != %@", userLogged)
    
        let userLoggedPredicate = NSPredicate(format: "offerer != %@", userLogged)
        let freeSpotsPredicate = NSPredicate(format: "freeSpots != %i", 0)
        let statePredicate = NSPredicate(format: "state == %i", 1)
        
        let compoundPredicate = NSCompoundPredicate(type: NSCompoundPredicate.LogicalType.and, subpredicates: [userLoggedPredicate, freeSpotsPredicate, statePredicate])
        
        fetchRequest.predicate = compoundPredicate
        
        do {
            try offers = context.fetch(fetchRequest)
        } catch let error as NSError {
            print("Errore in fetch \(error.code)")
        }
        
        var userLoggedApplications = [Application]()
        
        userLoggedApplications = fetchAllApplications(applicant: userLogged)
        
        for application in userLoggedApplications {
            if let index = offers.index(of: application.offer!) {
                offers.remove(at: index)
            }
        }
        
        return offers
    }
    
    static func fetchUserOffers(offerer: User) -> [Offer] {
        var offers = [Offer]()
        
        let context = getContext()
        
        let fetchRequest = NSFetchRequest<Offer>(entityName: "Offer")
        
        fetchRequest.predicate = NSPredicate(format: "offerer == %@", offerer)
        
        do {
            try offers = context.fetch(fetchRequest)
        } catch let error as NSError {
            print("Errore in fetch \(error.code)")
        }
        
        return offers
    }
    
    
    static func saveContext() {
        let context = getContext()
        
        do {
            try context.save()
        } catch let error as NSError {
            print("Errore in salvataggio: \(error.code)")
        }
    }
    
    static func deleteUser(user: User) {
        let context = getContext()
        
        context.delete(user)
    }
    
    // cancello l'offerta e tutte le richieste associate all'offerta, in qualsiasi stato
    static func deleteOffer(offer: Offer) {
        let context = getContext()
        
        var applications = [Application]()
        
        applications = fetchOfferApplications(offer: offer)
        
        for application in applications {
            deleteApplication(application: application)
        }
        
        context.delete(offer)
    }
    
    // cancella tutte le applicasions attive (non confermate) dell'offerta
    static func deleteActiveApplicationsOfOffer(offer: Offer) {
        var applications = [Application]()
        
        applications = fetchOfferApplications(offer: offer)
        
        for application in applications {
            if(application.state == 1) {
                deleteApplication(application: application)
            }
        }
    }
    
    // attenzione
    // in base allo stato, devo modificare alcuni parametri
    // dell'offerta associata e del richiedente
    // per adesso non ho fatto queste cose
    static func deleteApplication(application: Application) {
        let context = getContext()
        
        context.delete(application)
    }
    
}
