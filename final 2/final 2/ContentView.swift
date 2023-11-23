//
//  ContentView.swift
//  final 2
//
//  Created by Jhala family on 20/11/23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var itineraryManager = ItineraryManager()
    
    var body: some View {
        TabView{
            HomeView(itineraryManager: itineraryManager)
                .tabItem{
                    Label("Home", systemImage: "house.fill")
                }
            itineraryView(itineraryManager: itineraryManager)
                .tabItem{
                    Label("Itineraries", systemImage: "list.clipboard.fill")
                }
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
