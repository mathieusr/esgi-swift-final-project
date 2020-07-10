//
//  AppSettings.swift
//  weather
//
//  Created by Geneviève & Serge Sallet on 10/07/2020.
//  Copyright © 2020 Mathieu serra. All rights reserved.
//

import Foundation
import Combine

class AppSettings : ObservableObject {
    
    @Published var isDegree: Bool {
        didSet {
            UserDefaults.standard.set(isDegree, forKey: "isDegree")
        }
    }
    
    @Published var city: [City]
    
    init() {
        isDegree = UserDefaults.standard.bool(forKey: "isDegree")
        city = [
            availableCity.randomElement()!
        ]
    }
    
    func addCity(city: City) {
        
        self.city.append(city)
    }
    
    func removeCity(city: City) {
        
        self.city = self.city.filter({$0.id != city.id})
    }
}
