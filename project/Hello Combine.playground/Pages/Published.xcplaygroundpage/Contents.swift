//: [Previous](@previous)

import Foundation
import UIKit
import Combine

//Published는 클래스에서만 쓸 수 있다.
final class SomeViewModel {
    @Published var name: String = "Jack"
    var age: Int = 20
}

final class Lable{
    var text: String = ""
}

let vm = SomeViewModel()
let label = Lable()
print("text: \(label.text)")

vm.$name.assign(to: \.text, on: label)
print("text: \(label.text)")
//Published는 사용할 때 달러 사인을 사용함

vm.name = "Jason"
print("text: \(label.text)")

vm.name = "Hoo"
vm.age = 40 //변경안됨

print("text: \(label.text)")

//: [Next](@next)
