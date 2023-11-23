//
//  itineraryDetailsView.swift
//  final 2
//
//  Created by Jhala family on 21/11/23.
//

import SwiftUI

struct itineraryDetailsView: View {
    @Binding var itinerary: Itinerary
    @ObservedObject var itineraryManager: ItineraryManager
    @State var additemtransit = false
    var body: some View {
        Button("Additem"){
            additemtransit  = true
        }
        VStack(alignment:.leading){
            Text(itinerary.country)
            Text(itinerary.startdate, formatter: dateFormatter)
            Text(itinerary.enddate, formatter: dateFormatter)
        }
        .sheet(isPresented: $additemtransit){
            addItemView(itineraryManager: itineraryManager)
        }
    }
}
let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .none
    return formatter
}()
