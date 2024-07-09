//
//  FlightDetailView.swift
//  Good Logbook
//
//  Created by Tomasz Zuczek on 09/07/2024.
//

import SwiftUI
import CoreData

struct FlightDetailView: View {
    @ObservedObject var flight: Flight

    var body: some View {
        VStack(alignment: .leading) {
            Text("Flight Number: \(flight.flightNumbers ?? "Unknown Flight")")
            Text("Date: \(flight.date ?? Date(), formatter: dateFormatter)")
            Text("Aircraft: \(flight.aircraft ?? "Unknown Aircraft")")
            Text("Aircraft Registration: \(flight.aircraftRegistration ?? "Unknown Registration")")
            Text("PIC Name: \(flight.picName ?? "Unknown PIC")")
            Text("SIC Name: \(flight.sicName ?? "Unknown SIC")")
        }
        .navigationTitle("Flight Details")
        .navigationBarTitleDisplayMode(.inline)
        .padding()
    }
}

private let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .long
    return formatter
}()
