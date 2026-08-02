import '../database/database_helper.dart';
import '../models/invoice_model.dart';
import '../models/invoice_item_model.dart';



class InvoiceService {


  final db = DatabaseHelper();





  Future<int> saveInvoice(

      InvoiceModel invoice,

      List<InvoiceItemModel> items,

      ) async {



    final database =
    await db.database;



    int invoiceId =
    await database.insert(

      "invoices",

      invoice.toMap(),

    );





    for(var item in items){


      await database.insert(

        "invoice_items",

        {

          "invoiceId": invoiceId,

          "productName":
          item.productName,

          "price":
          item.price,

          "quantity":
          item.quantity,

          "total":
          item.total,

        },

      );



      await database.rawUpdate(

        '''

        UPDATE products

        SET quantity = quantity - ?

        WHERE name = ?

        ''',

        [

          item.quantity,

          item.productName,

        ],

      );



    }




    return invoiceId;



  }






  Future<List<InvoiceModel>> getInvoices() async{


    final database =
    await db.database;



    final data =
    await database.query(

      "invoices",

      orderBy:
      "id DESC",

    );



    return data

        .map(

          (e)=>InvoiceModel.fromMap(e),

    )

        .toList();


  }







  Future<List<InvoiceItemModel>> getInvoiceItems(

      int invoiceId

      ) async{


    final database =
    await db.database;



    final data =
    await database.query(

      "invoice_items",

      where:
      "invoiceId=?",

      whereArgs:
      [invoiceId],

    );



    return data

        .map(

          (e)=>InvoiceItemModel.fromMap(e),

    )

        .toList();


  }


}
