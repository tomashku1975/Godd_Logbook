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

    private func addFlight() {
        let newFlight = Flight(context: viewContext)
        newFlight.date = date
        newFlight.aircraft = aircraft
        newFlight.flightNumbers = flightNumbers
        newFlight.picName = picName
        newFlight.sicName = sicName
        newFlight.aircraftRegistration = aircraftRegistration

        do {
            try viewContext.save()
            presentationMode.wrappedValue.dismiss()
        } catch {
            // Handle the Core Data error here
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Flight Details")) {
                    TextField("Aircraft", text: $aircraft)
                    TextField("Aircraft Registration", text: $aircraftRegistration)
                    DatePicker("Date", selection: $date, displayedComponents: .date)
                    TextField("Flight Number", text: $flightNumbers)
                    TextField("PIC Name", text: $picName)
                    TextField("SIC Name", text: $sicName)
                }
            }
            .navigationTitle("Add Flight")
            .navigationBarItems(trailing: Button("Save") {
                addFlight()
            })
        }
    }
}
