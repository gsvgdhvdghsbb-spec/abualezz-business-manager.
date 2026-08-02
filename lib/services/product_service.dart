import '../database/database_helper.dart';
import '../models/product_model.dart';


class ProductService {


final db = DatabaseHelper();



Future<int> addProduct(ProductModel product) async{

final database = await db.database;


return await database.insert(
"products",
product.toMap()
);

}



Future<List<ProductModel>> getProducts() async{

final database = await db.database;


final data =
await database.query("products");


return data
.map((e)=>ProductModel.fromMap(e))
.toList();

}



Future<int> deleteProduct(int id) async{

final database = await db.database;


return await database.delete(
"products",
where:"id=?",
whereArgs:[id]
);


}


}
