import 'package:flutter/material.dart';

import '../customers/customers_screen.dart';
import '../products/products_screen.dart';
import '../suppliers/suppliers_screen.dart';
import '../invoices/invoices_screen.dart';
import '../expenses/expenses_screen.dart';
import '../reports/reports_screen.dart';
import '../settings/settings_screen.dart';
import '../debts/debts_screen.dart';



class DashboardScreen extends StatelessWidget {

  const DashboardScreen({super.key});


  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(

        title: const Text(
          "محاسبة أبو العز",
        ),

        centerTitle: true,

      ),


      body: GridView.count(

        padding: const EdgeInsets.all(20),

        crossAxisCount: 2,

        crossAxisSpacing: 15,

        mainAxisSpacing: 15,


        children: [


          dashboardCard(
            context,
            "العملاء",
            Icons.people,
            const CustomersScreen(),
          ),



          dashboardCard(
            context,
            "المستودع",
            Icons.inventory,
            const ProductsScreen(),
          ),



          dashboardCard(
            context,
            "الفواتير",
            Icons.receipt_long,
            const InvoicesScreen(),
          ),



          dashboardCard(
            context,
            "الموردون",
            Icons.store,
            const SuppliersScreen(),
          ),



          dashboardCard(
            context,
            "الديون",
            Icons.money,
            const DebtsScreen(),
          ),



          dashboardCard(
            context,
            "المصروفات",
            Icons.money_off,
            const ExpensesScreen(),
          ),



          dashboardCard(
            context,
            "التقارير",
            Icons.bar_chart,
            const ReportsScreen(),
          ),



          dashboardCard(
            context,
            "الإعدادات",
            Icons.settings,
            const SettingsScreen(),
          ),


        ],

      ),

    );

  }





  Widget dashboardCard(

      BuildContext context,

      String title,

      IconData icon,

      Widget page,

      ) {


    return InkWell(

      onTap: () {


        Navigator.push(

          context,

          MaterialPageRoute(

            builder: (context) => page,

          ),

        );


      },


      child: Card(

        elevation: 5,


        shape: RoundedRectangleBorder(

          borderRadius:
          BorderRadius.circular(20),

        ),



        child: Column(

          mainAxisAlignment:
          MainAxisAlignment.center,


          children: [


            Icon(

              icon,

              size: 50,

              color: Colors.blue,

            ),



            const SizedBox(height: 15),



            Text(

              title,

              style: const TextStyle(

                fontSize: 18,

                fontWeight: FontWeight.bold,

              ),

            ),


          ],

        ),

      ),

    );

  }


}
