import 'package:flutter/material.dart';

import '../../models/expense_model.dart';
import '../../services/expense_service.dart';



class ExpensesScreen extends StatefulWidget{

const ExpensesScreen({super.key});


@override
State<ExpensesScreen> createState()
=> _ExpensesScreenState();


}



class _ExpensesScreenState
extends State<ExpensesScreen>{


final service =
ExpenseService();


List<ExpenseModel> expenses=[];



final title =
TextEditingController();


final amount =
TextEditingController();



@override
void initState(){

super.initState();

load();

}



void load() async{

expenses =
await service.getExpenses();

setState((){});

}



void add() async{


await service.addExpense(

ExpenseModel(

title:title.text,

amount:
double.parse(amount.text),

date:
DateTime.now().toString(),

)

);



load();

title.clear();

amount.clear();


}




void dialog(){


showDialog(

context:context,

builder:(context){

return AlertDialog(

title:
const Text("مصروف جديد"),


content:

Column(

mainAxisSize:
MainAxisSize.min,


children:[


TextField(

controller:title,

decoration:
const InputDecoration(
labelText:"البيان"
),

),



TextField(

controller:amount,

keyboardType:
TextInputType.number,

decoration:
const InputDecoration(
labelText:"المبلغ"
),

),


],


),



actions:[

ElevatedButton(

onPressed:(){

add();

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
const Text("المصروفات")

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
expenses.length,


itemBuilder:(context,index){


final e =
expenses[index];


return Card(

child:

ListTile(

title:
Text(e.title),


subtitle:
Text(
"المبلغ: ${e.amount}"
),


),

);


},


),



);


}

}
