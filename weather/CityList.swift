//
//  CityList.swift
//  weather
//
//  Created by Geneviève & Serge Sallet on 09/07/2020.
//  Copyright © 2020 Mathieu serra. All rights reserved.
//

import SwiftUI
import Combine

struct CityList: View {
    
    @State private var showAddForm = false
    
    @State private var editMode = EditMode.inactive
    
    @State private var toggle = false;
    
    @EnvironmentObject var appSettings: AppSettings
    
    var body: some View {
        NavigationView{
            if appSettings.city.isEmpty {
                
                Text("No city found")
                
            }else {
                
            }
            List(appSettings.city) { city in
                NavigationLink(destination: CityWeather(city: city)) {
                    
                    if self.editMode == .active {
                        
                        Image(systemName: "minus.circle.fill")
                            .onTapGesture {
                                self.appSettings.removeCity(city: city)
                            }
                            .padding()
                            .foregroundColor(Color(UIColor.systemBlue))
                    }
                    
                        
                    city.current.image
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundColor(city.current.color)
                    
                    VStack(alignment: .leading) {
                        Text(city.name)
                        Text(city.country)
                            .font(.caption)
                    }
                    .padding(.leading, 10)
                    
                    Spacer()
                    
                    VStack(alignment: .leading, spacing: 6) {
                        Text("\(city.current.formatTemperature(isDegree: self.appSettings.isDegree)) \(self .appSettings.isDegree ? "°C": "°F")")
                    }
                }
                .padding(self.editMode == .inactive ? 5 : 3)
                
            }
            .navigationBarTitle("city")
            .navigationBarItems(leading: EditButton(), trailing: addButton)
            .sheet(isPresented: $showAddForm) {
                CityAdd(showAddForm: self.$showAddForm).environmentObject(self.appSettings)
            }
            .environment(\.editMode,$editMode)
            
            
        }
        .onAppear{
            UITableView.appearance().separatorStyle = .none;
        }
    }
    
    private var addButton: some View {
        switch editMode {
        case .inactive:
            return AnyView(Button(NSLocalizedString("add", comment: "Add")) {
                self.showAddForm.toggle()
            })
        default:
            return AnyView(EmptyView())
        }
    }
}
 
struct CityList_Previews: PreviewProvider {
    static var previews: some View {
        CityList()
    }
}
