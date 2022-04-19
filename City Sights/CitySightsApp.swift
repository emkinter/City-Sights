//
//  CitySightsApp.swift
//  City Sights
//
//  Created by Ekkehard Koch on 2022.04.16.
//

import SwiftUI

@main
struct CitySightsApp: App {
    var body: some Scene {
        WindowGroup {
            LaunchView()
                .environmentObject(ContentModel())
        }
    }
}
