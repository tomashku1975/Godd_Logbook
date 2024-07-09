//
//  Persistence.swift
//  Good Logbook
//
//  Created by Tomasz Zuczek on 09/07/2024.
//

import CoreData

struct PersistenceController {
    static let shared = PersistenceController()

    static var preview: PersistenceController = {
        let result = PersistenceController(inMemory: true)
        let viewContext = result.container.viewContext
        for _ in 0..<10 {
            let newPairing = Pairing(context: viewContext)
            newPairing.date = Date()
            newPairing.flightNumbers = "123 124 126 128"
            for flightNumber in newPairing.flightNumbers!.split(separator: " ") {
                let newFlight = Flight(context: viewContext)
                newFlight.aircraft = "Boeing 737"
                newFlight.aircraftRegistration = "HZ-ABC"
                newFlight.date = newPairing.date
                newFlight.flightNumbers = String(flightNumber)
                newFlight.picName = "John Doe"
                newFlight.sicName = "Harry Smith"
                newFlight.pairing = newPairing
            }
        }
        do {
            try viewContext.save()
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
        return result
    }()

    let container: NSPersistentContainer

    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "Good_Logbook")
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
    }
}
