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

        title:

        const Text(

          "محاسبة أبو العز",

        ),

      ),




      body:

      SingleChildScrollView(


        padding:

        const EdgeInsets.all(16),



        child:

        Column(

          crossAxisAlignment:

          CrossAxisAlignment.start,



          children:[



            const Text(

              "مرحباً بك 👋",

              style:

              TextStyle(

                fontSize:24,

                fontWeight:

                FontWeight.bold,

              ),

            ),



            const SizedBox(height:5),



            const Text(

              "إدارة أعمالك بسهولة",

              style:

              TextStyle(

                color:Colors.grey,

              ),

            ),




            const SizedBox(height:20),





            GridView.count(

              shrinkWrap:true,

              physics:

              const NeverScrollableScrollPhysics(),



              crossAxisCount:2,


              crossAxisSpacing:15,

              mainAxisSpacing:15,



              children:[



                dashboardCard(

                  context,

                  "العملاء",

                  Icons.people,

                  Colors.blue,

                  const CustomersScreen(),

                ),




                dashboardCard(

                  context,

                  "المستودع",

                  Icons.inventory,

                  Colors.orange,

                  const ProductsScreen(),

                ),




                dashboardCard(

                  context,

                  "الفواتير",

                  Icons.receipt_long,

                  Colors.green,

                  const InvoicesScreen(),

                ),




                dashboardCard(

                  context,

                  "الديون",

                  Icons.money,

                  Colors.red,

                  const DebtsScreen(),

                ),




                dashboardCard(

                  context,

                  "الموردون",

                  Icons.store,

                  Colors.purple,

                  const SuppliersScreen(),

                ),




                dashboardCard(

                  context,

                  "المصروفات",

                  Icons.money_off,

                  Colors.brown,

                  const ExpensesScreen(),

                ),




                dashboardCard(

                  context,

                  "التقارير",

                  Icons.bar_chart,

                  Colors.teal,

                  const ReportsScreen(),

                ),




                dashboardCard(

                  context,

                  "الإعدادات",

                  Icons.settings,

                  Colors.grey,

                  const SettingsScreen(),

                ),



              ],



            ),



          ],



        ),



      ),



    );


  }






  Widget dashboardCard(

      BuildContext context,

      String title,

      IconData icon,

      Color color,

      Widget page,

      ){



    return InkWell(



      onTap:(){


        Navigator.push(

          context,

          MaterialPageRoute(

            builder:(context)=>page,

          ),

        );


      },



      child:Card(


        child:

        Column(

          mainAxisAlignment:

          MainAxisAlignment.center,


          children:[



            CircleAvatar(

              radius:30,

              backgroundColor:

              color.withOpacity(0.15),


              child:

              Icon(

                icon,

                size:35,

                color:color,

              ),

            ),




            const SizedBox(height:12),




            Text(

              title,

              style:

              const TextStyle(

                fontSize:17,

                fontWeight:

                FontWeight.bold,

              ),

            ),



          ],


        ),



      ),



    );


  }


}
