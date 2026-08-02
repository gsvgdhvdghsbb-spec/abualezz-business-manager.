import 'package:flutter/material.dart';

import '../../services/backup_service.dart';
import '../users/users_screen.dart';



class SettingsScreen extends StatefulWidget {

  const SettingsScreen({super.key});


  @override
  State<SettingsScreen> createState() =>
      _SettingsScreenState();

}




class _SettingsScreenState
    extends State<SettingsScreen> {


  final backupService =
  BackupService();





  void createBackup() async {


    String path =
    await backupService.createBackup();



    ScaffoldMessenger.of(context)
        .showSnackBar(

      SnackBar(

        content:

        Text(

          "تم إنشاء النسخة الاحتياطية:\n$path",

        ),

      ),

    );


  }






  @override
  Widget build(BuildContext context){


    return Scaffold(


      appBar:

      AppBar(

        title:

        const Text(

          "الإعدادات",

        ),

      ),





      body:

      Padding(

        padding:

        const EdgeInsets.all(20),



        child:

        Column(

          children:[



            Card(

              child:

              ListTile(

                leading:

                const Icon(

                  Icons.people,

                ),



                title:

                const Text(

                  "إدارة المستخدمين",

                ),



                subtitle:

                const Text(

                  "إضافة الموظفين وتحديد الصلاحيات",

                ),




                onTap:(){



                  Navigator.push(

                    context,

                    MaterialPageRoute(

                      builder:(context)=>

                      const UsersScreen(),

                    ),

                  );



                },

              ),

            ),





            Card(

              child:

              ListTile(

                leading:

                const Icon(

                  Icons.backup,

                ),



                title:

                const Text(

                  "إنشاء نسخة احتياطية",

                ),




                subtitle:

                const Text(

                  "حفظ جميع بيانات التطبيق",

                ),



                onTap:

                createBackup,

              ),

            ),





            Card(

              child:

              ListTile(

                leading:

                const Icon(

                  Icons.restore,

                ),



                title:

                const Text(

                  "استعادة البيانات",

                ),



                subtitle:

                const Text(

                  "استرجاع نسخة محفوظة",

                ),



                onTap:(){



                  ScaffoldMessenger.of(context)
                      .showSnackBar(

                    const SnackBar(

                      content:

                      Text(

                        "سيتم إضافة اختيار الملف لاحقًا",

                      ),

                    ),

                  );



                },


              ),



            ),



          ],


        ),


      ),


    );


  }


}
