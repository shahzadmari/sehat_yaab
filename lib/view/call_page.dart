import 'package:flutter/material.dart';
//import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

class CallPage extends StatelessWidget {
  const CallPage({Key? key, required this.callID}) : super(key: key);
  final String callID;

  @override
  Widget build(BuildContext context) {
    return Container();
    /*
    return ZegoUIKitPrebuiltCall(
      appID:
          2043097261, // Fill in the appID that you get from ZEGOCLOUD Admin Console.
      appSign:
          "91e5518d1c1e3d3aa5c90e4ae9b149a1c07c1d10d6b37024af75036835ea32e0", // Fill in the appSign that you get from ZEGOCLOUD Admin Console.
      userID: 'user_id',
      userName: 'user_name',
      callID: callID,
      // You can also use groupVideo/groupVoice/oneOnOneVoice to make more types of calls.
      config: ZegoUIKitPrebuiltCallConfig.oneOnOneVideoCall(),
    );
  
  */
  }
}
