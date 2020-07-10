//
//  TempData.swift
//  weather
//
//  Created by Geneviève & Serge Sallet on 09/07/2020.
//  Copyright © 2020 Mathieu serra. All rights reserved.
//

import Foundation



func getDateFormatter() -> DateFormatter {
    
    let format = DateFormatter()
    format.dateFormat = "yyyy-mm-dd"
    
    return format;
}

var availableCity = [
    City(
        name: "Marseille",
        country: "France",
        current: Weather(weather: "sun", temperature: 33),
        previsions: [
            Prevision(date: getDateFormatter().date(from: "2020-07-11")!, weather: Weather(weather: "sun", temperature: 25)),
            Prevision(date: getDateFormatter().date(from: "2020-07-12")!, weather: Weather(weather: "rain", temperature: 28)),
            Prevision(date: getDateFormatter().date(from: "2020-07-13")!, weather: Weather(weather: "sun", temperature: 32))
        ]
    ),
    City(
        name: "Bali",
        country: "Indonesia",
        current: Weather(weather: "sun", temperature: 25),
        previsions: [
            Prevision(date: getDateFormatter().date(from: "2020-07-11")!, weather: Weather(weather: "sun", temperature: 25)),
            Prevision(date: getDateFormatter().date(from: "2020-07-12")!, weather: Weather(weather: "sun", temperature: 26)),
            Prevision(date: getDateFormatter().date(from: "2020-07-13")!, weather: Weather(weather: "rain", temperature: 24))
        ]
    ),
    City(
        name: "New York",
        country: "United States",
        current: Weather(weather: "rain", temperature: 12),
        previsions: [
            Prevision(date: getDateFormatter().date(from: "2020-07-11")!, weather: Weather(weather: "sun", temperature: 15)),
            Prevision(date: getDateFormatter().date(from: "2020-07-12")!, weather: Weather(weather: "rain", temperature: 13)),
            Prevision(date: getDateFormatter().date(from: "2020-07-13")!, weather: Weather(weather: "sun", temperature: 11))
        ]
    ),
    City(
        name: "Sao Paulo",
        country: "Brazil",
        current: Weather(weather: "sun", temperature: 41),
        previsions: [
            Prevision(date: getDateFormatter().date(from: "2020-07-11")!, weather: Weather(weather: "sun", temperature: 38)),
            Prevision(date: getDateFormatter().date(from: "2020-07-12")!, weather: Weather(weather: "sun", temperature: 37)),
            Prevision(date: getDateFormatter().date(from: "2020-07-13")!, weather: Weather(weather: "sun", temperature: 40))
        ]
    ),
    City(
        name: "Paris",
        country: "France",
        current: Weather(weather: "rain", temperature: 15),
        previsions: [
            Prevision(date: getDateFormatter().date(from: "2020-07-11")!, weather: Weather(weather: "rain", temperature: 17)),
            Prevision(date: getDateFormatter().date(from: "2020-07-12")!, weather: Weather(weather: "sun", temperature: 20)),
            Prevision(date: getDateFormatter().date(from: "2020-07-13")!, weather: Weather(weather: "sun", temperature: 22))
        ]
    ),
    City(
        name: "Lyon",
        country: "France",
        current: Weather(weather: "rain", temperature: 12),
        previsions: [
            Prevision(date: getDateFormatter().date(from: "2020-07-11")!, weather: Weather(weather: "rain", temperature: 15)),
            Prevision(date: getDateFormatter().date(from: "2020-07-12")!, weather: Weather(weather: "rain", temperature: 13)),
            Prevision(date: getDateFormatter().date(from: "2020-07-13")!, weather: Weather(weather: "rain", temperature: 14))
        ]
    )
]


