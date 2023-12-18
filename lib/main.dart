import 'package:chat_messenger/firebase_options.dart';

import 'package:chat_messenger/services/auth/auth_gade.dart';
import 'package:chat_messenger/services/auth/auth_service.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(ChangeNotifierProvider(
    create: (context) => AuthService(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(380, 780),
      minTextAdapt: true,
      splitScreenMode: true,
      child: const MaterialApp(
        title: 'Chat',
        debugShowCheckedModeBanner: false,
        home: AuthGate(),
      ),
    );
  }
}
