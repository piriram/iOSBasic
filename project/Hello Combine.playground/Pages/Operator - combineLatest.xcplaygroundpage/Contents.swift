//: [Previous](@previous)
import Foundation
import Combine


// Basic CombineLatest
//두개의 퍼블리셔를 제작
let strPublisher = PassthroughSubject<String, Never>()
let numPublisher = PassthroughSubject<Int, Never>()

//ComblineLatest : 최근의 데이터를 조합해서 내보내준다. -> 다만 튜플로 가져옴

//Publishers.CombineLatest(strPublisher, numPublisher).sink { (str, num) in
//    print("Receive: \(str), \(num)")
//}
strPublisher.combineLatest(numPublisher).sink { (str, num) in
    print("Receive: \(str), \(num)")
}


//strPublisher.send("a")
//strPublisher.send("b")
//strPublisher.send("c")
//
//numPublisher.send(1)
//c,1
//numPublisher.send(2)
//c,2
//numPublisher.send(3)
//c,3
strPublisher.send("a")
numPublisher.send(1)
strPublisher.send("b")
strPublisher.send("c")

numPublisher.send(2)
numPublisher.send(3)



// Advanced CombineLatest
//: **simulate** input from text fields with subjects
let usernamePublisher = PassthroughSubject<String, Never>()
let passwordPublisher = PassthroughSubject<String, Never>()

//: **combine** the latest value of each input to compute a validation
let validatedCredentialsSubscription = Publishers.CombineLatest(usernamePublisher, passwordPublisher)
    .map { (username, password) -> Bool in
        !username.isEmpty && !password.isEmpty && password.count > 12 //패스워드에 조건을 설정하여 유효한 조건만을 출력
    }
    .sink { valid in
        print("CombineLatest: are the credentials valid? \(valid)")
    }

//: Example: simulate typing a username and the password twice
usernamePublisher.send("jasonlee")
passwordPublisher.send("weakpw") //false
passwordPublisher.send("verystrongpassword") //true


// Merge
//let publisher1 = [1,2,3,4,5].publisher
//let publisher2 = [300,400,500].publisher
//두개의 데이터가 같은 타입이라면
let publisher1 = ["1","2","3","4","5"].publisher
let publisher2 = ["300","400","500"].publisher

let mergedPublishersSubscription = Publishers //머지는 두개의 퍼블리셔 아웃풋 타입이 같아야한다.
    .Merge(publisher1, publisher2)
    .sink { value in
        print("Merge: subscription received value \(value)")
}



//: [Next](@next)
