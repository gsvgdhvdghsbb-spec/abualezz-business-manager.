import '../database/database_helper.dart';
import '../models/expense_model.dart';


class ExpenseService {


final db = DatabaseHelper();



Future<int> addExpense(ExpenseModel expense) async{


final database = await db.database;


return await database.insert(
"expenses",
expense.toMap()
);


}



Future<List<ExpenseModel>> getExpenses() async{


final database = await db.database;


final data =
await database.query("expenses");


return data
.map((e)=>ExpenseModel.fromMap(e))
.toList();


}


}
