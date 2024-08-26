# DateTime & Duration

### 이론

- DateTimer은 날짜를 표현하는 클래스고, Duration은 기간을 표현하는 클래스다.


### DateTime 기본 사용법

- positional parameter 사용하여 순서대로 입력 필요. 년도 필수 입력이고, 나머지는 옵셔널이다.

![Untitled-1-Recovered](https://github.com/user-attachments/assets/161cbe9b-8022-418a-baa6-8eecfc3fe637)

<br>

### UTC란?

- Coordinated Universal Time의 약자
- 가장 많이 사용되는 기준.
- 나라마다 시간이 달라서 **기준이 되는 시간**에서부터 자동으로 현재 위치(프로그램 실행시 런타임에 입력이 되어있는) 시간대로 계산되어 표현된다.

![Untitled-1-Recovered](https://github.com/user-attachments/assets/4c7ecc26-ed0c-4952-a291-71f087c82b48)

![Untitled-1-Recovered](https://github.com/user-attachments/assets/cc4b6037-25c1-440c-b9f0-6c936c494526)

<br>

### DateTime.now() 사용법

- 이 코드가 실행되는 순간에 날짜와 시간을 알려줌.

![Untitled-1-Recovered](https://github.com/user-attachments/assets/82e9457e-bfe1-4a82-a3b7-0f03296eb50c)

<br>

### Duration 기본 사용법

- 기간을 나타냄
- 특정 부분만 골라 사용할 수 있도록 named parameter 사용
- 값을 입력하지 않은 부분은 0으로 초기화된다.

![Untitled-1-Recovered](https://github.com/user-attachments/assets/88cd6035-8ebf-4a2d-ba3b-0dcbc2ca09d6)

<br>

### DateTime.add() / DateTime.subtract()

- DateTime.add() 시간 더하기
- DateTime.subtract() 시간 빼기

![Untitled-1-Recovered](https://github.com/user-attachments/assets/5f287acc-9fed-4cf4-9f33-10b412492667)

<br>

### DateTime.isAfter() / DateTime.isBefore()

- DateTime.isAfter() - 이후 시간인지
- DateTime.isBefore() - 이전 시간인지
- isAtSameMomentAs() - 같은 순간인지(년, 월, 일, 시간, 분, 초, 마이크로초, 밀리초 전부 같아야 true)

![Untitled-1-Recovered](https://github.com/user-attachments/assets/514de0b0-c889-4d06-92b8-1622ed22fa3f)

<br>

### DateTime.toUtc() / DateTime.toLocal()

- 변수에 .toUtc()를 붙이면 UTC 시간대로 변경할 수 있다. 현지 시간대 -> UTC 시간대
- .toLocal()를 사용하면 현지 시간대로 변경할 수 있다. UTC 시간대 -> 현지 시간대
- UTC 시간대는 출력시 맨 뒤에 Z가 붙어있음.
- 현지 시간대는 어디를 기준으로 한 건지 모르기 때문에 명확한 기준점이라고 볼 수 없음.

![Untitled-1-Recovered](https://github.com/user-attachments/assets/d5c3e95c-fb08-4290-8196-194e8a6e0420)

<br>
<br>

### 실습

#### DateTime 기본 사용법

- 년도 필수 입력 

![Untitled-1-Recovered](https://github.com/user-attachments/assets/5531d53c-7e03-4e83-9717-16a9ddb282d9)

<br>

#### utc 선언

- 출력시 마지막에 Z가 붙으면 UTC 시간대
- 국제적으로 배포하는 앱들에서는 정확한 날짜와 시간을 계산할 수 있다.

![Untitled-1-Recovered](https://github.com/user-attachments/assets/408fbf1e-7893-42b3-ba61-5153b786d592)

<br>

#### DateTime.now() 사용법

- DateTime.now() 코드를 실행하는 순간의 날짜와 시간

![Untitled-1-Recovered](https://github.com/user-attachments/assets/b7de457c-0e6f-4f86-89a3-a537a8c7509e)

<br>

#### Duration

- Duration 기간을 의미한다.
- 하단 코드 : 1일(24시간) + 2시간 + 20분 = 26:20:00.000000

![Untitled-1-Recovered](https://github.com/user-attachments/assets/54cd6c45-df48-4ae3-b7e0-4cd7075aa00f)

<br>

#### .add() / .subtract()

- 하단 코드와 같이 add(기간)은 기존 값 + 기간을 의미한다.
- subtract(기간)은 기존 값 - 기간을 의미한다.

![Untitled-1-Recovered](https://github.com/user-attachments/assets/6e35ad09-029d-49c3-8665-429c2b6bb2f9)

<br>

#### .isAfter() / .isBefore() / .isAtSameMomentAs

- isAfter 이후인지
- isBefore 이전인지
- isAtSameMomentAs 같은 순간인지

![Untitled-1-Recovered](https://github.com/user-attachments/assets/c04da183-413c-4258-aa62-a622e187e7ce)

![Untitled-1-Recovered](https://github.com/user-attachments/assets/b16e5a91-044a-448e-9241-3b7b92feb200)

<br>

#### .toUtc() / .toLocal()

- toUtc() - UTC 시간대로 변경
- toLocal() - 현지 시간대로 변경
- 현지 시간대 변수를 toLocal() 사용해서 한번 더 현지 시간대로 변경해도 변하지 않는다.
- utc 시간대 변수를 toUtc() 사용해서 한번 더 utc 시간대로 변경해도 변하지 않는다.

![Untitled-1-Recovered](https://github.com/user-attachments/assets/e6ac7417-b44b-4e62-a324-703c09fd73a0)