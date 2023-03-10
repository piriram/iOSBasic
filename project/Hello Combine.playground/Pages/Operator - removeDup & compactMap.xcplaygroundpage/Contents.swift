//: [Previous](@previous)
import Foundation
import Combine

var subscriptions = Set<AnyCancellable>()

// removeDuplicates : 중복된 것을 제거
let words = "hey hey there! Mr Mr ?"
                .components(separatedBy: " ")
                .publisher

words
  .removeDuplicates()
  .sink(receiveValue: {
    print($0)
  })
  .store(in: &subscriptions)


// compactMap :
let strings = ["a", "1.24", "3", "def", "45", "0.23"].publisher

//let float = Float("a") -> nil,변환x

strings
  .compactMap { Float($0) }//nil인경우는제외
  .sink(receiveValue: {
    print($0)
  })
  .store(in: &subscriptions)

// ignoreOutput : 새로들어오는 이벤트 데이터를 신경쓰고 싶지않을 때
let numbers = (1...10_000).publisher

numbers
  .ignoreOutput()
  .sink(receiveCompletion: { print("Completed with: \($0)") },
        receiveValue: { print($0) })
  .store(in: &subscriptions)


// prefix : 몇개의 데이터만 받겠다 ex.앞의 세개만
let tens = (1...10).publisher

tens
  .prefix(2)
  .sink(receiveCompletion: { print("Completed with: \($0)") },
        receiveValue: { print($0) })
  .store(in: &subscriptions)

//: [Next](@next)
