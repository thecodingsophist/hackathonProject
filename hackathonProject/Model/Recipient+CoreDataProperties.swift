//
//  Recipient+CoreDataProperties.swift
//  hackathonProject
//
//  Created by Zhanxi Ni on 7/19/18.
//
//

import Foundation
import CoreData


extension Recipient {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Recipient> {
        return NSFetchRequest<Recipient>(entityName: "Recipient")
    }

    @NSManaged public var firstName: String?
    @NSManaged public var lastName: String?
    @NSManaged public var address: Address?

}
