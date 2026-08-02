import 'package:flutter/material.dart';

import 'core/theme/app_theme.dart';

import 'screens/auth/login_screen.dart';



void main() {


  runApp(

    const AbuAlEzzApp(),

  );


}




class AbuAlEzzApp extends StatelessWidget {


  const AbuAlEzzApp({super.key});



  @override
  Widget build(BuildContext context){


    return MaterialApp(


      debugShowCheckedModeBanner: false,



      title:

      "محاسبة أبو العز",



      theme:

      AppTheme.theme,



      home:

      const LoginScreen(),



    );


  }


}
