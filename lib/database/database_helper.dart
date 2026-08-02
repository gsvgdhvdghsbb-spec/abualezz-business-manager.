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


      version: 4,



      onCreate: (db, version) async {



        // العملاء

        await db.execute('''

        CREATE TABLE customers(

        id INTEGER PRIMARY KEY AUTOINCREMENT,

        name TEXT,

        phone TEXT,

        debt REAL

        )

        ''');






        // المنتجات

        await db.execute('''

        CREATE TABLE products(

        id INTEGER PRIMARY KEY AUTOINCREMENT,

        name TEXT,

        price REAL,

        quantity INTEGER

        )

        ''');






        // الفواتير

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






        // تفاصيل الفواتير

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






        // المصروفات

        await db.execute('''

        CREATE TABLE expenses(

        id INTEGER PRIMARY KEY AUTOINCREMENT,

        title TEXT,

        amount REAL,

        date TEXT

        )

        ''');






        // الديون

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






        // المستخدمون

        await db.execute('''

        CREATE TABLE users(

        id INTEGER PRIMARY KEY AUTOINCREMENT,

        username TEXT,

        password TEXT,

        role TEXT

        )

        ''');






        // إنشاء المدير الافتراضي

        await db.insert(

          "users",

          {

            "username": "admin",

            "password": "123456",

            "role": "مدير",

          },

        );



      },


    );


  }



}
