# iOSBasic
개인공부용 디렉토리

### swift 문법
* [야곰님 유튜브](https://www.youtube.com/watch?v=2n-fSlW-jts&list=PLz8NH7YHUj_ZmlgcSETF51Z9GSSU6Uioy)<br>
* [정리 깃허브](https://github.com/devxoul/ios-with-swift-in-40-hours/blob/master/SUMMARY.md)<br>
* [스탠포드 ios 강의](https://www.inflearn.com/course/stanford-ios-%ED%95%9C%EA%B8%80%EC%9E%90%EB%A7%89-%EA%B0%95%EC%9D%98#curriculum)<br>
* [어썸 깃허브](https://github.com/ClintJang/awesome-swift-korean-lecture)<br>
* [문자열 개념 블로그](https://blog.naver.com/neta6603/222897688102)
* [문자열 블로그 2](https://junstar92.tistory.com/257)
### ios 개발에 도움되는 링크 모음
* [이모지 유니코드 확인](https://apps.timwhitlock.info/emoji/tables/unicode)
* [safe area](https://wit.nts-corp.com/2019/10/24/5731)
* [auto layout](https://jegyun97.tistory.com/14)

### 23-1 캡스톤

* [XCode 헤더 주석 저작권 없애기](https://blog.naver.com/rlawnguq12/222852489983)
* [검색창1](https://iamcho2.github.io/2021/05/06/customizing-UISearchBar)

## ObjectWillChange
- 사용 사례
  - @Published가 아닌 변수의 변화도 체크할 수 있게해줌
```swift
class ViewModel: ObservableObject {
    var score = 0 {
        willSet(newValue) {
            if score % 3 == 0 {
                objectWillChange.send()
            }
        }
    }
}
```
  -  
- `ObservableObject`를 준수하는 클래스 내부에서 사용가능
## Publisher
- 오늘은 테크 얘기를 해봤당~
- 데이터를 생성하고 구독자에게 전달하는 객체
## Published
- '@Published`로 선언된 프로퍼티의 값이 변경될 때마다 Subscriber에게 알림을 보냄
  - 알림을 받은 View는 자동으로 업데이트 됨 
- 
