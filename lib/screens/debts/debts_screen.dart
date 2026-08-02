import 'package:flutter/material.dart';

import '../../models/debt_model.dart';
import '../../services/debt_service.dart';



class DebtsScreen extends StatefulWidget {

  const DebtsScreen({super.key});


  @override
  State<DebtsScreen> createState() =>
      _DebtsScreenState();

}



class _DebtsScreenState extends State<DebtsScreen> {


  final service = DebtService();


  List<DebtModel> debts = [];



  final customerController =
      TextEditingController();


  final amountController =
      TextEditingController();



  @override
  void initState() {

    super.initState();

    loadDebts();

  }




  void loadDebts() async {


    debts = await service.getDebts();


    setState(() {});


  }





  void addDebt() async {


    double amount =
        double.parse(amountController.text);



    await service.addDebt(

      DebtModel(

        customerName:
        customerController.text,

        amount: amount,

        paid: 0,

        remaining: amount,

        date:
        DateTime.now().toString(),

      ),

    );



    customerController.clear();

    amountController.clear();



    loadDebts();


  }






  void paymentDialog(DebtModel debt){


    final payment =
    TextEditingController();



    showDialog(

      context: context,

      builder: (context){


        return AlertDialog(


          title:
          Text("تسديد ${debt.customerName}"),



          content:

          TextField(

            controller: payment,

            keyboardType:
            TextInputType.number,

            decoration:
            const InputDecoration(

              labelText:
              "مبلغ التسديد",

            ),

          ),



          actions:[


            ElevatedButton(

              onPressed:() async {


                double pay =
                double.parse(payment.text);



                double newPaid =
                    debt.paid + pay;



                double remain =
                    debt.amount - newPaid;



                await service.updatePayment(

                  debt.id!,

                  newPaid,

                  remain < 0 ? 0 : remain,

                );



                Navigator.pop(context);


                loadDebts();


              },


              child:
              const Text("حفظ"),


            )


          ],


        );


      },


    );


  }






  void addDialog(){


    showDialog(

      context: context,

      builder:(context){


        return AlertDialog(


          title:
          const Text("إضافة دين"),



          content:

          Column(

            mainAxisSize:
            MainAxisSize.min,


            children:[


              TextField(

                controller:
                customerController,

                decoration:
                const InputDecoration(

                  labelText:
                  "اسم العميل",

                ),

              ),



              TextField(

                controller:
                amountController,

                keyboardType:
                TextInputType.number,

                decoration:
                const InputDecoration(

                  labelText:
                  "المبلغ",

                ),

              ),



            ],

          ),



          actions:[


            ElevatedButton(

              onPressed:(){

                addDebt();

                Navigator.pop(context);


              },

              child:
              const Text("حفظ"),

            )


          ],



        );


      },


    );


  }





  @override
  Widget build(BuildContext context) {


    return Scaffold(


      appBar:

      AppBar(

        title:
        const Text("ديون العملاء"),

      ),




      floatingActionButton:

      FloatingActionButton(

        onPressed:
        addDialog,

        child:
        const Icon(Icons.add),

      ),





      body:

      ListView.builder(


        itemCount:
        debts.length,


        itemBuilder:(context,index){


          final debt =
          debts[index];



          return Card(

            child:

            ListTile(


              title:
              Text(
                debt.customerName,
              ),



              subtitle:

              Text(

                "الدين: ${debt.amount}\n"
                    "المدفوع: ${debt.paid}\n"
                    "المتبقي: ${debt.remaining}",

              ),



              trailing:

              IconButton(

                icon:
                const Icon(Icons.payment),

                onPressed:(){

                  paymentDialog(debt);

                },

              ),



            ),

          );


        },


      ),


    );


  }


}
