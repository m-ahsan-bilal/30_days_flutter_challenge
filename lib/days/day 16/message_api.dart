import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_challenge/main.dart';

class FirebaseApi {
  // create an instance of firebase messaging
  final _firebaseMessaging = FirebaseMessaging.instance;

  // functo initialize notifications
  Future<void> initNotifications() async {
    // request permisssion from user (will prompt user)
    await _firebaseMessaging.requestPermission();
    // fetch the fcm token for this device
    final fCMToken = await _firebaseMessaging.getToken();
    // print the token (normally you will  send this to your server)
    print('Tokken: $fCMToken');

    //initilaize further settings for eCH NOTIFICATION
    initPushNotifications();
  }

  // function to handle received messages
  void handleMessage(RemoteMessage? message) {
    // if the message is null do nothing
    if (message == null) return;
    // navigate to new screen when message is received and user taps notification
    navigatorKey.currentState?.pushNamed(
      '/day_16',
      arguments: message,
    );
  }

  Future initPushNotifications() async {
    // handle notification whhen the app is terminnated and now opened
    FirebaseMessaging.instance.getInitialMessage().then(handleMessage);
    // attach event listeneres for when a notification opens the app
    FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
  }
}
