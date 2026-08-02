import '../database/database_helper.dart';


class DataService {


  final db = DatabaseHelper();



  Future<List<Map<String,dynamic>>> getCustomers() async {

    final database =
    await db.database;


    return await database.query(
      "customers",
    );

  }




  Future<List<Map<String,dynamic>>> getProducts() async {

    final database =
    await db.database;


    return await database.query(
      "products",
    );

  }


}
