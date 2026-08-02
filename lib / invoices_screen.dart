import 'package:flutter/material.dart';

import 'create_invoice_screen.dart';
import '../../models/invoice_model.dart';
import '../../services/invoice_service.dart';



class InvoicesScreen extends StatefulWidget {

  const InvoicesScreen({super.key});


  @override
  State<InvoicesScreen> createState() =>
      _InvoicesScreenState();

}





class _InvoicesScreenState
    extends State<InvoicesScreen> {


  final service =
  InvoiceService();


  List<InvoiceModel> invoices = [];



  @override
  void initState(){

    super.initState();

    loadInvoices();

  }





  void loadInvoices() async {


    invoices =
    await service.getInvoices();


    setState((){});


  }






  @override
  Widget build(BuildContext context){


    return Scaffold(



      appBar:

      AppBar(

        title:
        const Text("الفواتير"),

      ),





      floatingActionButton:

      FloatingActionButton(

        onPressed:() async {



          await Navigator.push(

            context,

            MaterialPageRoute(

              builder:(context)=>
              const CreateInvoiceScreen(),

            ),

          );



          loadInvoices();



        },



        child:
        const Icon(Icons.add),


      ),






      body:

      ListView.builder(


        itemCount:
        invoices.length,



        itemBuilder:(context,index){


          final invoice =
          invoices[index];



          return Card(


            child:

            ListTile(


              title:

              Text(

                invoice.customer,

              ),



              subtitle:

              Text(

                "الإجمالي: ${invoice.total}\n"
                    "المدفوع: ${invoice.paid}\n"
                    "المتبقي: ${invoice.remaining}",

              ),



            ),


          );


        },



      ),


    );


  }


}
