//
//  Settings.swift
//  weather
//
//  Created by Geneviève & Serge Sallet on 10/07/2020.
//  Copyright © 2020 Mathieu serra. All rights reserved.
//

import SwiftUI

struct Settings: View {
    
    @EnvironmentObject var appSettings: AppSettings
    
    var body: some View {
        
        NavigationView {
            List {
                Section(header: Text("weather")) {
                    HStack(alignment: .center, spacing: 0) {
                        Toggle(isOn: $appSettings.isDegree) {
                            Text("unit")
                            Text(appSettings.isDegree ? "°C" : "°F")
                        }
                    }
                }
            }.listStyle(GroupedListStyle())
            .navigationBarTitle("settings")
        }
    }
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings()
    }
}
