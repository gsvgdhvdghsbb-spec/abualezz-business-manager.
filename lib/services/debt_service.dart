import '../database/database_helper.dart';
import '../models/debt_model.dart';



class DebtService {


  final db = DatabaseHelper();




  Future<int> addDebt(DebtModel debt) async {


    final database = await db.database;



    return await database.insert(

      "debts",

      debt.toMap(),

    );


  }





  Future<List<DebtModel>> getDebts() async {


    final database = await db.database;



    final data = await database.query(

      "debts",

      orderBy: "id DESC",

    );



    return data

        .map(

          (e) => DebtModel.fromMap(e),

        )

        .toList();


  }






  Future<int> updatePayment(

      int id,

      double paid,

      double remaining,

      ) async {



    final database = await db.database;



    return await database.update(

      "debts",

      {

        "paid": paid,

        "remaining": remaining,

      },

      where: "id=?",

      whereArgs: [id],

    );


  }





  Future<int> deleteDebt(int id) async {


    final database = await db.database;



    return await database.delete(

      "debts",

      where: "id=?",

      whereArgs: [id],

    );


  }


}
