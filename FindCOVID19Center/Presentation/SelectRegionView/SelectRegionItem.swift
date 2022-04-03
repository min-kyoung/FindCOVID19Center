//
//  SelectRegionItem.swift
//  FindCOVID19Center
//
//  Created by 노민경 on 2022/04/02.
//

import SwiftUI

// subComponents : 하나의 시,도에 대한 값과 각각의 시, 도가 몇개의 count 값을 가지고 있는지를 나타내는 아이템 셀
struct SelectRegionItem: View {
    var region: Center.Sido
    var count: Int
    
    var body: some View {
        ZStack {
            Color(white: 0.9)
            VStack {
                Text(region.rawValue)
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.purple)
                Text("(\(count))")
                    .font(.callout)
                    .fontWeight(.light)
                    .foregroundColor(.gray)
            }
            .padding()
        }
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

struct SelectRegionItem_Previews: PreviewProvider {
    static var previews: some View {
        // 미리보기용 값 세팅
        let region = Center.Sido.서울특별시
        SelectRegionItem(region: region, count: 3)
    }
}
