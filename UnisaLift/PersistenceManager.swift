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
    
    static func newUser (carModel: String, email: String, name: String, surname: String) -> User {
        let context = getContext()
        
        let user = NSEntityDescription.insertNewObject(forEntityName: "User", into: context) as! User
        
        user.carModel = carModel
        user.email = email
        user.name = name
        user.surname = surname
        
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
    
    static func newOffer (desc: String, endDate: Date, endPointDesc: String, endPointGeo: String, message: String, startDate: String, startPointDesc: String, startPointGeo: String, totalSpots: Int, type: String, offerer: User) -> Offer {
        let context = getContext()
        
        let offer = NSEntityDescription.insertNewObject(forEntityName: "Offer", into: context) as! Offer
        
        offer.offerID = 10
        offer.desc = "defaultOffer"
        offer.freeSpots = 10
        offer.startPointDesc = "defaultStartPointDesc"
        offer.endPointDesc = "defaultEndPointDesc"
        
        return offer
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

    static func fetchOffers() -> [Offer] {
        var offers = [Offer]()
        
        let context = getContext()
        
        let fetchRequest = NSFetchRequest<Offer>(entityName: "Offer")
        
        // esempio di utilizzo dei predicati
        // let number = “2"
        // fetchRequest.predicate = NSPredicate(format: “quantity > %@“, number)
        
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
    
    static func deleteOffer(offer: Offer) {
        let context = getContext()
        
        context.delete(offer)
    }
    
    /*
    static func deleteItem( item :PItem) {
        
        let context  = getContext()
        
        context.delete(item)
    }
    */
    
}
