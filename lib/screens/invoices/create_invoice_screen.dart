import 'package:flutter/material.dart';

import '../../models/invoice_model.dart';
import '../../models/invoice_item_model.dart';
import '../../services/invoice_service.dart';
import '../../services/data_service.dart';



class CreateInvoiceScreen extends StatefulWidget {


  const CreateInvoiceScreen({super.key});


  @override
  State<CreateInvoiceScreen> createState() =>
      _CreateInvoiceScreenState();

}





class _CreateInvoiceScreenState
    extends State<CreateInvoiceScreen> {


  final dataService = DataService();

  final invoiceService = InvoiceService();



  List<Map<String,dynamic>> customers = [];

  List<Map<String,dynamic>> products = [];



  String? selectedCustomer;

  Map<String,dynamic>? selectedProduct;



  List<InvoiceItemModel> items = [];



  final paidController =
      TextEditingController();





  @override
  void initState(){

    super.initState();

    loadData();

  }





  void loadData() async{


    customers =
    await dataService.getCustomers();


    products =
    await dataService.getProducts();


    setState((){});


  }





  double get total {


    double value = 0;


    for(var item in items){

      value += item.total;

    }


    return value;


  }






  void addProduct(){


    if(selectedProduct == null){

      return;

    }



    setState((){


      items.add(

        InvoiceItemModel(

          productName:
          selectedProduct!["name"],

          price:
          selectedProduct!["price"],

          quantity:1,

          total:
          selectedProduct!["price"],

        ),

      );



    });



  }





  void saveInvoice() async{


    double paid =

    double.tryParse(
        paidController.text
    ) ?? 0;



    await invoiceService.saveInvoice(

      InvoiceModel(

        customer:
        selectedCustomer ?? "",

        total:
        total,

        paid:
        paid,

        remaining:
        total-paid,

        date:
        DateTime.now().toString(),

      ),

      items,

    );



    Navigator.pop(context);



  }






  @override
  Widget build(BuildContext context){


    return Scaffold(


      appBar:

      AppBar(

        title:
        const Text("إنشاء فاتورة"),

      ),




      body:

      Padding(

        padding:
        const EdgeInsets.all(15),


        child:

        Column(

          children:[



            DropdownButtonFormField<String>(

              decoration:
              const InputDecoration(

                labelText:
                "اختيار العميل",

              ),


              items:

              customers.map((c){

                return DropdownMenuItem(

                  value:
                  c["name"],

                  child:
                  Text(c["name"]),

                );


              }).toList(),



              onChanged:(value){

                setState((){

                  selectedCustomer=value;

                });

              },


            ),




            const SizedBox(height:15),





            DropdownButtonFormField<Map<String,dynamic>>(

              decoration:
              const InputDecoration(

                labelText:
                "اختيار المنتج",

              ),


              items:

              products.map((p){


                return DropdownMenuItem(

                  value:p,

                  child:

                  Text(

                    "${p["name"]} - ${p["price"]}",

                  ),

                );


              }).toList(),




              onChanged:(value){

                selectedProduct=value;

              },


            ),





            ElevatedButton(

              onPressed:addProduct,

              child:
              const Text(
                "إضافة المنتج",
              ),

            ),




            Expanded(

              child:

              ListView.builder(

                itemCount:
                items.length,


                itemBuilder:(context,index){


                  final item =
                  items[index];


                  return ListTile(

                    title:
                    Text(item.productName),


                    subtitle:

                    Text(

                      "${item.price}",

                    ),


                  );


                },

              ),

            ),





            Text(

              "الإجمالي: $total",

              style:
              const TextStyle(

                fontSize:20,

                fontWeight:
                FontWeight.bold,

              ),

            ),




            TextField(

              controller:
              paidController,

              keyboardType:
              TextInputType.number,


              decoration:

              const InputDecoration(

                labelText:
                "المبلغ المدفوع",

              ),

            ),




            ElevatedButton(

              onPressed:
              saveInvoice,


              child:
              const Text(

                "حفظ الفاتورة",

              ),


            ),


          ],

        ),

      ),


    );


  }


}
