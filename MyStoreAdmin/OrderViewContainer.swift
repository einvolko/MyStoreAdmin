//
//  OrderViewContainer.swift
//  MyStoreAdmin
//
//  Created by Михаил Супрун on 2/21/25.
//

import SwiftUI
import ParseCore

struct OrderViewContainer: View {
    var pfObject: PFObject
    var body: some View {
        HStack{
            Text(pfObject["Description"] as? String ?? "No description")
            Spacer()
            Text(pfObject["address"] as? String ?? "No contacts")
        }
    }
}
