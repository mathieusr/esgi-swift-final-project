//
//  InitTabView.swift
//  weather
//
//  Created by Geneviève & Serge Sallet on 09/07/2020.
//  Copyright © 2020 Mathieu serra. All rights reserved.
//

import SwiftUI

struct InitTabView: View {
    var body: some View {
        TabView {
            CityList()
                .tabItem {
                    Text("city")
                    Image(systemName: "location.fill")
                }
            Settings()
                .tabItem {
                    Text("settings")
                    Image(systemName: "gear")
            }
        }
    }
}

struct InitTabView_Previews: PreviewProvider {
    static var previews: some View {
        InitTabView()
    }
}
