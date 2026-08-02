import 'package:flutter/material.dart';

import '../../models/invoice_model.dart';
import '../../services/invoice_service.dart';
import '../../services/pdf_service.dart';



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


  final pdfService =
  PdfService();



  List<InvoiceModel> invoices = [];





  @override
  void initState(){

    super.initState();

    loadInvoices();

  }





  void loadInvoices() async{


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
                    "المتبقي: ${invoice.remaining}",

              ),





              trailing:

              IconButton(


                icon:

                const Icon(

                  Icons.picture_as_pdf,

                ),




                onPressed:() async {



                  await pdfService.generateInvoicePdf(

                    invoice,

                  );



                },

              ),



            ),


          );


        },


      ),


    );


  }


}
