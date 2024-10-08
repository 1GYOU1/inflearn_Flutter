# [프로젝트] [★★★☆☆] Video Call (영상통화)

### 프로젝트 소개

![Untitled-1](https://github.com/user-attachments/assets/490e11f1-75b4-4df5-a991-f157e55486a1)

- 시뮬레이터(ios)에서는 영상통화 기능을 제공해 주지 않아서 실제 기기에서 테스트 해야 함. 때문에 애뮬레이터로 진행.

- Agora : 영상통화 서버로 활용할 서비스(한달에 1만 분까지 무료 제공)
- BoxShadow : 그림자 효과
- Permission : 권한 요청 관련 패키지 (카메라 권한, 오디오 권한 등)
- Stack : 위젯 위에 위젯을 쌓아 올리는 역할

<br>

### Agora 가입하기

- https://www.agora.io/en/
- 영상통화를 하려면 여러 개의 핸드폰들을 중계해주는 서버가 필요하여, 이러한 서버를 제공하는 서비스
- 매월 첫 10,000분 무료 영상통화 서비스 사용 예정

<br>

1. 회원 가입 후 프로젝트 생성, 왼쪽 앱 아이디와 토큰 모두 사용하는 프로젝트 생성

![스크린샷 2024-10-05 오전 12 07 58](https://github.com/user-attachments/assets/2e31fd21-d45f-4332-bba4-32e642959ecb)

<br>

2. Edit 버튼 클릭, Generate Temp Token 버튼 클릭, 채널 명 입력, 토큰 복사, App ID 복사

![스크린샷 2024-10-05 오전 12 09 55](https://github.com/user-attachments/assets/ff121c2b-09e7-46f5-857c-6c506578af24)

![스크린샷 2024-10-05 오전 12 10 44](https://github.com/user-attachments/assets/25dc6ffc-d468-464c-b18f-becfe7a3e049)

<br>
<br>

### 플러그인 설치하기

- 다음 강의에서 UI Kit를 사용 안한다고 해서 해당 플러그인 제외하고 진행.

<br>

1. pub.dev 사이트에서 agora_rtc_engine 플러그인 검색, 버전에서 6.3.0 찾아서 복사하여 pubspec.yaml에 붙여넣기
- https://pub.dev/packages/agora_rtc_engine/versions/6.3.0

<img width="1512" alt="스크린샷 2024-10-06 오후 8 32 08" src="https://github.com/user-attachments/assets/93f5dce2-6cf9-428f-b442-30b023ce2916">

<br>

2. android/app/src/main/AndroidManifest.xml 파일에 하단 코드 추가

<img width="1512" alt="스크린샷 2024-10-06 오후 8 38 13" src="https://github.com/user-attachments/assets/5ba8a27e-b696-45a4-9fb8-1d3635731525">

```xml
<!-- android/app/src/main/AndroidManifest.xml -->

<manifest xmlns:android="http://schemas.android.com/apk/res/android">
    <uses-permission android:name="android.permission.INTERNET"/><!--여기부터 추가-->
    <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
    <uses-permission android:name="android.permission.RECORD_AUDIO" />
    <uses-permission android:name="android.permission.CAMERA" />
    <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS" />
    <uses-permission android:name="android.permission.ACCESS_WIFI_STATE" />
    <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE" /><!--여기까지 추가-->
    <application
        android:label="video_call"
        android:name="${applicationName}"
        android:icon="@mipmap/ic_launcher">
```

<br>

3. flutter permission 패키지 pubspec.yaml에 추가
- https://pub.dev/packages/permission_handler/versions/11.3.0

<img width="1512" alt="스크린샷 2024-10-06 오후 8 41 49" src="https://github.com/user-attachments/assets/6305e9f7-cfff-4843-a097-943dd3649dc0">

```yaml
dev_dependencies:
  flutter_test:
    sdk: flutter

  # The "flutter_lints" package below contains a set of recommended lints to
  # encourage good coding practices. The lint set provided by the package is
  # activated in the `analysis_options.yaml` file located at the root of your
  # package. See that file for information about deactivating specific lint
  # rules and activating additional ones.
  agora_rtc_engine: ^6.3.0 # agora 사용할 때 필요한 api
  permission_handler: ^11.3.0 # 권한 패키지

# For information on the generic Dart part of this file, see the
# following page: https://dart.dev/tools/pub/pubspec

# The following section is specific to Flutter packages.
flutter:
```

<br>
<br>

### Asset 파일 추가하기

```yaml
# pubspec.yaml

flutter:

  # The following line ensures that the Material Icons font is
  # included with your application, so that you can use the icons in
  # the material Icons class.
  uses-material-design: true

  assets:
    - asset/img/

  fonts:
    - family: NotoSans
      fonts:
        - asset: asset/font/NotoSansKR-Black.otf
          weight: 900
        - asset: asset/font/NotoSansKR-Bold.otf
          weight: 700
        - asset: asset/font/NotoSansKR-Medium.otf
          weight: 500
        - asset: asset/font/NotoSansKR-Regular.otf
          weight: 400
        - asset: asset/font/NotoSansKR-Light.otf
          weight: 300
        - asset: asset/font/NotoSansKR-Thin.otf
          weight: 100
```

```dart
// main.dart

import 'package:flutter/material.dart';
import 'package:video_call/screen/home_screen.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData( // 기본 폰트 설정
        fontFamily: 'NotoSans',
      ),
      home: HomeScreen(),
    ),
  );
}

```

<br>
<br>

### HomeScreen UI 코딩하기

1. Column 위젯에 넣어둔 3개의 위젯을 Expanded 위젯으로 감싸서 확장시켜 균등하게 배치

![Untitled-1_03](https://github.com/user-attachments/assets/608c2324-d7e8-4bde-b448-17ffeda54b44)

```dart
// home_screen.dart

import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      body: Column(
        children: [
          // 1) 로고
          Expanded(
            child: Container(
              //...
              child: Row(
                children: [
                  Icon(
                    Icons.videocam,
                    color: Colors.white,
                  ),
                  SizedBox(width: 12),
                  Text(
                    'LIVE',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30.0,
                    ),
                  ),
                ],
              //...
            ),
          ),
          // 2) 이미지
          Expanded(
            child: Image.asset('asset/img/home_img.png'),
          ),
          // 3) 버튼
          Expanded(
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
              ),
              child: Text('입장하기'),
            ),
          ),
        ],
      ),
    );
  }
}

```

<br>

2. 상단과 같이 정렬이 되어있지 않으면 각각 최대 사이즈로 차지하기 때문에 Center 위젯으로 감싸서 정렬

```dart
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      body: Column(
        children: [
          // 1) 로고
          Expanded(
            child: Center(
              child: Container(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.videocam,
                      color: Colors.white,
                    ),
                    SizedBox(width: 12),
                    Text(
                      'LIVE',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // 2) 이미지
          Expanded(
            child: Center(
              child: Image.asset('asset/img/home_img.png'),
            ),
          ),
          // 3) 버튼
          Expanded(
            child: Center(
              child: ElevatedButton(
                //...
                child: Text('입장하기'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
```

![Untitled-1_03](https://github.com/user-attachments/assets/b914c225-e76a-449c-9fae-63a3ecd9b420)

<br>

3. 로고 부분에 아이콘과 텍스트를 Row 위젯으로 감싸서 사용했는데, Row에서는 기본 값이 mainAxisSize: MainAxisSize.max라서 최대 사이즈로 차지하기 때문에 min 값으로 설정해줘야 함

```dart
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      body: Column(
        children: [
          // 1) 로고
          Expanded(
            child: Center(
              child: Container(
                child: Row(
                  mainAxisSize: MainAxisSize.min, // 최소 사이즈로 차지
                  children: [
                    Icon(
                      Icons.videocam,
                      color: Colors.white,
                    ),
                    SizedBox(width: 12),
                    Text(
                      'LIVE',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          //...
```

![Untitled-1_03](https://github.com/user-attachments/assets/27760156-ccc3-4f88-965e-797373f4afb0)

<br>

4. 로고 부분을 Padding 위젯으로 감싸서 여백을 주고, borderRadius 값을 주어 둥글게 만들고, BoxShadow로 그림자 효과를 줌.

- color : 그림자 색상
- blurRadius : 번지는 반경
- spreadRadius : blurRadius 안에서 번져나오는 정도

```dart
class _Logo extends StatelessWidget {
  const _Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(16.0),
          boxShadow: [
            BoxShadow(
              color: Colors.blue[300]!,
              blurRadius: 12.0, // 번지는 반경
              spreadRadius: 2.0, // blurRadius 안에서 번져나오는 정도
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.videocam,
                color: Colors.white,
              ),
              SizedBox(width: 12),
              Text(
                'LIVE',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
```

<br>

5. 위젯으로 따로 빼서 코드 정리

```dart
// home_screen.dart

import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      body: Column(
        children: [
          // 1) 로고
          Expanded(
            child: _Logo(),
          ),
          // 2) 이미지
          Expanded(
            child: _Image(),
          ),
          // 3) 버튼
          Expanded(
            child: _Footer(),
          ),
        ],
      ),
    );
  }
}

class _Logo extends StatelessWidget {
  const _Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(16.0),
          boxShadow: [
            BoxShadow(
              color: Colors.blue[300]!,
              blurRadius: 12.0, // 번지는 반경
              spreadRadius: 2.0, // blurRadius 안에서 번져나오는 정도
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.videocam,
                color: Colors.white,
              ),
              SizedBox(width: 12),
              Text(
                'LIVE',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Image extends StatelessWidget {
  const _Image({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset('asset/img/home_img.png'),
    );
  }
}

class _Footer extends StatelessWidget {
  const _Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
        ),
        child: Text('입장하기'),
      ),
    );
  }
}
```

<img width="450" alt="스크린샷 2024-10-06 오후 9 37 52" src="https://github.com/user-attachments/assets/4807b413-0a67-424d-af66-7f8f662f02ca">

<br>
<br>

### CamScreen 레이아웃 만들기

- 메인에서 입장하기 버튼을 누르면 나오는 영상통화 화면 만들기
- lib/screen/cam_screen.dart 파일 만들어주기

```dart
// home_screen.dart
//...
class _Footer extends StatelessWidget {
  const _Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => CamScreen(),
            ),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
        ),
        child: Text('입장하기'),
      ),
    );
  }
}
```

```dart
// cam_screen.dart

import 'package:flutter/material.dart';

class CamScreen extends StatefulWidget {
  const CamScreen({super.key});

  @override
  State<CamScreen> createState() => _CamScreenState();
}

class _CamScreenState extends State<CamScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LIVE'),
      ),
      body: Container(),
    );
  }
}
```

![6-ezgif com-speed](https://github.com/user-attachments/assets/9085721a-f0b5-457c-b09d-2e0673224dea)

<br>

2. Stack 위젯으로 쌓아서 배치하기
- Row와 Column 위젯처럼 children 속성을 사용해서 위젯을 쌓아서 배치할 수 있음
- 하단 코드 기준으로 빨간색 컨테이너가 먼저 쌓이고, 그 위에 파란색 컨테이너가 쌓임(사진 참고)

```dart
// cam_screen.dart

import 'package:flutter/material.dart';

class CamScreen extends StatefulWidget {
  const CamScreen({super.key});

  @override
  State<CamScreen> createState() => _CamScreenState();
}

class _CamScreenState extends State<CamScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LIVE'),
      ),
      body: Stack(
        children: [
          Container(
            width: 120,
            height: 120,
            color: Colors.red,
          ),
          Container(
            width: 50,
            height: 50,
            color: Colors.blue,
          ),
        ],
      ),
    );
  }
}
```

<img width="450" alt="스크린샷 2024-10-06 오후 10 39 38" src="https://github.com/user-attachments/assets/c4f41678-1617-4e5f-b7a8-9298557a00d6">

<br>

2. Positioned 위젯으로 위치 조정하기

- css에서의 position:absolute와 비슷한 효과의 위젯
- Stack 위젯 안에서 위치를 조정할 때 사용
- Positioned 위젯의 속성
  - bottom : 아래쪽 위치
  - left : 왼쪽 위치
  - right : 오른쪽 위치
  - top : 위쪽 위치
- left, right 값을 동시에 줄 경우 위치를 맞추기 위해서 위젯의 크기가 늘어나는 속성이 있다. (top, bottom도 마찬가지)

```dart
// cam_screen.dart
//...
body: Stack(
  children: [
    Container(
      color: Colors.red,
    ),
    Container(
      width: 120,
      height: 160,
      color: Colors.blue,
    ),
    Positioned(
      bottom: 16.0,
      left: 16.0,
      right: 16.0,
      child: ElevatedButton(
        onPressed: () {},
        child: Text('나가기'),
      ),
    )
  ],
),
```

<img width="450" alt="스크린샷 2024-10-06 오후 10 47 05" src="https://github.com/user-attachments/assets/c3734c6c-a29c-4e56-9482-c9fed91ba6c2">



<br>
<br>

### RTC 엔진 초기화하기

- 이 부분부터는 의문이 드는 점들이 있을 수 있는데, 이유가 있어서 라기보다는 Agora라는 회사가 본인들의 서비스를 사용할 수 있도록 정의를 이렇게 해놓은 것이라는 점을 알아두자 !

- Permission 상태:
  - denied: 거부된 상태. 사용자가 권한을 거부했지만, 앱에서 다시 요청할 수 있음.
  - granted: 허용된 상태. 권한이 부여됨.
  - restricted: iOS 전용. 제한된 상태. 부모 통제 등으로 인해 앱이 특정 기능을 사용할 수 없는 상태.
  - limited: iOS 전용. 제한적 허용 상태. 사진 라이브러리에 대한 제한된 접근 권한을 의미함.
  - permanently_denied: Android 전용. 영구 거부 상태. 사용자가 "다시 묻지 않음" 옵션을 선택하고 거부한 경우.
  - provisional: iOS 전용. 임시 허용 상태. 사용자가 임시로 권한을 허용한 상태.

참고:
- 'denied'와 'permanently_denied'의 차이: 'denied'는 다시 요청 가능하지만, 'permanently_denied'는 설정 앱을 통해서만 변경 가능.
- 'denied'와 'granted'는 iOS와 Android 모두에서 사용됨.
- 정확한 상태와 동작은 사용 중인 permission_handler 패키지의 버전에 따라 다를 수 있음.

```dart
// cam_screen.dart

import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:video_call/const/keys.dart';

class CamScreen extends StatefulWidget {
  const CamScreen({super.key});

  @override
  State<CamScreen> createState() => _CamScreenState();
}

class _CamScreenState extends State<CamScreen> {
  RtcEngine? engine;

  int uid = 0;

  init() async {
    final resp = await [Permission.camera, Permission.microphone].request();

    final cameraPermission = resp[Permission.camera];
    final microphonePermission = resp[Permission.microphone];

    if (cameraPermission != PermissionStatus.granted ||
        microphonePermission != PermissionStatus.granted) {
      throw '카메라 또는 마이크 권한이 없습니다.';
    }

    if (engine == null) {
      engine = createAgoraRtcEngine();

      await engine!.initialize(
        RtcEngineContext(
          appId: appId,
        ),
      );

      await engine!.enableVideo();
      await engine!.startPreview();

      ChannelMediaOptions options = ChannelMediaOptions();

      await engine!.joinChannel(
        token: token,
        channelId: channelName,
        uid: uid,
        options: options,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LIVE'),
      ),
      body: Stack(
        children: [
          Container(
            color: Colors.red,
          ),
          Container(
            width: 120,
            height: 160,
            color: Colors.blue,
          ),
          Positioned(
            bottom: 16.0,
            left: 16.0,
            right: 16.0,
            child: ElevatedButton(
              onPressed: () {},
              child: Text('나가기'),
            ),
          )
        ],
      ),
    );
  }
}
```

<br>

### 나를 찍고있는 카메라 화면 보여주기

<br>

### 상대방 카메라 화면 보여주기

<br>

### 프로젝트 마무리하기

<br>