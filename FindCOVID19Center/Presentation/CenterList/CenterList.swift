//
//  CenterList.swift
//  FindCOVID19Center
//
//  Created by 노민경 on 2022/04/03.
//

import SwiftUI

// CenterRow를 가지는 리스트
struct CenterList: View {
    var centers = [Center]()
    
    var body: some View {
        List(centers, id: \.id) { center in
            // centerList가 탭이 되었을 때 DetailView로 이동
            NavigationLink(destination: CenterDetailView(center: center)) {
                CenterRow(center: center)
            }
            .navigationTitle(center.sido.rawValue)
        }
    }
}

struct CenterList_Previews: PreviewProvider {
    static var previews: some View {
        let centers = [
            Center(id: 0, sido: .서울특별시, facilityName: "facilityName", address: "address", lat: "37.404476", lng: "126.9491990", centerType: .central, phoneNumber: "010-0000-0000"),
            Center(id: 1, sido: .서울특별시, facilityName: "facilityName", address: "address", lat: "37.404476", lng: "126.9491990", centerType: .central, phoneNumber: "010-0000-0000"),
            Center(id: 2, sido: .서울특별시, facilityName: "facilityName", address: "address", lat: "37.404476", lng: "126.9491990", centerType: .central, phoneNumber: "010-0000-0000")
        ]
        CenterList(centers: centers)
    }
}
