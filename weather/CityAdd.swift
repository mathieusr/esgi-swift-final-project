//
//  CityAdd.swift
//  weather
//
//  Created by Geneviève & Serge Sallet on 09/07/2020.
//  Copyright © 2020 Mathieu serra. All rights reserved.
//

import SwiftUI

struct CityAdd: View {
    
    @Binding var showAddForm: Bool;
    
    @State private var cityName = ""
    
    @State private var isEditing = false
    
    @EnvironmentObject var appSettings: AppSettings
    
    var body: some View {
        NavigationView {
            
            VStack {
                
                HStack {
                    TextField("search", text: $cityName)
                    .padding(7)
                    .padding(.horizontal, 25)
                    .background(Color(.systemGray5))
                    .cornerRadius(8)
                        .overlay(HStack {
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(.gray)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.leading, 8)
                            if isEditing {
                                
                                Button(action: {
                                    self.cityName = ""
                                    
                                }) {
                                    Image(systemName: "multiply.circle.fill")
                                        .foregroundColor(.gray)
                                        .padding(.trailing, 8)
                                }
                            }
                        })
                    .padding(.horizontal, 10)
                    .onTapGesture {
                        self.isEditing.toggle()
                    }
                    
                    if isEditing {
                        
                        Button(action: {
                            self.isEditing.toggle()
                            self.cityName = ""
                            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                        }){
                            Text("cancel")
                        }
                        .padding(.trailing, 10)
                        .transition(.move(edge: .trailing))
                        .animation(.default)
                    }
                }
                .padding(.top)
                    
                List(availableCity.filter { tempCity in
                        (appSettings.city.firstIndex(where: {existingCity in existingCity.id == tempCity.id
                        })) == nil && (cityName.isEmpty
                            ? true
                            : tempCity.name.contains(cityName) || tempCity.country.contains(cityName))
                    }){ city in
                    Text("\(city.name), \(city.country)")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .onTapGesture {
                        self.appSettings.addCity(city: city)
                        self.showAddForm.toggle()
                    }
                }
                    
            }
            .navigationBarTitle("add", displayMode: .inline)
            .navigationBarItems(trailing: Button(action: {
                self.showAddForm.toggle()
            }){
                Text("done").bold()
            })
        }
    }
}

struct CityAdd_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
