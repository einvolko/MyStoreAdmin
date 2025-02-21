//
//  MyStoreAdminApp.swift
//  MyStoreAdmin
//
//  Created by Михаил Супрун on 2/21/25.
//

import SwiftUI
import ParseCore
@main
struct MyStoreAdminApp: App {
    init(){
        let configuration = ParseClientConfiguration {
            $0.applicationId = "imTWdtu5WzoJAPwQ3LdiUv2eU5XW3fDx1EFibh3R"
            $0.clientKey = "WwhIhPc5lnmPrAZGbiw1Iza73pd1mbsWKe1zwOoa"
            $0.server = "https://parseapi.back4app.com"
        }
        Parse.initialize(with: configuration)
        
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
