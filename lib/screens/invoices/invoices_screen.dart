import 'package:flutter/material.dart';

import '../../models/invoice_model.dart';
import '../../models/invoice_item_model.dart';

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





  void loadInvoices() async {


    invoices =
    await service.getInvoices();


    setState((){});


  }







  void printInvoice(
      InvoiceModel invoice
      ) async {



    List<InvoiceItemModel> items =

    await service.getInvoiceItems(

      invoice.id!,

    );



    await pdfService.generateInvoicePdf(

      invoice,

      items,

    );



  }






  @override
  Widget build(BuildContext context){


    return Scaffold(



      appBar:

      AppBar(

        title:
        const Text(
          "الفواتير",
        ),

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





              trailing:

              IconButton(


                icon:

                const Icon(

                  Icons.picture_as_pdf,

                ),



                onPressed:(){

                  printInvoice(invoice);

                },


              ),



            ),


          );


        },


      ),


    );


  }


}
