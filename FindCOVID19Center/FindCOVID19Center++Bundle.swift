//
//  FindCOVID19Center++Bundle.swift
//  FindCOVID19Center
//
//  Created by 노민경 on 2022/04/01.
//

import Foundation

extension Bundle {
    var apiKey: String {
        guard let file = self.path(forResource: "FindCOVID19CenterInfo", ofType: "plist") else { return "" }
        
        guard let resource = NSDictionary(contentsOfFile: file) else { return "" }
        guard let key = resource["API_KEY"] as? String else { fatalError("FindCOVID19CenterInfo에 API_KEY 설정을 해주세요.")}
        return key
    }
}
