//
//  SelectRegionView.swift
//  FindCOVID19Center
//
//  Created by 노민경 on 2022/04/02.
//

import SwiftUI

struct SelectRegionView: View {
    // ObservableObject을 바라보도록 연결
    @ObservedObject var viewModel = SelectRegionViewModel() // rx의 bind
    
    private var items: [GridItem] {
        Array(repeating: .init(.flexible(minimum: 80)), count: 2)
    }
    
    var body: some View {
            NavigationView {
                ScrollView {
                    LazyVGrid(columns: items, spacing: 20) {
                        ForEach(Center.Sido.allCases, id: \.id){ sido in
                            // Center에서 CaseIterable를 사용했기 때문에 allCases를 통해 sido의 모든 케이스를 array로 불러올 수 있다.
                            let centers = viewModel.centers[sido] ?? []
                            // viewModel의 centers는 dictionary였기 때문에 sido를 직접 넣어주면 해당 sido가 가지고 있는 center의 리스트를 뽑아준다.
                            
                            // 셀을 탭하면 리스트 뷰로 전달된다.
                            NavigationLink(destination: CenterList(centers: centers) ) {
                                SelectRegionItem(region: sido, count: centers.count)
                            }
                        }
                    }       
                }
                .padding()
                .navigationTitle("COVID 19 예방접종 센터")
            }
        }
    }


struct SelectRegionView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = SelectRegionViewModel()
        SelectRegionView(viewModel: viewModel)
    }
}
