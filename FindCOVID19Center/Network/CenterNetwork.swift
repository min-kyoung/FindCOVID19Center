//
//  CenterNetwork.swift
//  FindCOVID19Center
//
//  Created by 노민경 on 2022/04/01.
//

import Foundation
import Combine

class CenterNetwork {
    private let session: URLSession
    let api = CenterAPI()
    let apiKey = Bundle.main.apiKey
    
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    // Center의 리스트 또는 URLError를 내보낸다.
    func getCenterList() -> AnyPublisher<[Center], URLError> {
        guard let url = api.getCenterListComponents().url else {
            return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
        }
        
        var request = URLRequest(url: url)
        request.setValue("Infuser \(apiKey)", forHTTPHeaderField: "Authorization")
        
        return session.dataTaskPublisher(for: request)
            .tryMap { data, response in
                guard let httpResponse = response as? HTTPURLResponse else {
                    throw URLError(.unknown)
                }
                
                switch httpResponse.statusCode {
                case 200..<300:
                    return data
                case 400..<500:
                    throw URLError(.clientCertificateRejected)
                case 500..<599:
                    throw URLError(.badServerResponse)
                default:
                    throw URLError(.unknown)
                }
            }
            // publisher로 내뱉는 경우에는 decode라는 함수를 제공한다.
            .decode(type: CenterAPIResponse.self, decoder: JSONDecoder())
            .map{ $0.data } // 가져온 response에서 data만 뽑음
            .mapError{ $0 as! URLError } // 에러가 나타났을 경우 설정
            .eraseToAnyPublisher()
    }
}
