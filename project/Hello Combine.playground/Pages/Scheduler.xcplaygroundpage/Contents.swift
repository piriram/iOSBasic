//: [Previous](@previous)

import Foundation
import Combine

//스케줄러는 클로저가 어떻게 실행될건지 결정해준다.
//어떤 쓰레드에서 실행될건지 정해준다.
let arrPublisher = [1,2,3].publisher

let queue = DispatchQueue(label: "custom")

let subscription = arrPublisher
    .subscribe(on: queue)
    .map{ value -> Int in
        print("transform: \(value),thread:\(Thread.current)")
        return value
        
    }
    .receive(on:DispatchQueue.main)
    .sink{value in
    print("Receive Value: \(value),theread: \(Thread.current)")
    
}

//헤비한 쓰레드는 메인 쓰레드에서 돌아가면 x
//커스텀 쓰레드로 옮긴다.
// 메인쓰레드넘버는 1 


//: [Next](@next)
