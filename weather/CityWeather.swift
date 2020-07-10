//
//  CityWeather.swift
//  weather
//
//  Created by Geneviève & Serge Sallet on 09/07/2020.
//  Copyright © 2020 Mathieu serra. All rights reserved.
//

import SwiftUI

struct CityWeather: View {
    
    var city: City
    
    let calendar = Calendar.current
    
    @ObservedObject
    var appSettings = AppSettings()
    
    var body: some View {
            VStack(alignment: .leading, spacing: 12) {
                
                VStack(alignment: .center, spacing: 4) {
                 
                    Text(city.name)
                        .font(.system(size: 30))
                        .frame(maxWidth: .infinity, alignment: .center)
                    
                    Text(city.current.weather)
                    .frame(maxWidth: .infinity, alignment: .center)
                        
                    
                    Text("\(city.current.formatTemperature(isDegree: appSettings.isDegree))\(self.getTempSymbol())")
                        .font(.system(size: 60))
                        .frame(maxWidth: .infinity, alignment: .center)
                    
                    
                }.padding()
                    .frame(maxWidth: .infinity, alignment: .center)
                
                Divider()
                
                List {
                    Text("Prevision")
                        .bold()
                    
                    ForEach(city.previsions,id: \.self) { prevision in
                        
                        HStack(alignment: .center, spacing: 6) {
                            Text(self.dateToWeekOfDay(date: prevision.date))
                            
                            Spacer()
                            
                            prevision.weather.image
                                .resizable()
                                .frame(width: 25, height: 25)
                                .foregroundColor(prevision.weather.color)
                            
                            Spacer()
                            
                            Text("\(prevision.weather.formatTemperature(isDegree: self.appSettings.isDegree))\(self.getTempSymbol())")
                            
                        }
                        .padding([.top, .bottom])
                        .frame(maxWidth: .infinity, alignment: .center)
                        
                    }
                }
                .listStyle(DefaultListStyle())
            }
            .frame(maxHeight: .infinity, alignment: .top)
    }
    
    func dateToWeekOfDay(date: Date) -> String {
        
        let weekDay = calendar.component(.weekday, from: date)
        
        return Calendar.current.weekdaySymbols[weekDay - 1]
    }
    
    func getTempSymbol() -> String {
        
        return appSettings.isDegree ? "°C" : "°F"
    }
}

struct CityWeather_Previews: PreviewProvider {
    static var previews: some View {
        CityWeather(city: availableCity[0])
    }
}
