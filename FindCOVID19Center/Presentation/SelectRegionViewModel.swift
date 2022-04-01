//
//  SelectRegionViewModel.swift
//  FindCOVID19Center
//
//  Created by 노민경 on 2022/04/02.
//

import Foundation
import Combine
import UIKit

class SelectRegionViewModel: ObservableObject { // ObservableObject는 combine에서 제공하는 것으로 외부에서 바라볼 수 있는 object이다.
    @Published var centers = [Center.Sido: [Center]]()
    private var cancellable = Set<AnyCancellable>() // rx의 disposeBag에 해당
    
    init(CenterNetwork: CenterNetwork = CenterNetwork()) {
        CenterNetwork.getCenterList()
            .receive(on: DispatchQueue.main) // viewModel은 view에 뿌려져야 하기 때문에 receive on 을 통해서 main 스레드에 뿌려질 수 있도록 한다.
            // rx의 subscribe에 ㅐ당
            .sink(
                receiveCompletion: {[weak self] in
                    // 실패했을 경우
                    guard case .failure(let error) = $0 else { return }
                    print(error.localizedDescription)
                    self?.centers = [Center.Sido: [Center]]()
                },
                receiveValue: {[weak self] centers in
                    // 정상적으로 값을 받았을 경우
                    self?.centers = Dictionary(grouping: centers) { $0.sido } // sido를 기준으로 grouping
                    
                }
            )
            .store(in: &cancellable) // disposed(by: disposeBag)
    }
    
}
