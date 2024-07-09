//
//  Pairing+CoreDataProperties.swift
//  Good Logbook
//
//  Created by Tomasz Zuczek on 09/07/2024.
//
//

import Foundation
import CoreData


extension Pairing {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Pairing> {
        return NSFetchRequest<Pairing>(entityName: "Pairing")
    }

    @NSManaged public var date: Date?
    @NSManaged public var flightNumbers: String?
    @NSManaged public var flights: NSSet?
}

// MARK: Generated accessors for flights
extension Pairing {

    @objc(addFlightsObject:)
    @NSManaged public func addToFlights(_ value: Flight)

    @objc(removeFlightsObject:)
    @NSManaged public func removeFromFlights(_ value: Flight)

    @objc(addFlights:)
    @NSManaged public func addToFlights(_ values: NSSet)

    @objc(removeFlights:)
    @NSManaged public func removeFromFlights(_ values: NSSet)

}

extension Pairing : Identifiable {

}
