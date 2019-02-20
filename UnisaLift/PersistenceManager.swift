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
    
    /*
    static func deleteItem( item :PItem) {
        
        let context  = getContext()
        
        context.delete(item)
    }
    */
    
}
