//
//  Itinerarydetailview.swift
//  final 2
//
//  Created by Jhala family on 20/11/23.
//

import SwiftUI

struct HomeView: View {
    @State private var addview = false
    @ObservedObject var itineraryManager: ItineraryManager
    var body: some View {
        NavigationStack {
            List($itineraryManager.itinerarys, editActions: .all) { $itinerary in
                NavigationLink {
                    itineraryDetailsView()
                } label: {
                    HStack {
                        Image(systemName: itinerary.iscompleted ? "checkmark.circle.fill" : "circle")
                            .onTapGesture {
                                itinerary.iscompleted.toggle()
                            }
                        VStack(alignment: .leading) {
                            Text(itinerary.country)
                                .strikethrough(itinerary.iscompleted)
                        }
                    }
                }
            }
            .navigationTitle("itineraries")
            .toolbar {
                
                ToolbarItemGroup {
                    
//#if DEBUG
//                    Button {
//                    } label: {
//                        Label("Load sample data", systemImage: "clipboard")
//                    }
//#endif
                    
                    Button {
                        addview = true
                    } label: {
                        Label("Add todo", systemImage: "plus")
                    }
                    
                }
                
                
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
            }
            .sheet(isPresented: $addview){
                AddItineraryView(itineraries: $itineraryManager.itinerarys)
            }
        }
    }
    
}

struct Itinerarydetailview_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(itineraryManager: ItineraryManager())
    }
}
