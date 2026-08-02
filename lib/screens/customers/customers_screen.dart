import 'package:flutter/material.dart';
import '../../models/customer_model.dart';
import '../../services/database_service.dart';


class CustomersScreen extends StatefulWidget {

const CustomersScreen({super.key});


@override
State<CustomersScreen> createState()
=> _CustomersScreenState();

}



class _CustomersScreenState 
extends State<CustomersScreen>{


final service = DatabaseService();


List<CustomerModel> customers=[];


final name =
TextEditingController();


final phone =
TextEditingController();



@override
void initState(){

super.initState();

loadCustomers();

}



void loadCustomers() async {


customers =
await service.getCustomers();


setState((){});


}



void addCustomer() async{


await service.addCustomer(

CustomerModel(

name:name.text,

phone:phone.text,

debt:0,

)

);


name.clear();

phone.clear();


loadCustomers();


}




@override
Widget build(BuildContext context){


return Scaffold(


appBar:AppBar(

title:
const Text("العملاء"),

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
const Text("إضافة عميل"),


content:

Column(

mainAxisSize:
MainAxisSize.min,

children:[


TextField(

controller:name,

decoration:
const InputDecoration(
labelText:"اسم العميل"
),

),


TextField(

controller:phone,

decoration:
const InputDecoration(
labelText:"رقم الهاتف"
),

),


],

),


actions:[

TextButton(

onPressed:(){

addCustomer();

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
customers.length,

itemBuilder:(context,index){


final c =
customers[index];


return Card(

child:ListTile(

title:
Text(c.name),


subtitle:
Text(
"الهاتف: ${c.phone}\nالدين: ${c.debt}"
),


trailing:

IconButton(

icon:
const Icon(Icons.delete),

onPressed:(){

service.deleteCustomer(c.id!);

loadCustomers();

},

),


),

);


},


),



);


}

}
