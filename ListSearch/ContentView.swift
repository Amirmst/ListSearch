//
//  ContentView.swift
//  ListSearch
//
//  Created by Amir Mostafavi on 2/23/21.
//

import SwiftUI

struct ContentView: View {
    
    let cars = ["Subaru WRX", "Tesla Model 3",
                "Porsche 911", "Renault Zoe", "DeLorean"]
    
    @State private var searchText : String = ""
    
    var body: some View {
        NavigationView {
            
            VStack {
                SearchBar(text: $searchText, placeholder: "Search cars...")
                List {
                    ForEach(self.cars.filter {
                        self.searchText.isEmpty ? true : $0.lowercased().contains(self.searchText.lowercased())
                    }, id: \.self) { car in
                        Text(car)
                    }
                }
                .navigationBarTitle(Text("Cars"))
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
