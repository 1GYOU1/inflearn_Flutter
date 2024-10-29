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
  int? remoteUid;

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

      // 특정 이벤트 발생시 호출되는 함수
      engine!.registerEventHandler(
        RtcEngineEventHandler(
          // 채널 참여 성공시 연결 정보, 채널 참여 시간 등
          onJoinChannelSuccess: (RtcConnection connection, int elapsed) {},
          // 채널 나가기 성공시 연결 정보, 채널 나가기 시간 등
          onLeaveChannel: (RtcConnection connection, RtcStats stats) {},

          // 상대 유저 채널 참여시
          onUserJoined: (RtcConnection connection, int remoteUid, int elapsed) {
            // remoteUid - 상대 유저의 uid, elapsed - 채널 참여 시간
            print('onUserJoined: $remoteUid');
            setState(() {
              this.remoteUid = remoteUid;
            });
          },
          onUserOffline: (
            RtcConnection connection, // 채널 정보
            int remoteUid, // 상대 유저의 uid
            UserOfflineReasonType reason, // 상대 유저 오프라인 사유
            /*
            reason 종류
            userOfflineQuit - 사용자가 나간 경우(나가기 버튼)
            userOfflineDropped - 인터넷 끊김 등 통신이 안되는 경우(고의로 나가지 않은 경우)
            userOfflineBecomeAudience - 호스트가 시청자로 전환된 경우
            */
          ) {
            print('onUserOffline: $remoteUid');
            setState(() {
              this.remoteUid = null; // 상대 유저 비디오 뷰 제거
            });
          },
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
      body: FutureBuilder<void>(
          future: init(),
          builder: (context, snapshot) {
            // 권한 체크하는 잠깐의 시간동안 로딩바 노출
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            // 권한 체크 실패시 에러 메세지 노출
            if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            }

            return Stack(
              children: [
                Container(
                  // 상대 유저 비디오 뷰
                  child: renderMainView(),
                ),
                Container(
                  // 내 비디오 뷰
                  width: 120,
                  height: 160,
                  child: AgoraVideoView(
                    controller: VideoViewController(
                      rtcEngine: engine!,
                      canvas: VideoCanvas(uid: uid),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 16.0,
                  left: 16.0,
                  right: 16.0,
                  child: ElevatedButton(
                    onPressed: () {
                      engine!.leaveChannel(); // 채널 나가기
                      engine!.release(); // 엔진 해제
                      Navigator.pop(context);
                    },
                    child: Text('나가기'),
                  ),
                )
              ],
            );
          }),
    );
  }

  renderMainView() {
    if (remoteUid == null) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    return AgoraVideoView(
      controller: VideoViewController.remote(
        rtcEngine: engine!,
        canvas: VideoCanvas(uid: remoteUid),
        connection: RtcConnection(channelId: channelName),
      ),
    );
  }
}
