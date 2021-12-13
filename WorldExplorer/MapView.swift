//
//  MapView.swift
//  WorldExplorer
//
//  Created by Ahmet Kaan UZMAN on 12.12.2021.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    static var regions : [MKCoordinateRegion] = [
        MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 41.0, longitude: 29.0), span: MKCoordinateSpan(latitudeDelta: 3.0, longitudeDelta: 3.0)),
        MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.509865, longitude: -0.118092), span: MKCoordinateSpan(latitudeDelta: 3.0, longitudeDelta: 3.0)),
    ]
    
    
    @State private var region: MKCoordinateRegion = regions[0]
    
    @State private var selectedIndex : Int = 0

    var body: some View {
        Map(coordinateRegion: $region).edgesIgnoringSafeArea(.top).overlay(
            VStack{
                Picker("", selection: $selectedIndex, content: {
                    Text("MAP_CITY_ISTANBUL").tag(0)
                    Text("MAP_CITY_LONDON").tag(1)
                }).pickerStyle(SegmentedPickerStyle())
                Spacer()
            }.padding().onChange(of: selectedIndex, perform: {
                value in self.region = MapView.regions[selectedIndex]
            })
        )
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
