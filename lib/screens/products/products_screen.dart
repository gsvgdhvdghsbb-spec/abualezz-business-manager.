import 'package:flutter/material.dart';

import '../../models/product_model.dart';
import '../../services/product_service.dart';



class ProductsScreen extends StatefulWidget{

const ProductsScreen({super.key});


@override
State<ProductsScreen> createState()
=> _ProductsScreenState();

}



class _ProductsScreenState
extends State<ProductsScreen>{


final service = ProductService();


List<ProductModel> products=[];


final name =
TextEditingController();


final price =
TextEditingController();


final quantity =
TextEditingController();



@override
void initState(){

super.initState();

load();

}



void load() async{

products =
await service.getProducts();

setState((){});

}



void save() async{


await service.addProduct(

ProductModel(

name:name.text,

price:double.parse(price.text),

quantity:int.parse(quantity.text),

)

);


name.clear();

price.clear();

quantity.clear();


load();


}



@override
Widget build(BuildContext context){


return Scaffold(

appBar:AppBar(
title:
const Text("المستودع"),
),


floatingActionButton:
FloatingActionButton(

child:
const Icon(Icons.add),

onPressed:(){


showDialog(

context:context,

builder:(context){

return AlertDialog(

title:
const Text("منتج جديد"),


content:
Column(

mainAxisSize:
MainAxisSize.min,

children:[


TextField(
controller:name,
decoration:
const InputDecoration(
labelText:"اسم المنتج"
),
),


TextField(
controller:price,
decoration:
const InputDecoration(
labelText:"السعر"
),
),


TextField(
controller:quantity,
decoration:
const InputDecoration(
labelText:"الكمية"
),
),


],

),


actions:[

TextButton(

onPressed:(){

save();

Navigator.pop(context);

},

child:
const Text("حفظ"),

)

],

);


}

);


},

),



body:

ListView.builder(

itemCount:
products.length,

itemBuilder:(context,index){


final p =
products[index];


return Card(

child:ListTile(

title:
Text(p.name),


subtitle:
Text(
"السعر: ${p.price} | الكمية: ${p.quantity}"
),


trailing:
IconButton(

icon:
const Icon(Icons.delete),

onPressed:(){

service.deleteProduct(p.id!);

load();

},

),


),

);


},


),


);


}

}
