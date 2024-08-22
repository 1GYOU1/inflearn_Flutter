# [프로젝트] [★☆☆☆☆] Image Carousel (전자액자)

### 프로젝트 목표 주요 포인트
- 이미지 사용법
- PageView 사용법
- Timer 사용법
- map() 함수 실전
- initState(), dispose() 실전
- 상태바 테마 변경

<br>

### Timer 이론

- **Timer**는 지정한 시간이 지난 뒤 한번 또는 주기적으로 무언가를 실행 할 수 있게 해준다.
- **Timer**는 pubspec.yaml에다가 추가를 따로 하지 않아도 플러터에 기본 제공되는 dart:async 패키지를 간단하게 불러오면 사용할 수 있다.

<br>

### 1) Timer 단일 실행

```dart
import 'dart:async';

void main(){
  Timer(
    Duration(시, 분, 초: 숫자), // 기간
    (){
        함수; // 동작할 함수
    },
  );
}
``` 

![Untitled-1](https://github.com/user-attachments/assets/7fd0b17a-f466-42fe-96f4-bba0f7d37fde)

<br>

### 2) Timer 반복 실행

- 반복 실행은, 타이머 값이 파라미터 안에 우리가 실행할 때 사용했던 인스턴스를 그대로 반환해준다.
- 반복 실행을 timer.cancle 이라는 함수를 실행해줘서 취소할 수 있다.
- 단일 실행과의 한 가지 차이점은 타이머 클래스에 .periodic 이라는 생성자(네임드 생성자)를 사용해야한다.

![Untitled-1](https://github.com/user-attachments/assets/2aa21fa1-b1da-43d1-87d3-5d1975d44768)

<br>
<br>

### Timer 실습