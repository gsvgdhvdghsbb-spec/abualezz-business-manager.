class InvoiceItemModel {

  int? id;

  String productName;

  double price;

  int quantity;

  double total;


  InvoiceItemModel({

    this.id,

    required this.productName,

    required this.price,

    required this.quantity,

    required this.total,

  });



  Map<String,dynamic> toMap(){

    return {

      "id": id,

      "productName": productName,

      "price": price,

      "quantity": quantity,

      "total": total,

    };

  }



  factory InvoiceItemModel.fromMap(
      Map<String,dynamic> map){

    return InvoiceItemModel(

      id: map["id"],

      productName: map["productName"],

      price: map["price"],

      quantity: map["quantity"],

      total: map["total"],

    );

  }

}
