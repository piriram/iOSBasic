//: [Previous](@previous)

import Foundation
import Combine

//Publisher에게 받은 값을 가공해서 Subscriber에게 제공하는 Operator
// Transform - Map
let numPublisher = PassthroughSubject<Int,Never>()
let subscription1 = numPublisher
    .map{ $0 * 2 }
    .sink { value in
        print("Transformed Value: \(value)")
    }
numPublisher.send(10)
numPublisher.send(20)
numPublisher.send(30)
subscription1.cancel()


// Filter
let stringPublisher = PassthroughSubject<String,Never>()
let subscription2 = stringPublisher
    .filter{ $0.contains("a")}//a를 포함한 것만 넘겨라
    .sink{ value in
        print("Filtered Value: \(value)")
    }
stringPublisher.send("abc")
stringPublisher.send("Jack")
stringPublisher.send("Ryujin")
stringPublisher.send("Ria")
stringPublisher.send("YEJI")
subscription2.cancel()


//: [Next](@next)
