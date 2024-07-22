# MacOS 환경설정하기

### 소개 및 시스템 사양 확인하기

① 하단 페이지 접속 -> macOS 클릭 -> ios 선택. -> 맥 OS 설치 가이드 페이지로 이동

https://docs.flutter.dev/get-started/install/macos

<br>

② 맥 사양 확인하기 (M칩인지 인텔인지) 

<br>

내 맥북은 M2

![스크린샷 2024-07-17 오후 11 15 12](https://github.com/user-attachments/assets/10340e9f-0680-43eb-958e-fdcb638afd57)

<br>
<br>

### [M시리즈 애플 실리콘만] Rosetta 설치하기

① 페이지 내에 코드 복사, 터미널에 붙여넣기

https://docs.flutter.dev/get-started/install/macos/mobile-ios

>$ sudo softwareupdate --install-rosetta --agree-to-license

![스크린샷 2024-07-17 오후 10 54 45](https://github.com/user-attachments/assets/6ff81ae4-7730-415b-81a9-3f68bbd1d7ea)

<br>
<br>

### homebrew 설치하기

① 하단 페이지에 접속해서 터미널에 명령어 작성하여 설치

https://brew.sh/ko/

>$ /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

<br>

② Shell 타입 확인 커맨드
>$ echo $SHELL

<br>

③ Brew 환경변수에 등록하는 커맨드
- /bin/zsh 가 나올 경우
```
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> $HOME/.zshrc
eval "$(/opt/homebrew/bin/brew shellenv)"
```
- /bin/bash 가 나올 경우
```
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> $HOME/.bashrc
eval "$(/opt/homebrew/bin/brew shellenv)"
```

<br>

내 맥북은 /bin/zsh

![스크린샷 2024-07-17 오후 11 00 44](https://github.com/user-attachments/assets/35234d55-935a-4e4d-8c9c-668a103b19a7)

<br>
<br>

### Flutter SDK 설치 방법 1 - Brew로 설치하기

① Brew를 이용한 Flutter 설치 커맨드

>$ brew install --cask flutter

![스크린샷 2024-07-17 오후 11 03 00](https://github.com/user-attachments/assets/7e05a646-9e42-4c16-bf36-626edd125256)

<br>

② homebrew 사용해서 flutter를 설치했을때 하단과 같이 체크된 flutter 설치 현황 리스트가 나오면 된다.
모든게 다 체크되어있지 않고, 에러가 있어도 리스트만 나오면 됨 ! -> 추후에 에러 없앨 예정

>$ flutter doctor

![스크린샷 2024-07-21 오후 1 36 02](https://github.com/user-attachments/assets/7c681ef6-accb-4b90-bd0f-2077b666f93b)

<br>
<br>

### Flutter SDK 설치 방법 - 직접 설치하기(Brew로 설치가 잘 안될 경우)

하단 페이지에서 플러터 SDK 직접 다운로드해서 사용

https://docs.flutter.dev/get-started/install/macos/mobile-ios

- 저는 Brew로 설치가 잘 됐기 때문에 skip...!

<br>
<br>

### XCode 설치하기

① 애플스토어에서 Xcode 검색하고 설치하기

![스크린샷 2024-07-17 오후 11 19 54](https://github.com/user-attachments/assets/d90ee637-f0d5-42d4-8098-5ade69d36807)

<br>

② Xcode를 실행하기 전 MacOS XCode 설치 커맨드 입력

```
sudo xcode-select --install
sudo xcode-select -s /Applications/Xcode.app/Contents/Developer
sudo xcodebuild -runFirstLaunch
```

이미 실행한 적이 있어서 이렇게 뜸.

![스크린샷 2024-07-17 오후 11 22 20](https://github.com/user-attachments/assets/1cb2908c-a880-49ca-be3e-89384d5fc2bd)

<br>

③ Xcode 실행한 화면

![스크린샷 2024-07-17 오후 11 23 45](https://github.com/user-attachments/assets/d4ad3f59-f9c2-4c5b-82a9-b72dc3798c8a)

<br>

④ 디바이스 기기 추가하기

xcode 실행 -> 메뉴 window -> devices ans Simulators 클릭
-> 왼쪽 하단 + 버튼 클릭 -> Os version 셀렉트박스 클릭 -> Download more simulator runtimes... 선택

![스크린샷 2024-07-17 오후 11 25 43](https://github.com/user-attachments/assets/7960f8c5-5255-4957-8692-1b9f5cb0d3e8)

![스크린샷-2024-07-17-오후-11 30 11](https://github.com/user-attachments/assets/6e6adc58-e8f3-499d-8b70-008ed7ed0499)

<br>

⑤ 상단 3개 다운로드

![스크린샷 2024-07-17 오후 11 46 34](https://github.com/user-attachments/assets/ead49164-ee87-47df-9884-df189787991b)

<br>
<br>

### Android Studio 설치하기

① 안드로이드 스튜디오 다운받기

하단 페이지에서 다운로드 버튼 클릭하여 다운 받기

https://developer.android.com/studio?hl=ko

![스크린샷 2024-07-22 오후 11 12 19](https://github.com/user-attachments/assets/969fc9ef-b9dd-4b2c-8897-327627c97f1b)

안드로이드 스튜디오 실행 화면

![스크린샷 2024-07-17 오후 11 51 33](https://github.com/user-attachments/assets/3f962ec8-cb50-468b-805b-d25cce0fb7a5)

<br>

② Plugins -> 마켓플레이스 -> Dart, Flutter 다운 받기

![스크린샷 2024-07-17 오후 11 51 46](https://github.com/user-attachments/assets/a10f2354-c2c4-47fe-86a7-12222a67ad9e)

![스크린샷 2024-07-17 오후 11 51 40](https://github.com/user-attachments/assets/083890e7-276d-4249-9bce-a66ad24172a9)

<br>

③ - 1) More Actions -> SDK Manager -> Android SDK Location 경로가 적혀있지 않을 경우 오른쪽 Edit 버튼 클릭

![스샷](https://github.com/user-attachments/assets/089f36ab-845d-46bb-b629-2dd086d16180)

<br>

③ - 2) Android SDK, Android SDK Platform 선택하고 Next 버튼 클릭하여 설치 완료

하면 Android SDK Location에 경로가 생김.

![스크린샷 2024-07-17 오후 11 53 32](https://github.com/user-attachments/assets/73eb1f02-202c-4574-bf16-6500d0e168b2)

![스크린샷 2024-07-17 오후 11 56 39](https://github.com/user-attachments/assets/cc751eaf-7cc5-4511-9b6f-fc54236ec11a)

<br>

④ 안드로이드 API 34 설치

Android API 34 체크 후 Apply 클릭

![스크린샷 2024-07-17 오후 11 59 08](https://github.com/user-attachments/assets/cff921c3-b999-4fb4-87b5-05b0fd21daae)

Confirm Change 다운로드 팝업창이 뜨고, OK 버튼 클릭시 설치 진행.

![스크린샷 2024-07-17 오후 11 54 34](https://github.com/user-attachments/assets/cb6c21cf-2769-4d9a-b47d-3169a8d62c5b)

<br>

⑤ Android SDK -> SDK Tools 하단 목록 체크 후 Apply 버튼 클릭하여 설치

- Android SDK Build-Tools 34
- NDK
- Android SDK Command Line Tools 
- Android Emulator
- Android SDK Platform-Tools

![스크린샷 2024-07-22 오후 11 31 21](https://github.com/user-attachments/assets/fc47a1ab-5e10-4acc-9be6-4da4ff2068d6)

<br>

➅ 경로 복사 후 Android Home 환경변수 코드 등록

경로 복사 - /Users/1gyou1/Library/Android/sdk

환경 변수 설정 진입
>$ vi ~/.zhrc

>$ export ANDROID_HOME={경로}

예시
>$ export ANDROID_HOME=/Users/1gyou1/Library/Android/sdk

![스크린샷 2024-07-18 오전 12 11 01](https://github.com/user-attachments/assets/db022257-60b5-4f60-a6d5-a33bcef9c333)

<br>

➆ Android License 동의 커맨드

flutter doctor 커맨드 입력 후 --android-licenses 관해 오류가 있을 때 설치 해주기

>$ flutter doctor --android-licenses

![스크린샷 2024-07-18 오전 12 13 24](https://github.com/user-attachments/assets/73fdc6a8-59c3-4169-8b30-f896644bf8d5)

<br>
<br>

### Android Emulator 세팅하기

① New Flutter Project 클릭

Flutter SDK path 부분에 입력이 안되어있다면 터미널을 열어서 하단 명령어 입력

>$ flutter doctor -v

입력 후 상단에 나와 있는 경로 복사, 붙여넣기

![스크린샷-2024-07-23-오전-12 20 06](https://github.com/user-attachments/assets/11f16654-172e-49e3-a4e3-919eb39a78ba)


<br>

② New Flutter Project -> Flutter -> Next 버튼 클릭

하단 처럼 ... 클릭하여 test-proj 폴더 생성해서 Create 버튼 클릭

![스크린샷 2024-07-23 오전 12 23 18](https://github.com/user-attachments/assets/9d06cf28-09c1-432b-b444-6efb17a0ccbc)

<br>

③ Device Manager 설정하기

Tools -> Device Manager 클릭하면 오른쪽에 나타남.

![스크린샷 2024-07-23 오전 12 27 08](https://github.com/user-attachments/assets/f88204ef-3d16-4017-8027-b4e34adc10f3)

Create Virtual Device 버튼 클릭

![스크린샷 2024-07-23 오전 12 29 01](https://github.com/user-attachments/assets/d9acf8b2-927b-484b-bbe2-e9458e98c39a)

Pixel 7 pro 선택 -> Next 버튼 클릭

![스크린샷 2024-07-23 오전 12 30 20](https://github.com/user-attachments/assets/1cf99819-4465-4658-8b0d-a5edcf5c8100)

API 34 선택 -> Next 버튼 클릭

![스크린샷 2024-07-23 오전 12 30 52](https://github.com/user-attachments/assets/66ebf79a-c6cb-44da-a439-0e5ca2d8f579)

프로젝트 이름 변경 -> Flutter Inflearn

![스크린샷 2024-07-23 오전 12 34 07](https://github.com/user-attachments/assets/a684ab9b-3162-40e2-a0bb-baa08f72cafe)

고급 설정에서 Internal Storage -> 8GB로 수정

![스크린샷 2024-07-23 오전 12 35 12](https://github.com/user-attachments/assets/6759c108-9be7-4d8c-9540-256bfbfba4dc)

Flutter Inflearn 에뮬레이터 생성

![스크린샷 2024-07-23 오전 12 37 11](https://github.com/user-attachments/assets/9c2a2a6b-74eb-4376-8bd1-f8fa3fe19b92)

<br>

④ Android Studio 메뉴 -> emulator 검색 -> Launch in a tool window 체크 해제 -> OK 버튼 클릭

포커스를 잃어버리고, 창 닫히는 현상 체크 해제 설정

![스크린샷 2024-07-23 오전 12 39 09](https://github.com/user-attachments/assets/79bf3893-19ca-4e86-8447-26d4d582ed0c)

<br>

⑤ emulator 항상 최상단에 위치하도록 설정하기

![스크린샷 2024-07-23 오전 12 44 19](https://github.com/user-attachments/assets/ee35282b-d9eb-4525-a779-262430ce7451)

<br>

⑥ 어떤 기기로 실행할지 설정 가능, 초록색 재생 버튼 누르면 플러터 코드를 실행 할 수 있음.

![스크린샷 2024-07-23 오전 12 46 51](https://github.com/user-attachments/assets/8ef1f45e-d20c-4301-953e-8b395159727c)

![스크린샷 2024-07-23 오전 12 50 29](https://github.com/user-attachments/assets/426a6f50-7cba-4903-b383-dcf62c7d6853)

<br>
<br>

### iOS Simulator 설정하기

① open iOS Simulator

안드로이드 스튜디오에서 open iOS Simulator 선택해도 실행할 수 있음.

![스크린샷 2024-07-23 오전 12 54 22](https://github.com/user-attachments/assets/e5b3a45d-713d-4166-a5a7-0f56fcfb2a92)

<br>

② 메뉴에 Simulator만 뜨고 핸드폰 화면이 안뜰 경우 

하단 이미지 메뉴 타고 가서 최신 버전 -> 아이폰 선택

![스크린샷 2024-07-23 오전 12 55 58](https://github.com/user-attachments/assets/e0390c55-4f79-4936-ae12-6f5125de007a)

<br>

③ 시뮬레이터 항상 최상단에 두는 법

window -> stay on top 메뉴 클릭

![스크린샷 2024-07-23 오전 1 00 27](https://github.com/user-attachments/assets/3bac2700-68eb-4707-ad00-7e6e0d5d47d8)

<br>

➃ 안드로이드 스튜디오에서 iOS 시뮬레이터 실행하기

iPhone 선택하고 재생버튼 클릭

![스크린샷 2024-07-23 오전 1 17 57](https://github.com/user-attachments/assets/8c0ce632-1921-439c-9caa-9b246535042d)

** 하단과 같은 오류 상황이 있었는데, 아이클라우드 동기화 되지 않는 폴더에서 이런 오류가 난다고 함.
실제로 폴더 동기화를 해제하였더니 오류가 사라지고, 정상 작동.

![스크린샷 2024-07-23 오전 1 23 07](https://github.com/user-attachments/assets/e5ff3762-1bfe-4371-b8c3-5a010f26c70a)

<br>
<br>

참고 url

https://codefactory.notion.site/Flutter-Mac-df8222ac8afa4446ab03ae2980ef6591

https://www.notion.so/df8222ac8afa4446ab03ae2980ef6591?pvs=21

https://linktr.ee/codefactory_official