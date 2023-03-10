//: [Previous](@previous)

import Foundation
import Combine

// Publisher & Subscriber
//퍼블리셔 : 데이터를 배출

let just = Just(1000)
//빌트인 퍼블리셔 -> Just(값)와 Future(함수) 존재

let subscription1 = just.sink{ value in
    print("Received Value: \(value)")
}
//빌트인 Subscriber -> assign(퍼블리셔로부터 데이터를 받아 키패스에 할당)
//sink(데이터 제공받는 클로져 제공)

let arrayPublisher = [1,3,5,7,9].publisher
let subscription2 = arrayPublisher.sink{ value in
    print("Received Value: \(value)")
    
}

class MyClass{
    var property: Int = 0 {
        didSet{
            print("Did set property to \(property)")
        }
    }
}

let object = MyClass()
let subscription3 = arrayPublisher.assign(to: \.property, on: object) //배열을 배출 -> MyClass 객체에 할당
print("Final Value: \(object.property)")
object.property = 3









//: [Next](@next)


