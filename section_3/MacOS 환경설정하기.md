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

https://developer.android.com/studio?hl=ko


![스크린샷 2024-07-17 오후 11 51 33](https://github.com/user-attachments/assets/3f962ec8-cb50-468b-805b-d25cce0fb7a5)

![스크린샷 2024-07-17 오후 11 51 46](https://github.com/user-attachments/assets/a10f2354-c2c4-47fe-86a7-12222a67ad9e)

![스크린샷 2024-07-17 오후 11 51 40](https://github.com/user-attachments/assets/083890e7-276d-4249-9bce-a66ad24172a9)

![스크린샷 2024-07-17 오후 11 56 43](https://github.com/user-attachments/assets/6cba1099-a0a2-4972-b894-a0db8eb85b04)
![스크린샷 2024-07-17 오후 11 56 39](https://github.com/user-attachments/assets/cc751eaf-7cc5-4511-9b6f-fc54236ec11a)
![스크린샷 2024-07-17 오후 11 54 34](https://github.com/user-attachments/assets/cb6c21cf-2769-4d9a-b47d-3169a8d62c5b)
![스크린샷 2024-07-17 오후 11 59 08](https://github.com/user-attachments/assets/cff921c3-b999-4fb4-87b5-05b0fd21daae)
![스크린샷 2024-07-17 오후 11 53 32](https://github.com/user-attachments/assets/73eb1f02-202c-4574-bf16-6500d0e168b2)

Android Home 환경변수 등록 코드

>$ export ANDROID_HOME={경로}

예시
>$ export ANDROID_HOME=/Users/1gyou1/Library/Android/sdk

![스크린샷 2024-07-18 오전 12 11 01](https://github.com/user-attachments/assets/db022257-60b5-4f60-a6d5-a33bcef9c333)

Android License 동의 커맨드

>$ flutter doctor --android-licenses

![스크린샷 2024-07-18 오전 12 13 24](https://github.com/user-attachments/assets/73fdc6a8-59c3-4169-8b30-f896644bf8d5)

### Android Emulator 세팅하기













참고 url

https://codefactory.notion.site/Flutter-Mac-df8222ac8afa4446ab03ae2980ef6591

https://www.notion.so/df8222ac8afa4446ab03ae2980ef6591?pvs=21

https://linktr.ee/codefactory_official