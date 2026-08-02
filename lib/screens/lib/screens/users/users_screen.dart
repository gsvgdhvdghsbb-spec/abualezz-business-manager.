import 'package:flutter/material.dart';

import '../../models/user_model.dart';
import '../../services/user_service.dart';



class UsersScreen extends StatefulWidget {


  const UsersScreen({super.key});


  @override
  State<UsersScreen> createState() =>
      _UsersScreenState();


}




class _UsersScreenState
    extends State<UsersScreen> {


  final service =
  UserService();



  List<UserModel> users = [];



  final username =
  TextEditingController();



  final password =
  TextEditingController();



  String role = "موظف";





  @override
  void initState(){

    super.initState();

    loadUsers();

  }





  void loadUsers() async {


    users =
    await service.getUsers();


    setState((){});


  }






  void addUser() async {



    await service.addUser(

      UserModel(

        username:
        username.text,

        password:
        password.text,

        role:
        role,

      ),

    );



    username.clear();

    password.clear();



    loadUsers();


  }







  void addDialog(){


    showDialog(

      context:context,

      builder:(context){


        return AlertDialog(


          title:

          const Text(

            "إضافة مستخدم",

          ),



          content:

          Column(

            mainAxisSize:

            MainAxisSize.min,



            children:[



              TextField(

                controller:
                username,

                decoration:

                const InputDecoration(

                  labelText:
                  "اسم المستخدم",

                ),

              ),





              TextField(

                controller:
                password,

                decoration:

                const InputDecoration(

                  labelText:
                  "كلمة المرور",

                ),

              ),





              DropdownButton<String>(


                value:

                role,



                items:

                const [


                  DropdownMenuItem(

                    value:"مدير",

                    child:
                    Text("مدير"),

                  ),



                  DropdownMenuItem(

                    value:"موظف",

                    child:
                    Text("موظف"),

                  ),


                ],



                onChanged:(v){

                  setState((){

                    role =
                    v!;

                  });

                },


              ),



            ],

          ),



          actions:[



            ElevatedButton(

              onPressed:(){

                addUser();

                Navigator.pop(context);


              },

              child:

              const Text(

                "حفظ",

              ),


            )


          ],



        );


      },


    );


  }







  @override
  Widget build(BuildContext context){


    return Scaffold(


      appBar:

      AppBar(

        title:

        const Text(

          "المستخدمون",

        ),

      ),




      floatingActionButton:

      FloatingActionButton(

        onPressed:
        addDialog,

        child:

        const Icon(

          Icons.add,

        ),

      ),






      body:

      ListView.builder(


        itemCount:

        users.length,



        itemBuilder:(context,index){



          final user =
          users[index];



          return Card(


            child:

            ListTile(



              title:

              Text(

                user.username,

              ),




              subtitle:

              Text(

                user.role,

              ),





              trailing:

              IconButton(

                icon:

                const Icon(

                  Icons.delete,

                ),


                onPressed:() async {



                  await service.deleteUser(

                    user.id!,

                  );


                  loadUsers();


                },


              ),



            ),


          );


        },


      ),


    );


  }


}
