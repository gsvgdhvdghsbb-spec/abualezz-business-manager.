import 'package:flutter/material.dart';

import '../../services/user_service.dart';
import '../dashboard/dashboard_screen.dart';



class LoginScreen extends StatefulWidget {

  const LoginScreen({super.key});


  @override
  State<LoginScreen> createState() =>
      _LoginScreenState();

}





class _LoginScreenState
    extends State<LoginScreen> {



  final username =
  TextEditingController();



  final password =
  TextEditingController();



  final userService =
  UserService();



  bool hidePassword = true;



  void login() async {



    final user = await userService.login(

      username.text,

      password.text,

    );




    if(user != null){



      Navigator.pushReplacement(

        context,

        MaterialPageRoute(

          builder:(context)=>
          const DashboardScreen(),

        ),

      );



    }

    else{



      ScaffoldMessenger.of(context)
          .showSnackBar(

        const SnackBar(

          content:

          Text(

            "اسم المستخدم أو كلمة المرور غير صحيحة",

          ),

        ),

      );



    }



  }






  @override
  Widget build(BuildContext context){


    return Scaffold(


      backgroundColor:
      const Color(0xff0D1B2A),




      body:

      Center(


        child:

        SingleChildScrollView(


          padding:
          const EdgeInsets.all(25),



          child:

          Column(

            children:[




              const Icon(

                Icons.account_balance,

                color:Colors.blue,

                size:90,

              ),




              const SizedBox(height:20),




              const Text(

                "محاسبة أبو العز",

                style:

                TextStyle(

                  color:Colors.white,

                  fontSize:28,

                  fontWeight:
                  FontWeight.bold,

                ),

              ),




              const SizedBox(height:30),





              TextField(

                controller:username,


                style:

                const TextStyle(

                  color:Colors.white,

                ),



                decoration:

                const InputDecoration(

                  labelText:"اسم المستخدم",

                  prefixIcon:

                  Icon(Icons.person),

                ),


              ),




              const SizedBox(height:20),





              TextField(

                controller:password,

                obscureText:
                hidePassword,


                style:

                const TextStyle(

                  color:Colors.white,

                ),




                decoration:

                InputDecoration(

                  labelText:
                  "كلمة المرور",



                  prefixIcon:

                  const Icon(

                    Icons.lock,

                  ),



                  suffixIcon:

                  IconButton(

                    icon:

                    Icon(

                      hidePassword

                          ? Icons.visibility

                          : Icons.visibility_off,

                    ),



                    onPressed:(){


                      setState((){


                        hidePassword =
                        !hidePassword;


                      });


                    },


                  ),


                ),


              ),





              const SizedBox(height:30),





              SizedBox(

                width:
                double.infinity,


                height:55,



                child:

                ElevatedButton(


                  onPressed:

                  login,



                  child:

                  const Text(

                    "تسجيل الدخول",

                    style:

                    TextStyle(

                      fontSize:18,

                    ),

                  ),


                ),

              ),



            ],

          ),

        ),

      ),

    );


  }


}
