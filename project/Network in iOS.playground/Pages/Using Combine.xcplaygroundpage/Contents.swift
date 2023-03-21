//: [Previous](@previous)

import Foundation
import Combine

enum NetworkError: Error {
    case invalidRequest
    case responseError(statusCode: Int)
}

struct GithubProfile: Codable {
    let login: String
    let avatarUrl: String
    let htmlUrl: String
    let followers: Int
    let following: Int
    
    enum CodingKeys: String, CodingKey {
        case login
        case avatarUrl = "avatar_url"
        case htmlUrl = "html_url"
        case followers
        case following
    }
}

final class NetworkService {
    
    let session: URLSession
    
    init(configuration: URLSessionConfiguration) {
        session = URLSession(configuration: configuration)
    }
    
    func fetchProfile(userName: String) -> AnyPublisher<GithubProfile, Error> {
        let urlString = "https://api.github.com/users/\(userName)"
        let url = URL(string: urlString)!
        
        return session
            .dataTaskPublisher(for: url)//서버에서 받은 response 확인 및 data
            .tryMap { result -> Data in
                guard let response = result.response as? HTTPURLResponse,
                      (200..<300).contains(response.statusCode)
                else {
                    let response = result.response as? HTTPURLResponse
                    let statusCode = response?.statusCode ?? -1//stausCode가 없으면
                    throw NetworkError.responseError(statusCode: statusCode)
                }
                //받은 데이타 디코딩 잘하기
                return result.data
            }
            .decode(type: GithubProfile.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}


let networkService = NetworkService(configuration: .default)
let subscription = networkService
    .fetchProfile(userName: "piriram")
    .receive(on: RunLoop.main)
//    .retry(3)
//retry가 메소드로 있어서 쉽다.
    .sink { error in
        print("error: \(error)")
    } receiveValue: { profile in
        print("profile: \(profile)")
    }

//: [Next](@next)


