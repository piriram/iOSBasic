//: [Previous](@previous)

import Foundation
/*
 코더블을 이용해보자
 App Model < -- JSON : (Decoading)
 
 */

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

// App Model <-> JSON: (Decoding)
let configuration = URLSessionConfiguration.default
let session = URLSession(configuration: configuration)

let url = URL(string: "https://api.github.com/users/priram")!

let task = session.dataTask(with: url) { data, response, error in
    guard let httpResponse = response as? HTTPURLResponse, (200..<300).contains(httpResponse.statusCode) else {
        print("--> response \(response)")
        return
    }
    
    guard let data = data else { return }
    // data -> GithubProfile
    do {
        let decoder = JSONDecoder()
        let profile = try decoder.decode(GithubProfile.self, from: data)
        print("profile: \(profile)")
    } catch let error as NSError {
        print("error: \(error)")
    }
    
    let result = String(data: data, encoding: .utf8)
    print(result)
}

task.resume()
//completionHandler:데이터를 요청한 것들









//: [Next](@next)
