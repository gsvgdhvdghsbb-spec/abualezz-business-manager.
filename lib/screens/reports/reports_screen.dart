import 'package:flutter/material.dart';


class ReportsScreen extends StatelessWidget{


const ReportsScreen({super.key});



@override
Widget build(BuildContext context){


return Scaffold(

appBar:

AppBar(

title:
const Text("التقارير")

),


body:

const Center(

child:

Text(

"تقارير المبيعات والأرباح"

,

style:

TextStyle(

fontSize:20,

fontWeight:FontWeight.bold

)

)

)

);


}


}
