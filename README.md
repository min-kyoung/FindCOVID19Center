# FindCOVID19Center
## Description
* 공공 API로 제공되고 있는 데이터를 활용하여 예방접종 센터를 조회할 수 있게 하는 앱이다.
* 각 지자체 별로 센터가 몇 곳이 있는지 표시하고, 특정 지자체를 클릭하면 해당 지자체에 있는 여러 센터 목록을 리스트로 보여준다. 이어서 리스트를 클릭하면 mapView로 위치르 보여주며 전화도 걸 수 있도록 한다.
* Apple의 Combine framework와 SwiftUI를 결합하여 구현하였다.
#### 구현화면
<img src="https://user-images.githubusercontent.com/62936197/161540735-6e83f41e-2387-4d8a-8512-85ac065a03e9.png" width="150" height="320"> 　
<img src="https://user-images.githubusercontent.com/62936197/161540741-58f701e6-4b72-47bb-b667-e2f92042b598.png" width="150" height="320"> 　
<img src="https://user-images.githubusercontent.com/62936197/161540749-55c8c00d-ac76-42b8-8cb2-c41f8b13ef46.png" width="150" height="320"> 　
## Prerequisite
* Combine을 사용하기 위해서는 iOS 13 이상의 타겟이 필요하다.
* XCode Version 13.2.1에서 개발을 진행하였다.
* 공공데이터 API를 받아올 예정이므로 https://www.data.go.kr/tcs/dss/selectApiDataDetailView.do?publicDataPk=15077586 에서 해당 API에 대한 활용신청을 하여 API KEY 값을 받는다.
## Usage
#### Combine
* 시간이 지남에 따라 발생하는 값처리를 위해 통합된 선언적 API로, 이벤트 처리 연산자를 결합해서 비동기 이벤트 처리를 커스터마이징할 수 있다.
* 이벤트 처리 코드를 중앙집중화하고 중첩된 closure, convention 기반 callback과 같은 번거로운 기술을 제어해서 코드를 쉽게 읽고 유지관리할 수 있게 한다.
* 즉, 비동기적으로 발생하는 각종 액션들을 시간이 지남에 따라 발생하는 값으로 보고 이것을 처리할 수 있도록 정리한 것이다. 
* combine의 핵심요소는 Publisher, Subscriber, Operator, Subscription이다.
	* Publisher : 시간이 지남에 따라 변경될 수 있는 값을 내보낸다.
	* Subscriber : 이러한 publisher로부터 해당 값을 받도록 선언한다.
	* Operator : 여러 종류의 Operator를 Combine하여 Publisher가 내보낸 값을 처리한다.
	* Subscription : Publisher와 Subscriber의 연결을 나타낸다.
