//
//  Draft+CoreDataProperties.swift
//  hackathonProject
//
//  Created by Zhanxi Ni on 7/19/18.
//
//

import Foundation
import CoreData


extension Draft {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Draft> {
        return NSFetchRequest<Draft>(entityName: "Draft")
    }

    @NSManaged public var content: String?
    @NSManaged public var date: NSDate?
    @NSManaged public var recipient: Recipient?
    @NSManaged public var closing: String?


}
