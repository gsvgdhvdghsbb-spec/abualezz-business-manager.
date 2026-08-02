import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

import '../database/database_helper.dart';



class BackupService {


  final dbHelper =
  DatabaseHelper();




  Future<String> createBackup() async {



    Directory directory =
    await getApplicationDocumentsDirectory();



    String databasePath =
    join(

      await getDatabasesPath(),

      "abu_al_ezz.db",

    );



    File databaseFile =
    File(databasePath);



    String backupPath =
    join(

      directory.path,

      "abu_al_ezz_backup.db",

    );



    await databaseFile.copy(

      backupPath,

    );



    return backupPath;



  }






  Future<void> restoreBackup(

      String path

      ) async {



    String databasePath =
    join(

      await getDatabasesPath(),

      "abu_al_ezz.db",

    );



    File backupFile =
    File(path);



    await backupFile.copy(

      databasePath,

    );



  }


}
