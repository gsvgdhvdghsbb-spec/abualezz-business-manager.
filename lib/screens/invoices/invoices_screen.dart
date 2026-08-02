import 'package:flutter/material.dart';

import '../../models/invoice_model.dart';
import '../../services/invoice_service.dart';



class InvoicesScreen extends StatefulWidget{


const InvoicesScreen({super.key});


@override
State<InvoicesScreen> createState()
=> _InvoicesScreenState();


}



class _InvoicesScreenState
extends State<InvoicesScreen>{



final service =
InvoiceService();



List<InvoiceModel> invoices=[];



final customer =
TextEditingController();


final total =
TextEditingController();


final paid =
TextEditingController();





@override
void initState(){

super.initState();

load();

}




void load() async{


invoices =
await service.getInvoices();


setState((){});


}





void addInvoice() async{


double t =
double.parse(total.text);


double p =
double.parse(paid.text);



await service.addInvoice(

InvoiceModel(

customer:customer.text,

total:t,

paid:p,

remaining:t-p,

date:
DateTime.now()
.toString(),

)

);



load();


customer.clear();

total.clear();

paid.clear();


}





void dialog(){


showDialog(

context:context,

builder:(context){


return AlertDialog(


title:
const Text("فاتورة جديدة"),


content:

Column(

mainAxisSize:
MainAxisSize.min,


children:[


TextField(

controller:customer,

decoration:
const InputDecoration(

labelText:"العميل"

),

),



TextField(

controller:total,

keyboardType:
TextInputType.number,

decoration:
const InputDecoration(

labelText:"الإجمالي"

),

),



TextField(

controller:paid,

keyboardType:
TextInputType.number,

decoration:
const InputDecoration(

labelText:"المدفوع"

),

),


],


),



actions:[


ElevatedButton(

onPressed:(){

addInvoice();

Navigator.pop(context);

},

child:
const Text("حفظ")

)


],



);


}


);


}





@override
Widget build(BuildContext context){


return Scaffold(


appBar:

AppBar(

title:
const Text("الفواتير")

),



floatingActionButton:

FloatingActionButton(

onPressed:dialog,

child:
const Icon(Icons.add),

),



body:

ListView.builder(

itemCount:
invoices.length,


itemBuilder:(context,index){


final i =
invoices[index];


return Card(

child:

ListTile(

title:
Text(i.customer),


subtitle:

Text(

"الإجمالي: ${i.total}\nالمتبقي: ${i.remaining}"

),


),

);


},


),


);


}


}
