//: [Previous](@previous)

import Foundation
import Combine

let subject = PassthroughSubject<String,Never>()
// PassthroughSubject : 빌트인 퍼블리셔,<output type,failure type>
//Never:실패 타입이 없다


// The print() operator prints you all lifecycle events
let subscription = subject
    .print("[Debug]")//디버그 용임을 알기 쉽게 표시
    .sink{ value in
    //print("Subscriber received value: \(value)")
}

subject.send("hello")
subject.send("Hello again!")
subject.send("Hellor for the last time!")
//subject.send(completion: .finished)
//퍼블리셔가 직접 관계를 끊는 것
subscription.cancel()
//구독자가 직접 관계를 끊기
subject.send("Hello ?? :(")//이 string은 출력되지않음
//: [Next](@next)
