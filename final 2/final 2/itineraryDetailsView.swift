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
        HStack(alignment: .top){
                Text(itinerary.startdate, formatter: dateFormatter)
                Text("-")
                Text(itinerary.enddate, formatter: dateFormatter)
            }
        .navigationTitle(itinerary.country)
        .navigationBarItems(trailing:
            NavigationLink(destination: addItemView(itineraryManager: itineraryManager)) {
                Image(systemName: "Add Item")
                    .resizable()
                    .frame(width: 18, height: 18)
            }
        )
    }
}

let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .none
    return formatter
}()
