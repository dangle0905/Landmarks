//
//  MapView.swift
//  Landmarks
//
//  Created by Dang Le on 6/13/22.
//

import SwiftUI
import MapKit

struct MapView: View {
    var coordinate: CLLocationCoordinate2D
    //set variable region, @State property wrapper all us to modify values inside struct, which would normally not be allowed because structs are value types. When we put @State before a perperty, we effectively move its storage out from our struct and into shared storage managed by SwiftUI.
    @State private var region = MKCoordinateRegion()
    
    //body var of type view ":" means "of type"
    var body: some View{
        Map(coordinateRegion: $region)
            .onAppear{
                setRegion(coordinate)
            }
    }
    
    private func setRegion(_ coordinate: CLLocationCoordinate2D){
        region = MKCoordinateRegion(
            center: coordinate,
            span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
        )
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(coordinate: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868))
    }
}
