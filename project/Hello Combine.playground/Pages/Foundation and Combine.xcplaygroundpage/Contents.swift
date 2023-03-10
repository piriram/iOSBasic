//: [Previous](@previous)

import Foundation
import Combine
import UIKit



// URLSessionTask Publisher and JSON Decoding Operator <- publisher
//서버에서 데이터를 받아

struct SomeDecodable: Decodable{ }
URLSession.shared.dataTaskPublisher(for: URL(string: "https://www.google.com")!)
    .map { data, response in
        return data
        
    }
    .decode(type: SomeDecodable.self, decoder: JSONDecoder())

// Notifications:노티를 계속 쏘는 것 , 노티를 옵절빙하고 있는 게 있으면 받아서 수행

let center = NotificationCenter.default
let noti = Notification.Name("MyNoti")
let notiPublisher = center.publisher(for: noti,object: nil)
let subscription1 = notiPublisher.sink{ _ in
    print("Noti Received")
    
}

center.post(name: noti,object: nil)



// KeyPath binding to NSObject instances

let ageLable = UILabel()
print("text: \(ageLable.text)")

Just(28)
    .map { "Age is \($0)" }
    .assign(to: \.text, on: ageLable)
print("text: \(ageLable.text)")


// Timer
// autoconnect 를 이용하면 subscribe 되면 바로 시작함
let timerPublisher = Timer
    .publish(every: 1, on: .main, in: .common) //1초마다 보통방법으로
    .autoconnect()//알아서 타이머가 동작

let subscription2 = timerPublisher.sink{ time in
    print("time: \(time)")
    
}

DispatchQueue.main.asyncAfter(deadline: .now()+5){ //5초후에 타이머 종료
    subscription2.cancel()
}

//: [Next](@next)
