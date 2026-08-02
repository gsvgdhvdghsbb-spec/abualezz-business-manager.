import '../database/database_helper.dart';
import '../models/invoice_model.dart';


class InvoiceService {


final db = DatabaseHelper();



Future<int> addInvoice(InvoiceModel invoice) async{


final database =
await db.database;


return await database.insert(
"invoices",
invoice.toMap()
);


}



Future<List<InvoiceModel>> getInvoices() async{


final database =
await db.database;


final data =
await database.query("invoices");


return data
.map((e)=>InvoiceModel.fromMap(e))
.toList();


}



}
