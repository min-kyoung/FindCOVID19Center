//
//  CenterAPIResponse.swift
//  FindCOVID19Center
//
//  Created by 노민경 on 2022/04/01.
//

import Foundation

struct CenterAPIResponse: Decodable {
    let data: [Center]
}
