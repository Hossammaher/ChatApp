import 'package:chatapp/Pages/ChatPage.dart';
import 'package:chatapp/Pages/RegisterPage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'Pages/LoginPage.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );


  runApp( ChatApp());
}

class ChatApp extends StatelessWidget {
   ChatApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      routes:{
        LoginPage.id :(context) => LoginPage(),
        RegisterPage.id :(context) => RegisterPage(),
        ChatPage.id :(context) => ChatPage(),

      },

      initialRoute: LoginPage.id ,

    );
  }
}


