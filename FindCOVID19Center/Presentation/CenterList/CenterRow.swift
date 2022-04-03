//
//  CenterRow.swift
//  FindCOVID19Center
//
//  Created by 노민경 on 2022/04/03.
//

import SwiftUI

// 리스트에 넣을 행 : 하나의 center 값을 받아서 뿌려줌
struct CenterRow: View {
    var center: Center
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(center.facilityName)
                    .font(.headline)
                Text(center.centerType.rawValue)
                    .font(.caption)
                    .foregroundColor(.gray)
                Spacer()
            }
            Text(center.address)
                .font(.footnote)
            
            
            // url이 있으면 Link를 통해 전화를 걸 수 있도록 함
            if let url = URL(string: "tel:" + center.phoneNumber) {
                Link(center.phoneNumber, destination: url)
            }
        }
        .padding()
    }
}

struct CenterRow_Previews: PreviewProvider {
    static var previews: some View {
        // 미리보기용 값 세팅
        let center = Center(id: 0, sido: .서울특별시, facilityName: "facilityName", address: "address", lat: "37.404476", lng: "126.9491990", centerType: .central, phoneNumber: "010-0000-0000")
        CenterRow(center: center)
    }
}
