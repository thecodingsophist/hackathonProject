//
//  CoreDataHelper.swift
//  hackathonProject
//
//  Created by Amy Liu on 7/18/18.
//

import Foundation
import UIKit
import CoreData

struct CoreDataHelper {
    static let context: NSManagedObjectContext = {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            fatalError()
        }
        
        let persistentContainer = appDelegate.persistentContainer
        let context = persistentContainer.viewContext
        
        return context
    }()
    
    static func newDraft() -> Draft {
        let draft = NSEntityDescription.insertNewObject(forEntityName: "Draft", into: context) as! Draft
        
        return draft
    }
    
    static func newAddress()-> Address{
    
     let address = NSEntityDescription.insertNewObject(forEntityName: "Address", into: context) as! Address
    return address
    }
    
    static func saveDraft() {
        do {
            try context.save()
        } catch let error {
            print ("Could not save \(error.localizedDescription)")
        }
    }
    
    static func delete(draft: Draft) {
        context.delete(draft)
        
        saveDraft()
    }
    
    static func retrieveDrafts() -> [Draft] {
        do {
            let fetchRequest = NSFetchRequest<Draft>(entityName: "Draft")
            let results = try context.fetch(fetchRequest)
            
            return results
        } catch let error {
            print("Could not fetch \(error.localizedDescription)")
            
            return []
        }
    }
}
