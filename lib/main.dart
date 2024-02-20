import 'package:flutter/material.dart';

import 'package:notifications/screens/screens.dart';
import 'package:notifications/services/push_notifications_services.dart';
import 'package:notifications/theme/app_theme.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await PushNotificationService.initializeApp();
  
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey();
  final GlobalKey<ScaffoldMessengerState> messengerKey = GlobalKey();


  @override
  void initState() {
    super.initState();

    PushNotificationService.messageStream.listen((message) {
      
      navigatorKey.currentState?.pushNamed('message', arguments: message);
      final snackBar = SnackBar(content: Text(message));
      messengerKey.currentState?.showSnackBar(snackBar);
     });
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'home',
      navigatorKey: navigatorKey,
      scaffoldMessengerKey: messengerKey,
      routes: {
        'home':( _ ) => const HomeScreen(),
        'message':( _ ) => const MessageScreen(),
      },
      theme: AppTheme.lightTheme,
    );
  }
}