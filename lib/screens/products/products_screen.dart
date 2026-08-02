import 'package:flutter/material.dart';

import '../../models/product_model.dart';
import '../../services/product_service.dart';



class ProductsScreen extends StatefulWidget {

  const ProductsScreen({super.key});


  @override
  State<ProductsScreen> createState() => _ProductsScreenState();

}



class _ProductsScreenState extends State<ProductsScreen> {


  final service = ProductService();


  List<ProductModel> products = [];



  final nameController =
      TextEditingController();


  final priceController =
      TextEditingController();


  final quantityController =
      TextEditingController();




  @override
  void initState() {

    super.initState();

    loadProducts();

  }





  void loadProducts() async {


    products =
        await service.getProducts();


    setState(() {});

  }





  void addProduct() async {


    await service.addProduct(

      ProductModel(

        name: nameController.text,

        price:
        double.parse(priceController.text),

        quantity:
        int.parse(quantityController.text),

      ),

    );



    nameController.clear();

    priceController.clear();

    quantityController.clear();



    loadProducts();


  }





  void showAddDialog(){


    showDialog(

      context: context,

      builder:(context){


        return AlertDialog(


          title:
          const Text("إضافة منتج"),



          content:

          Column(

            mainAxisSize:
            MainAxisSize.min,


            children:[


              TextField(

                controller:nameController,

                decoration:
                const InputDecoration(

                  labelText:"اسم المنتج"

                ),

              ),



              TextField(

                controller:priceController,

                keyboardType:
                TextInputType.number,

                decoration:
                const InputDecoration(

                    labelText:"السعر"

                ),

              ),



              TextField(

                controller:quantityController,

                keyboardType:
                TextInputType.number,

                decoration:
                const InputDecoration(

                    labelText:"الكمية"

                ),

              ),



            ],

          ),



          actions:[


            ElevatedButton(

              onPressed:(){


                addProduct();


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
        const Text("المستودع"),

      ),



      floatingActionButton:

      FloatingActionButton(

        onPressed:
        showAddDialog,

        child:
        const Icon(Icons.add),

      ),




      body:

      ListView.builder(


        itemCount:
        products.length,


        itemBuilder:(context,index){


          final product =
          products[index];



          return Card(


            child:
            ListTile(


              title:
              Text(product.name),



              subtitle:
              Text(

                "السعر: ${product.price} | الكمية: ${product.quantity}",

              ),



              trailing:

              IconButton(

                icon:
                const Icon(Icons.delete),


                onPressed:() async {


                  await service.deleteProduct(

                      product.id!

                  );


                  loadProducts();


                },


              ),



            ),


          );


        },


      ),


    );


  }


}
