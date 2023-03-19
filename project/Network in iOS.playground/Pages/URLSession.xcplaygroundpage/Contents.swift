//: [Previous](@previous)

import Foundation

// configuration -> urlsession -> urlsessionTask
let configuration = URLSessionConfiguration.default
let session = URLSession(configuration: configuration)

let url = URL(string: "https://api.github.com/users/piriram")!
/** postman에 새창을 띄어서 사용자의 프로필을 가져오는 URL을 입력
 response status code가 200대여야한다.
 data가 옵셔널이라 가드로 언랩핑
 url이 잘못되면 Status Code가 404가 뜬다
 
 **/
let task = session.dataTask(with: url) { data, response, error in
    guard let httpRespnse = response as? HTTPURLResponse,
          (200..<300).contains(httpRespnse.statusCode) else {
              print("--> rsponse  \(response)")
              return
          }
    guard let data = data else { return }
    
    let result = String(data: data, encoding: .utf8)
    print(result)
}
//completionHandler:데이터를 요청한 것들

task.resume()



//: [Next](@next)
