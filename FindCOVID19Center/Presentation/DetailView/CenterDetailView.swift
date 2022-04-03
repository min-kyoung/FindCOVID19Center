//
//  CenterDetailView.swift
//  FindCOVID19Center
//
//  Created by 노민경 on 2022/04/03.
//

import SwiftUI
import MapKit

// mapView를 가지는 super view
struct CenterDetailView: View {
    var center: Center
    
    var body: some View {
        VStack {
            MapView(coordination: center.coordinate)
                .ignoresSafeArea(edges: .all)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            CenterRow(center: center)
        }
        .navigationTitle(center.facilityName)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct CenterDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let center = Center(id: 0, sido: .서울특별시, facilityName: "facilityName", address: "address", lat: "37.404476", lng: "126.9491990", centerType: .central, phoneNumber: "010-0000-0000")
        CenterDetailView(center: center)
    }
}
