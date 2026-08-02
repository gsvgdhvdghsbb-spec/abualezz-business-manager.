import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';



class DatabaseHelper {


  static Database? _database;



  Future<Database> get database async {


    if (_database != null) {

      return _database!;

    }


    _database = await initDatabase();


    return _database!;


  }





  Future<Database> initDatabase() async {


    String path = join(

      await getDatabasesPath(),

      "abu_al_ezz.db",

    );



    return await openDatabase(


      path,


      version: 3,



      onCreate: (db, version) async {



        await db.execute('''

        CREATE TABLE customers(

        id INTEGER PRIMARY KEY AUTOINCREMENT,

        name TEXT,

        phone TEXT,

        debt REAL

        )

        ''');





        await db.execute('''

        CREATE TABLE products(

        id INTEGER PRIMARY KEY AUTOINCREMENT,

        name TEXT,

        price REAL,

        quantity INTEGER

        )

        ''');





        await db.execute('''

        CREATE TABLE invoices(

        id INTEGER PRIMARY KEY AUTOINCREMENT,

        customer TEXT,

        total REAL,

        paid REAL,

        remaining REAL,

        date TEXT

        )

        ''');






        await db.execute('''

        CREATE TABLE invoice_items(

        id INTEGER PRIMARY KEY AUTOINCREMENT,

        invoiceId INTEGER,

        productName TEXT,

        price REAL,

        quantity INTEGER,

        total REAL

        )

        ''');






        await db.execute('''

        CREATE TABLE expenses(

        id INTEGER PRIMARY KEY AUTOINCREMENT,

        title TEXT,

        amount REAL,

        date TEXT

        )

        ''');






        await db.execute('''

        CREATE TABLE debts(

        id INTEGER PRIMARY KEY AUTOINCREMENT,

        customerName TEXT,

        amount REAL,

        paid REAL,

        remaining REAL,

        date TEXT

        )

        ''');



      },


    );


  }



}
