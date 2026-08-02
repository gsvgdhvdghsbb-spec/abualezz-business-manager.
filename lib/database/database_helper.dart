import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';



class DatabaseHelper{


static Database? _database;



Future<Database> get database async{


if(_database != null){

return _database!;

}


_database = await initDatabase();


return _database!;


}



Future<Database> initDatabase() async{


String path = join(

await getDatabasesPath(),

"abu_al_ezz.db"

);



return await openDatabase(

path,

version:1,

onCreate:(db,version) async{


await db.execute('''

CREATE TABLE customers(

id INTEGER PRIMARY KEY AUTOINCREMENT,

name TEXT,

phone TEXT,

debt REAL

)

''');



await db.execute('''

CREATE TABLE invoices(

id INTEGER PRIMARY KEY AUTOINCREMENT,

customer TEXT,

total REAL,

date TEXT

)

''');


},

);


}



}
