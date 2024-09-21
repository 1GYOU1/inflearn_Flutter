# [이론] Buttons

### 기본 버튼 타입 3개 살펴보기

flutter에서 공식적으로 제공을 해주는 어느 정도 스타일링이 되어 있는 버튼은 3가지가 있다.

- ElevatedButton
- TextButton
- OutlinedButton

<img width="756" alt="스크린샷 2024-09-20 오후 11 37 22" src="https://github.com/user-attachments/assets/7429f298-5574-4f9f-8fdb-59b986c0a832">

<br>
<br>

### ElevatedButton

- styleFrom() : 버튼의 스타일을 설정하는 메서드
- backgroundColor : 버튼의 배경색
- disabledBackgroundColor : 버튼의 비활성화 상태의 배경색
- foregroundColor : 버튼의 글자색
- shadowColor : 버튼의 그림자색
- elevation : 버튼의 그림자 크기
- textStyle : 버튼의 글자 스타일
- padding : 버튼의 내부 여백
- side : 버튼의 테두리 색상과 두께
- minimumSize : 버튼의 최소 크기
- maximumSize : 버튼의 최대 크기
- fixedSize : 버튼의 크기 고정

```dart
// lib/screen/home_screen.dart

//... 생략
children: [
ElevatedButton(
    // onPressed: null, // 비활성화 상태
    onPressed: () {},
    style: ElevatedButton.styleFrom(
    backgroundColor: Colors.red, // 배경색
    disabledBackgroundColor: Colors.grey, // 비활성화 상태의 배경색
    foregroundColor: Colors.white, // 글자색
    shadowColor: Colors.green, // 그림자색
    elevation: 10, // 그림자 크기
    textStyle: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
    padding: EdgeInsets.all(32.0),
    side: BorderSide(
        color: Colors.black,
        width: 12.0,
    ),
    // minimumSize: Size(300, 150), // 최소 버튼 크기 (minimumSize와 같이 사용할 수 없음)
    // maximumSize: Size(100, 150), // 최대 버튼 크기 (maximumSize와 같이 사용할 수 없음)
    // fixedSize: Size(100, 150), // 버튼 크기 고정
    ),
    child: Text('Elevated Button'),
),
OutlinedButton(
    onPressed: () {},
    child: Text('Outlined Button'),
),
TextButton(onPressed: () {}, child: Text('Text Button')),
],
//... 생략

```

<img width="756" alt="스크린샷 2024-09-22 오전 12 28 34" src="https://github.com/user-attachments/assets/217b83ef-6c6d-47d9-9d77-66b7fd936078">

<br>
<br>

### OutlinedButton과 TextButton

- ElevatedButton에서 작성한 스타일을 OutlinedButton과 TextButton에도 그대로 사용할 수 있다.
- 3가지의 스타일을 제공해주는 것일뿐, 스타일을 동일하게 적용하면 버튼의 모양이 동일해진다.

<img width="756" alt="스크린샷 2024-09-22 오전 12 33 18" src="https://github.com/user-attachments/assets/6c70f25d-d07d-4ea6-b6db-ae447ece961e">

<br>
<br>

### MaterialStateProperty.all() 알아보기

- ButtonStyle을 사용하여 StyleFrom과 동일한 버튼의 스타일을 설정할 수 있다.
	- StyleForm 정의로 가보면 하단과 같이 ButtonStyle을 반환해주는 함수인 것을 확인할 수 있다.
	- ![스크린샷 2024-09-22 오전 1 22 08](https://github.com/user-attachments/assets/80a7ef96-defe-4c89-acc2-23cb7c30038d)

<br>

**flutter 최신 버전 이슈**

- StyleForm에서 사용하는 것과 같이 backgroundColor: Colors.red로 작성하지 않고, MaterialStateProperty.all(Colors.red)로 작성해야 한다 ? 고 하는데 작성하자 경고 메세지가 떴음.

![스크린샷 2024-09-22 오전 12 54 52](https://github.com/user-attachments/assets/5a13d20b-8307-43fd-b603-118857b62124)

**ButtonStyle - backgroundColor 정의**

![스크린샷 2024-09-22 오전 1 15 59](https://github.com/user-attachments/assets/b5057c0a-9bf6-4f0c-9ce4-e989da1df1e7)

- MaterialStateProperty을 사용하면 경고 메세지가 뜨는데, <br>
	Flutter의 최신 버전은 MaterialStateProperty -> **WidgetStateProperty**로 변경하는 것을 권장(자동 대체 해주긴 함)
	- https://api.flutter.dev/flutter/material/MaterialStateProperty.html
	- 'Material 외부에서 코드를 사용할 수 있도록 위젯 레이어로 이동
	- 디자인에 국한되지 않고 더 넓은 범위의 위젯에서 사용할 수 있도록 하기 위함
	
<br>

**WidgetStateProperty**
- **WidgetStateProperty.all()** : 하단과 같은 모든 상태에 대해 동일한 스타일을 적용
- **WidgetStateProperty.resolveWith()** : 버튼의 상태에 따라 스타일을 변경할 수 있는 속성
	- hovered : 버튼에 마우스가 올라갔을 때 (마우스 커서를 올려놓은 상태)
	- focused : 버튼에 포커스가 되었을 때 (텍스트 필드)
	- pressed : 버튼을 눌렀을 때
	- dragged : 버튼을 드래그 하고 있을 때
	- selected : 버튼이 선택되었을 때 (체크박스, 라디오 버튼)
	- scrolledUnder : 다른 컴포넌트 밑으로 스크롤링 되었을 때
	- disabled : 버튼이 비활성화 되었을 때
	- error : 에러 상태일 때

<br>

코드 사용 예시
```dart
// lib/screen/home_screen.dart

//...
OutlinedButton(
	onPressed: () {},
	style: ButtonStyle(
		backgroundColor: WidgetStateProperty.all(Colors.pink),
		foregroundColor: WidgetStateProperty.all(Colors.white),
		minimumSize: WidgetStateProperty.all(Size(200, 150)),
	),
	child: Text('Outlined Button'),
),
TextButton(onPressed: () {}, child: Text('Text Button')),
//...
```

<img width="754" alt="스크린샷 2024-09-22 오전 1 28 15" src="https://github.com/user-attachments/assets/986f967a-8095-47d3-85d1-cb73c4551824">

<br>
<br>

### MaterialStateProperty.resolveWith() 알아보기

```dart
TextButton(
onPressed: () {},
style: ButtonStyle(
	backgroundColor: WidgetStateProperty.resolveWith(
		(Set<WidgetState> states) {
		if (states.contains(WidgetState.pressed)) {
			// 버튼을 누르고 있을 때
			return Colors.red;
		}
		return Colors.black;
	}),
	foregroundColor: WidgetStateProperty.resolveWith(
		(Set<WidgetState> states) {
		if (states.contains(WidgetState.pressed)) {
			// 버튼을 누르고 있을 때
			return Colors.black;
		}
		return Colors.white;
	}),
	minimumSize: WidgetStateProperty.resolveWith(
		(Set<WidgetState> states) {
		if (states.contains(WidgetState.pressed)) {
			// 버튼을 누르고 있을 때
			return Size(100, 70);
		}
		return Size(150, 70);
	}),
),
child: Text('Text Button')),
```

![무제](https://github.com/user-attachments/assets/d11eebb9-78c2-4088-943a-3e6df6f89dfd)

<br>
<br>

### Shape 사용해보기

Shape 종류

- StadiumBorder
- RoundedRectangleBorder
- BeveledRectangleBorder
- ContinuousRectangleBorder
- CircleBorder

<br>

- StadiumBorder : 둥근 모서리(default)
	- https://api.flutter.dev/flutter/painting/StadiumBorder-class.html

<img width="754" alt="스크린샷 2024-09-22 오전 2 20 48" src="https://github.com/user-attachments/assets/c596ec0b-7930-4c8a-9e25-cd03078b6666">

```dart
// lib/screen/home_screen.dart
// ...
OutlinedButton(
	onPressed: () {},
	style: OutlinedButton.styleFrom(
		shape: StadiumBorder(),
	),
	child: Text('Outlined Button'),
),
```

<br>

- RoundedRectangleBorder : 모서리가 둥근 직사각형 테두리
	- borderRadius : BorderRadius.circular(0 ~ 100) 
		- https://api.flutter.dev/flutter/painting/RoundedRectangleBorder-class.html

```dart
// lib/screen/home_screen.dart
// ...
OutlinedButton(
	onPressed: () {},
	style: OutlinedButton.styleFrom(
		shape: RoundedRectangleBorder(
			borderRadius: BorderRadius.circular(32.0),
		),
	),
	child: Text('Outlined Button'),
),
// ...
```

BorderRadius.circular(0)

<img width="754" alt="스크린샷 2024-09-22 오전 2 23 02" src="https://github.com/user-attachments/assets/9fc5e81a-098a-483b-9460-12b014fc1d6e">

BorderRadius.circular(32.0)

<img width="754" alt="스크린샷 2024-09-22 오전 2 23 09" src="https://github.com/user-attachments/assets/e3113fdb-8d58-4e4d-9fa3-e95ca1b96516">

<br>

- BeveledRectangleBorder : 육각형 형태로 모서리가 각진 모양(모서리가 평평하거나 비스듬한 모양인 직사각형 테두리)
	- borderRadius : BorderRadius.circular(0 ~ 100) 
		- https://api.flutter.dev/flutter/painting/BeveledRectangleBorder-class.html

```dart
// lib/screen/home_screen.dart
// ...
OutlinedButton(
	onPressed: () {},
	style: OutlinedButton.styleFrom(
		shape: BeveledRectangleBorder(
			borderRadius: BorderRadius.circular(16.0),
		),
	),
	child: Text('Outlined Button'),
),
// ...
```
BorderRadius.circular(0)
<img width="754" alt="스크린샷 2024-09-22 오전 2 24 44" src="https://github.com/user-attachments/assets/ad78f0e1-fe9e-488e-b77b-935cf7d4c05c">

BorderRadius.circular(16.0)
<img width="754" alt="스크린샷 2024-09-22 오전 2 24 49" src="https://github.com/user-attachments/assets/7e208981-61df-478a-b7ee-bff2c3e053e2">

<br>

- ContinuousRectangleBorder : 직선과 둥근 모서리 사이에 매끄럽고 연속적인 전환이 이루어지는 직사각형 테두리
	- borderRadius : BorderRadius.circular(0 ~ 100) 
		- https://api.flutter.dev/flutter/painting/ContinuousRectangleBorder-class.html

```dart
// lib/screen/home_screen.dart
// ...
OutlinedButton(
	onPressed: () {},
	style: OutlinedButton.styleFrom(
		shape: ContinuousRectangleBorder(
			borderRadius: BorderRadius.circular(20.0),
		),
	),
	child: Text('Outlined Button'),
),
// ...
```

<img width="754" alt="스크린샷 2024-09-22 오전 2 19 26" src="https://github.com/user-attachments/assets/6fb5b302-42ae-4935-93e7-51672f687e8b">

<br>

- CircleBorder : 원형
	- eccentricty : 0~1(소수점 사용 가능, 0 값은 변형이 없음(원형의 두 변 이상에 닿음)을 의미하고, 1 값은 완전한 변형(타원이 사각형의 모든 변에 닿음)을 의미) 
		- https://api.flutter.dev/flutter/painting/CircleBorder-class.html

```dart
// lib/screen/home_screen.dart
// ...
OutlinedButton(
	onPressed: () {},
	style: OutlinedButton.styleFrom(
		shape: CircleBorder(
			eccentricity: 0,
		),
	),
	child: Text('Outlined Button'),
),
// ...
```

eccentricity: 0

<img width="754" alt="스크린샷 2024-09-22 오전 2 27 00" src="https://github.com/user-attachments/assets/27c44a47-cbe2-405f-8e5f-f5dff4953d5d">

eccentricity: 0.7

<img width="754" alt="스크린샷 2024-09-22 오전 2 28 02" src="https://github.com/user-attachments/assets/5db6cda9-b684-498c-8c7f-db41f1aa25cf">

<br>
<br>

### IconButton 사용해보기

- 아이콘과 함께 노출이 필요한 버튼을 사용하는 경우, icon 컨스트럭터를 사용하여 아이콘을 노출할 수 있다.

```dart
// lib/screen/home_screen.dart
// ...
ElevatedButton.icon(
	onPressed: () {},
	label: Text('키보드'),
	icon: Icon(Icons.keyboard_alt_outlined),
),
TextButton.icon(
	onPressed: () {},
	label: Text('키보드'),
	icon: Icon(Icons.keyboard_alt_outlined),
),
OutlinedButton.icon(
	onPressed: () {},
	label: Text('키보드'),
	icon: Icon(Icons.keyboard_alt_outlined),
),
//...
```

<img width="754" alt="스크린샷 2024-09-22 오전 2 33 06" src="https://github.com/user-attachments/assets/8c141d1f-5732-4ab0-bcf8-7dc154d4f4c6">