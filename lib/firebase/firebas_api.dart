

import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseApi{
  Future<void> handleBackgroundMessaging(RemoteMessage message) async{

    print("${message}");
  }

  final _firebaseMessaging=FirebaseMessaging.instance;
  Future<void> initNotification() async{
    await _firebaseMessaging.requestPermission();
    final fCMToken=await _firebaseMessaging.getToken();
    
    print("Token ${fCMToken}");
    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessaging);
  }
}