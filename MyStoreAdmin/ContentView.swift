//
//  ContentView.swift
//  MyStoreAdmin
//
//  Created by Михаил Супрун on 2/21/25.
//

import SwiftUI
import ParseCore
import ParseLiveQuery

struct ContentView: View {
    let liveQueryClient = ParseLiveQuery.Client()
    @State private var subscription: Subscription<PFObject>?
    @State private var orders: [PFObject] = []
    var body: some View {
        NavigationStack{
            List{
                ForEach(orders, id: \.self){ order in
                    OrderViewContainer(pfObject: order)
                }.onDelete { index in
                    let object = orders[index.first!]
                    object.deleteInBackground { success, _ in
                        if success{ updateOrders()}
                    }
                }
            }
        }.task(){
            updateOrders()
        }
        .refreshable {
            updateOrders()
            }
    }
    func updateOrders(){
        ParseManager().fetchObjectArray(className: "Orders") { PFObjectArray in
            if let PFObjectArray{
                orders = PFObjectArray
            }
        }
    }
    func subscribeToChanges() {
       
        let query = PFQuery(className: "Orders")
        query.whereKey("SomeKey", equalTo: "Description")
       
        subscription = liveQueryClient.subscribe(query)
            .handle(Event.created) { _, object in
                print("Object created: \(object)")
                updateOrders()
            }
            .handle(Event.updated) { _, object in
                print("Object updated: \(object)")
                updateOrders()
            }
            .handle(Event.deleted) { _, object in
                print("Object deleted: \(object)")
                updateOrders()
            }
    }
}


