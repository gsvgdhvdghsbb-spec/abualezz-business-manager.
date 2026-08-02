import '../database/database_helper.dart';
import '../models/user_model.dart';



class UserService {


  final db = DatabaseHelper();





  Future<UserModel?> login(

      String username,

      String password,

      ) async {



    final database =
    await db.database;



    final result = await database.query(

      "users",

      where:
      "username=? AND password=?",

      whereArgs: [

        username,

        password,

      ],

    );




    if(result.isNotEmpty){


      return UserModel.fromMap(

        result.first,

      );


    }


    return null;


  }







  Future<int> addUser(

      UserModel user

      ) async {



    final database =
    await db.database;



    return await database.insert(

      "users",

      user.toMap(),

    );


  }







  Future<List<UserModel>> getUsers() async {


    final database =
    await db.database;



    final data =
    await database.query(

      "users",

    );



    return data

        .map(

          (e)=>UserModel.fromMap(e),

    )

        .toList();


  }






  Future<int> deleteUser(

      int id

      ) async {


    final database =
    await db.database;



    return await database.delete(

      "users",

      where:
      "id=?",

      whereArgs:
      [id],

    );


  }



}
