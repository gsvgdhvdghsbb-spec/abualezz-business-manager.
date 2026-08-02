import 'package:flutter/material.dart';

import '../../services/report_service.dart';



class ReportsScreen extends StatefulWidget {


  const ReportsScreen({super.key});



  @override
  State<ReportsScreen> createState() =>
      _ReportsScreenState();


}




class _ReportsScreenState
    extends State<ReportsScreen> {


  final service =
  ReportService();



  double sales = 0;

  double paid = 0;

  double debts = 0;

  double expenses = 0;

  double profit = 0;





  @override
  void initState(){

    super.initState();

    loadReports();

  }






  void loadReports() async{


    sales =
    await service.getTotalSales();


    paid =
    await service.getTotalPaid();


    debts =
    await service.getTotalDebt();


    expenses =
    await service.getTotalExpenses();



    profit =
        sales - expenses;



    setState((){});


  }







  Widget reportCard(

      String title,

      String value,

      IconData icon,

      ){


    return Card(


      elevation:5,


      child:

      ListTile(


        leading:

        Icon(

          icon,

          size:40,

          color:Colors.blue,

        ),



        title:

        Text(

          title,

          style:

          const TextStyle(

            fontSize:18,

            fontWeight:
            FontWeight.bold,

          ),

        ),



        subtitle:

        Text(

          value,

          style:

          const TextStyle(

            fontSize:20,

          ),

        ),


      ),


    );


  }







  @override
  Widget build(BuildContext context){


    return Scaffold(



      appBar:

      AppBar(

        title:

        const Text(

          "التقارير",

        ),

      ),






      body:

      Padding(

        padding:

        const EdgeInsets.all(15),



        child:

        ListView(


          children:[



            reportCard(

              "إجمالي المبيعات",

              "$sales",

              Icons.shopping_cart,

            ),




            reportCard(

              "إجمالي المدفوع",

              "$paid",

              Icons.payments,

            ),





            reportCard(

              "الديون المستحقة",

              "$debts",

              Icons.money_off,

            ),






            reportCard(

              "إجمالي المصروفات",

              "$expenses",

              Icons.money_off_csred,

            ),






            reportCard(

              "صافي الربح",

              "$profit",

              Icons.bar_chart,

            ),



          ],


        ),


      ),


    );


  }


}
