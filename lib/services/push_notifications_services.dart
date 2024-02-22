
import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:notifications/firebase_options.dart';
import 'package:permission_handler/permission_handler.dart';

class PushNotificationService{

  static FirebaseMessaging messaging = FirebaseMessaging.instance;
  static String? token;
  static final StreamController<String> _messageStream = StreamController.broadcast();

  static Stream<String> get messageStream => _messageStream.stream;


  static Future _backgroundHandler(RemoteMessage message) async{
    _messageStream.add(message.data['producto'] ?? 'No data');
    
  }
  static Future _onMessageHandler(RemoteMessage message) async{
    _messageStream.add(message.data['producto'] ?? 'No data');

  }
  static Future _onMessageOpenApp(RemoteMessage message) async{
    _messageStream.add(message.data['producto'] ?? 'No data');

  }


  static Future initializeApp()async{

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await _requestNotificationPermission();

  token = await FirebaseMessaging.instance.getToken();
  print(token);

  FirebaseMessaging.onBackgroundMessage(_backgroundHandler);
  FirebaseMessaging.onMessage.listen(_onMessageHandler);
  FirebaseMessaging.onMessageOpenedApp.listen(_onMessageOpenApp);

    
  }

  static closeStreams(){
    _messageStream.close();
  }

  static Future<void> _requestNotificationPermission() async {
    var status = await Permission.notification.request();
    if (status.isGranted) {
      print("Permisos de notificación concedidos");
    } else {
      print("Permisos de notificación denegados");
      // Aquí puedes manejar el caso en el que el usuario deniega los permisos.
    }
  }
}