//
//  Flight+CoreDataProperties.swift
//  Good Logbook
//
//  Created by Tomasz Zuczek on 09/07/2024.
//
//

import Foundation
import CoreData


extension Flight {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Flight> {
        return NSFetchRequest<Flight>(entityName: "Flight")
    }

    @NSManaged public var aircraft: String?
    @NSManaged public var aircraftRegistration: String?
    @NSManaged public var date: Date?
    @NSManaged public var flightNumbers: String?
    @NSManaged public var picName: String?
    @NSManaged public var sicName: String?
    @NSManaged public var pairing: Pairing?
}

extension Flight : Identifiable {

}

