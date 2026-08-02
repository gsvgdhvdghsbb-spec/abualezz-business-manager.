class ProductModel {


int? id;

String name;

double price;

int quantity;



ProductModel({

this.id,

required this.name,

required this.price,

required this.quantity,

});



Map<String,dynamic> toMap(){

return{

"id":id,

"name":name,

"price":price,

"quantity":quantity,

};

}


factory ProductModel.fromMap(
Map<String,dynamic> map){

return ProductModel(

id:map["id"],

name:map["name"],

price:map["price"],

quantity:map["quantity"],

);

}


}
