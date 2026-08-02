import '../database/database_helper.dart';


class ReportService {


  final db = DatabaseHelper();



  Future<double> getTotalSales() async {


    final database =
    await db.database;


    final result =
    await database.rawQuery(

      "SELECT SUM(total) as total FROM invoices"

    );


    return result.first["total"] == null
        ? 0
        : result.first["total"] as double;


  }





  Future<double> getTotalPaid() async {


    final database =
    await db.database;


    final result =
    await database.rawQuery(

        "SELECT SUM(paid) as paid FROM invoices"

    );


    return result.first["paid"] == null
        ? 0
        : result.first["paid"] as double;


  }





  Future<double> getTotalDebt() async {


    final database =
    await db.database;


    final result =
    await database.rawQuery(

      "SELECT SUM(remaining) as debt FROM invoices"

    );


    return result.first["debt"] == null
        ? 0
        : result.first["debt"] as double;


  }





  Future<double> getTotalExpenses() async {


    final database =
    await db.database;


    final result =
    await database.rawQuery(

      "SELECT SUM(amount) as expenses FROM expenses"

    );


    return result.first["expenses"] == null
        ? 0
        : result.first["expenses"] as double;


  }



}
