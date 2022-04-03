//
//  MapView.swift
//  FindCOVID19Center
//
//  Created by 노민경 on 2022/04/03.
//

import SwiftUI
import MapKit

// 지도에 핀 표시를 하기 위해 필요한 고유한 struct item
struct AnnotationItem: Identifiable {
    let id = UUID()
    var coordinate: CLLocationCoordinate2D
}

struct MapView: View {
    var coordination: CLLocationCoordinate2D // 좌표
    // state : 외부에 영향 받지 않음
    @State private var region = MKCoordinateRegion()
    @State private var annotationItems = [AnnotationItem]()
    
    var body: some View {
        Map(
            coordinateRegion: $region,
            annotationItems: [AnnotationItem(coordinate: coordination)],
            annotationContent: {
                MapMarker(coordinate: $0.coordinate)
            }
        )
        .onAppear {
            setRegion(coordination)
            setAnnotationItems(coordination)
        }
    }
    
    private func setRegion(_ coordinate: CLLocationCoordinate2D) {
        // center : 맵의 가운데 좌표를 무엇으로 둘 것이냐를 결정
        // span : 얼만큼 가깝고 크게 나타낼 것인지를 결정 (1에 가까울수록 넓은 범위의 맵을 보여줌)
        region = MKCoordinateRegion(
            center: coordinate,
            span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        )
    }
    
    private func setAnnotationItems(_ coordinate: CLLocationCoordinate2D) {
        annotationItems = [AnnotationItem(coordinate: coordinate)]
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        let center = Center(id: 0, sido: .서울특별시, facilityName: "facilityName", address: "address", lat: "37.404476", lng: "126.9491990", centerType: .central, phoneNumber: "010-0000-0000")
        MapView(
            coordination: CLLocationCoordinate2D(
                latitude: CLLocationDegrees(center.lat) ?? .zero,
                longitude: CLLocationDegrees(center.lng) ?? .zero)
        )
    }
}
