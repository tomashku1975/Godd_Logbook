//
//  AddFlightView.swift
//  Good Logbook
//
//  Created by Tomasz Zuczek on 09/07/2024.
//

import SwiftUI

struct AddFlightView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.presentationMode) var presentationMode

    @State private var aircraft: String = ""
    @State private var aircraftRegistration: String = ""
    @State private var date: Date = Date()
    @State private var flightNumbers: String = ""
    @State private var picName: String = ""
    @State private var sicName: String = ""

    private func addFlights() {
        let flightNumberArray = flightNumbers.split(separator: " ").map { String($0) }

        for flightNumber in flightNumberArray {
            let newFlight = Flight(context: viewContext)
            newFlight.aircraft = aircraft
            newFlight.aircraftRegistration = aircraftRegistration
            newFlight.date = date
            newFlight.flightNumbers = flightNumber
            newFlight.picName = picName
            newFlight.sicName = sicName
        }

        do {
            try viewContext.save()
            presentationMode.wrappedValue.dismiss()
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Flight Details")) {
                    DatePicker("Date", selection: $date, displayedComponents: .date)
                    TextField("Aircraft", text: $aircraft)
                    TextField("Aircraft Registration", text: $aircraftRegistration)
                    TextField("Flight Numbers (separated by space)", text: $flightNumbers)
                    TextField("PIC Name", text: $picName)
                    TextField("SIC Name", text: $sicName)
                }

                Section {
                    Button(action: addFlights) {
                        Text("Add Flights")
                    }
                }
            }
            .navigationBarTitle("Add Flights", displayMode: .inline)
            .navigationBarItems(trailing: Button("Cancel") {
                presentationMode.wrappedValue.dismiss()
            })
        }
    }
}
