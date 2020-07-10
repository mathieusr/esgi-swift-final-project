//
//  City.swift
//  weather
//
//  Created by Geneviève & Serge Sallet on 09/07/2020.
//  Copyright © 2020 Mathieu serra. All rights reserved.
//

import Foundation
import SwiftUI

struct City: Hashable, Identifiable {
    
    let id = UUID();
    let name: String;
    let country: String;
    let current: Weather;
    let previsions: [Prevision]
}

struct Weather: Hashable {
    
    let weather: String;
    let temperature: Int
    
    func formatTemperature(isDegree: Bool) -> Int {
        
        return isDegree ? temperature : (temperature * (9 / 5)) + 32
    }
        
    var image: Image {
        
        switch weather {
            case "sun":
                return Image(systemName: "sun.max.fill")
            case "rain":
                return Image(systemName: "cloud.rain.fill")
            default:
                return Image(systemName: "sun.min")
        }
    }
    
    var color: Color {
        
        switch weather {
            case "sun":
                return Color(UIColor.systemYellow)
            case "rain":
                return Color(UIColor.systemBlue)
            default:
                return Color(UIColor.systemGray)
        }
    }
}

struct Prevision: Hashable, Identifiable {
    
    let id = UUID()
    let date: Date
    let weather: Weather
}
