import 'package:flutter/material.dart';

import '../customers/customers_screen.dart';
import '../products/products_screen.dart';
import '../suppliers/suppliers_screen.dart';
import '../invoices/invoices_screen.dart';



class DashboardScreen extends StatelessWidget {


const DashboardScreen({super.key});



@override
Widget build(BuildContext context){


return Scaffold(


appBar:AppBar(

title:
const Text("محاسبة أبو العز"),

centerTitle:true,

),



body:

GridView.count(

padding:
const EdgeInsets.all(20),

crossAxisCount:2,


children:[



card(

context,

"العملاء",

Icons.people,

const CustomersScreen()

),



card(

context,

"المستودع",

Icons.inventory,

const ProductsScreen()

),



card(

context,

"الفواتير",

Icons.receipt,

const InvoicesScreen()

),



card(

context,

"الموردون",

Icons.store,

const SuppliersScreen()

),



card(

context,

"الديون",

Icons.money,

Container()

),



card(

context,

"التقارير",

Icons.bar_chart,

Container()

),



],


),


);


}





Widget card(

BuildContext context,

String title,

IconData icon,

Widget page

){


return InkWell(

onTap:(){


Navigator.push(

context,

MaterialPageRoute(

builder:(context)=>page

)

);


},


child:Card(

margin:
const EdgeInsets.all(8),


child:Column(

mainAxisAlignment:
MainAxisAlignment.center,


children:[


Icon(

icon,

size:50,

color:Colors.blue,

),


const SizedBox(height:10),


Text(

title,

style:
const TextStyle(

fontSize:18,

fontWeight:
FontWeight.bold

),

)


],


),


),


);


}


}
