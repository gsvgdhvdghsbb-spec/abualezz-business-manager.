import 'package:flutter/material.dart';



class AppTheme {


  static ThemeData theme = ThemeData(


    useMaterial3: true,



    colorScheme: ColorScheme.fromSeed(

      seedColor: Colors.blue,

    ),



    scaffoldBackgroundColor:

    const Color(0xffF5F7FA),





    appBarTheme:

    const AppBarTheme(


      centerTitle: true,


      elevation: 0,


      backgroundColor:

      Color(0xff0D1B2A),



      foregroundColor:

      Colors.white,



    ),






    cardTheme:

    CardThemeData(


      elevation: 5,


      shape:

      RoundedRectangleBorder(

        borderRadius:

        BorderRadius.circular(20),

      ),


    ),






    inputDecorationTheme:


    InputDecorationTheme(


      border:

      OutlineInputBorder(


        borderRadius:

        BorderRadius.circular(15),


      ),



      filled:true,


      fillColor:

      Colors.white,



    ),




    elevatedButtonTheme:


    ElevatedButtonThemeData(


      style:

      ElevatedButton.styleFrom(


        minimumSize:

        const Size(

          double.infinity,

          55,

        ),



        shape:

        RoundedRectangleBorder(

          borderRadius:

          BorderRadius.circular(15),

        ),



      ),



    ),



  );


}
