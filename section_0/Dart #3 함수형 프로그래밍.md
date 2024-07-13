# Dart #3 함수형 프로그래밍 (Functional Programming)

### 여러가지 방식의 형변환

- toList
- asMap
- asMap

```dart
void main(){
  List<String> blackPink = ['로제', '지수', '리사', '제니', '제니'];

  print(blackPink); // [로제, 지수, 리사, 제니, 제니]
  print(blackPink.asMap()); // {0: 로제, 1: 지수, 2: 리사, 3: 제니, 4: 제니}
  print(blackPink.toSet()); // {로제, 지수, 리사, 제니}

  Map blackPinkMap = blackPink.asMap(); // Map으로 변환

  print(blackPinkMap.keys.toList()); // [0, 1, 2, 3, 4]
  // 리스트로 변환
  print(blackPinkMap.values.toList()); // [로제, 지수, 리사, 제니, 제니]

  Set blackPinkSet = Set.from(blackPink); // Set으로 변환
  // 리스트로 변환
  print(blackPinkSet.toList()); // [로제, 지수, 리사, 제니]
}
```

<br>

### map

- 리스트를 맵핑
- 맵 함수를 쓰면 새로운 리스트가 생성됨.
- 원소가 같아도 새로운 리스트로 인식함.
- 값이 있지만 인식을 못할때 ! 사용하여 값이 있음을 알려줄 수 있음.

<br>

일반 함수로 사용
```dart
  final newBlackPink = blackPink.map((x) {
    return '블랙핑크 $x';
  });
```

화살표 함수로 사용
```dart
  final newBlackPink2 = blackPink.map((x) => '블랙핑크 $x');
```

<br>

```dart
void main(){
  List<String> blackPink = ['로제', '지수', '리사', '제니', '제니'];

  final newBlackPink = blackPink.map((x) {
    return '블랙핑크 $x';
  });

  print(blackPink); // [로제, 지수, 리사, 제니, 제니]
  print(newBlackPink.toList()); // [블랙핑크 로제, 블랙핑크 지수, 블랙핑크 리사, 블랙핑크 제니, 블랙핑크 제니]

  final newBlackPink2 = blackPink.map((x) => '블랙핑크 $x');

  print(newBlackPink2.toList()); // [블랙핑크 로제, 블랙핑크 지수, 블랙핑크 리사, 블랙핑크 제니, 블랙핑크 제니]

  print(blackPink == blackPink); // true
  print(newBlackPink == blackPink); // false
  print(newBlackPink == newBlackPink2); // false

  // [1.jpg, 3.jpg, 5.jpg, 7.jpg, 9.jpg] 형태 만들기
  String number = '13579';

  final parsed = number.split('').map((x) => '$x.jpg').toList();

  print(parsed); // [1.jpg, 3.jpg, 5.jpg, 7.jpg, 9.jpg]
}
```

<br>

### map 자주 쓰는 패턴

- Map 자체를 새로운 Map으로 만들 때의 패턴
- key, value 각각 리스트 형으로 변경도 가능
- `MapEntry`- 맵의 형태로 돌려주기

```dart
 void main(){
  Map<String, String> harryPotter = {
    'Harry Potter' : '해리 포터',
    'Ron Weasley' : '론 위즐리',
    'Hermione Granger' : '헤르미온느 그레인저'
  };

  final result = harryPotter.map(
    (key, value) => MapEntry(
      'Harry Potter Character $key', 
      '해리포터 캐릭터 $value',
    ),
  );

  print(harryPotter); 
  // {Harry Potter: 해리 포터, Ron Weasley: 론 위즐리, Hermione Granger: 헤르미온느 그레인저}
  print(result);
  // {Harry Potter Character Harry Potter: 해리포터 캐릭터 해리 포터, Harry Potter Character Ron Weasley: 해리포터 캐릭터 론 위즐리, Harry Potter Character Hermione Granger: 해리포터 캐릭터 헤르미온느 그레인저}

  // 많이 쓰는 형태
  final keys = harryPotter.keys.map((x) => 'HPC $x').toList();
  final values = harryPotter.values.map((x) => '해리포터 $x').toList();

  print(keys);
  // [HPC Harry Potter, HPC Ron Weasley, HPC Hermione Granger]
  print(values);
  // [해리포터 해리 포터, 해리포터 론 위즐리, 해리포터 헤르미온느 그레인저]
}
```

<br>

### Set

- 리스트와 상당히 유사한 형식
- Set도 map을 통해서 테이터 값을 변경할 수 있음.

```dart
void main(){
  Set blackPinkSet = {
    '로제',
    '지수',
    '제니',
    '리사'
  };

  final newSet = blackPinkSet.map((x) => '블랙핑크 $x').toSet();

  print(newSet);
  // {블랙핑크 로제, 블랙핑크 지수, 블랙핑크 제니, 블랙핑크 리사}
}
```

<br>

### where ★

- 원본 Map 에 영향을 주지 않으면서, 일치하는 값이 들어있던 key:value만 뽑아서 새로운 Map 추출

```dart
void main(){
  List<Map<String, String>> people = [
    {
      'name' : '로제',
      'group' : '블랙핑크',
    },
    {
      'name' : '지수',
      'group' : '블랙핑크',
    },
    {
      'name' : 'RM',
      'group' : 'BTS',
    },
    {
      'name' : '뷔',
      'group' : 'BTS',
    },
  ];

  print(people);
  // [{name: 로제, group: 블랙핑크}, {name: 지수, group: 블랙핑크}, {name: RM, group: BTS}, {name: 뷔, group: BTS}]

  final blackPink = people.where((x) => x['group'] == '블랙핑크').toList();
  final bts = people.where((x) => x['group'] == 'BTS').toList();

  print(blackPink);
  // [{name: 로제, group: 블랙핑크}, {name: 지수, group: 블랙핑크}]
  print(bts);
  // [{name: RM, group: BTS}, {name: 뷔, group: BTS}]
}
```

<br>

### reduce

- 타입을 지켜서 return 해야한다는 단점이 있음.
- "문자" + "문자" = 문자열의 길이값(숫자) -> 이런거 안됨. (fold 사용)

#### 예제 1-1) 숫자 더하기

일반 함수 형태
```dart
void main(){
  List<int> numbers =[
    1,
    3,
    5,
    7,
    9
  ];

  final result = numbers.reduce((prev, next){
    print('-------------');
    print('previous : $prev');
    print('next : $next');
    print('total : ${prev + next}');

    return prev + next;
    /*
    -------------
    previous : 1
    next : 3
    total : 4
    -------------
    previous : 4
    next : 5
    total : 9
    -------------
    previous : 9
    next : 7
    total : 16
    -------------
    previous : 16
    next : 9
    total : 25
    */
  });

}
```

#### 예제 1-2) 숫자 더하기

화살표 함수 형태 (상단과 동일한 코드)

```dart
void main(){
  List<int> numbers =[
    1,
    3,
    5,
    7,
    9
  ];

  final result = numbers.reduce((prev, next) => prev + next);
  print(result); // 25
}
```

<br>

#### 예제 2) 문자열 더하기

```dart
void main(){
  List<String> words = [
    '안녕하세요 ',
    '저는 ',
    '규원입니다.',
  ];

  final sentence = words.reduce((prev, next) => prev + next);

  print(sentence); // 안녕하세요 저는 규원입니다.
}
```

<br>

### fold

- reduce의 타입을 지켜서 return 해야한다는 단점을 보완한 메소드.
- return할 타입을 먼저 정해주고, 시작할 값을 정해줘야함.
- reduce 계산과 동일하지만, 시작 값부터 start한다는 차이가 있음.

#### 예제 1-1) 숫자 더하기

일반 함수 형식

```dart
void main(){
  List<int> numbers = [1, 3, 5, 7, 9];

  final sum = numbers.fold<int>(0, (prev, next){
    print('-------------');
    print('previous : $prev');
    print('next : $next');
    print('total : ${prev + next}');

    return prev + next;
  });

  print(sum); // reduce 계산과 동일하지만, 시작 값부터 start한다는 차이가 있음.
  /*
  previous : 0
  next : 1
  total : 1
  -------------
  previous : 1
  next : 3
  total : 4
  -------------
  previous : 4
  next : 5
  total : 9
  -------------
  previous : 9
  next : 7
  total : 16
  -------------
  previous : 16
  next : 9
  total : 25
  25
  */
}
```

<br>

#### 예제 1-2) 숫자 더하기

화살표 함수 형식

```dart
void main(){
  List<int> numbers = [1, 3, 5, 7, 9];

  final sum = numbers.fold<int>(0, (prev, next)=> prev + next);

  print(sum); // 25
}
```

<br>

#### 예제 2) 문자열 더하기, 문자열 길이 구하기

- reduce에선 안됐던 문자열 길이 구하기

```dart
void main(){
  List<String> words = [
    '안녕하세요 ',
    '저는 ',
    '규원입니다.'
  ];

  final sentence = words.fold<String>('', (prev, next) => prev + next);

  print(sentence); // 안녕하세요 저는 규원입니다.

  final count = words.fold<int>(0, (prev, next) => prev + next.length);

  print(count); // 15
}
```

<br>

### cascading operator

- ... 을 사용하여 리스트 안에 값들을 풀어 넣어줌.
- 새로운 리스트로 반환해주며, 원본 리스트에 영향 X

```dart
void main() {
  List<int> even = [
    2,
    4,
    6,
    8,
  ];

  List<int> odd = [
    1,
    3,
    5,
    7,
  ];

  // cascading operator
  // ...

  print([...even, ...odd]); // [2, 4, 6, 8, 1, 3, 5, 7]
  print(even); // [2, 4, 6, 8]
  print([...even]); // [2, 4, 6, 8]
  print(even == [...even]); // false
}
```