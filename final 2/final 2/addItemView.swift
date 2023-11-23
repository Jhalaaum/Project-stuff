//
//  addItemView.swift
//  final 2
//
//  Created by Jhala family on 21/11/23.
//

import SwiftUI

struct addItemView: View {
    @ObservedObject var itineraryManager: ItineraryManager
    @State private var searchView = false
    var body: some View {
        Text("New Place")
            .font(.largeTitle)
        VStack{
            HStack{
                Text("location")
                Button("Search for the place name"){
                    searchView = true
                }
                
            }
        }
        .sheet(isPresented: $searchView){
            SearchView()
        }
    }
}

struct addItemView_Previews: PreviewProvider {
    static var previews: some View {
        addItemView(itineraryManager: ItineraryManager())
    }
}
